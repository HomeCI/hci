#!/bin/bash

# Verificar que CIP_REPO_PATH y CIP_CORE_PATH estén definidas
if [[ -z "${CIP_REPO_PATH}" || -z "${CIP_CORE_PATH}" ]]; then
    echo "Error: CIP_REPO_PATH y/o CIP_CORE_PATH no están definidas en las variables de entorno."
    exit 1
fi

REPO_PATHS=("$CIP_REPO_PATH" "$CIP_CORE_PATH")

function start() {
  repo_name=$1
  for path in "${REPO_PATHS[@]}"; do
    if [[ -d "$path/$repo_name" ]]; then
      docker-compose -f "$path/$repo_name/docker-compose.yml" up -d
      return 0
    fi
  done
  echo "No se encontró el repositorio $repo_name"
  return 1
}

function stop() {
  repo_name=$1
  for path in "${REPO_PATHS[@]}"; do
    if [[ -d "$path/$repo_name" ]]; then
      docker-compose -f "$path/$repo_name/docker-compose.yml" stop
      return 0
    fi
  done
  echo "No se encontró el repositorio $repo_name"
  return 1
}

function build() {
  repo_name=$1
  for path in "${REPO_PATHS[@]}"; do
    if [[ -d "$path/$repo_name" ]]; then
      docker-compose -f "$path/$repo_name/docker-compose.yml" up -d --build
      return 0
    fi
  done
  echo "No se encontró el repositorio $repo_name"
  return 1
}

function status() {
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}"
}

function logs() {
  container_name=$1
  container_id=$(docker ps -q --filter "name=$container_name")
  if [[ -z "$container_id" ]]; then
    echo "No se encontró el contenedor $container_name"
    return 1
  fi
  docker logs "$container_id"
}

function exec() {
  container_name=$1
  container_id=$(docker ps -q --filter "name=$container_name")
  if [[ -z "$container_id" ]]; then
    echo "No se encontró el contenedor $container_name"
    return 1
  fi
  docker exec -it "$container_id" /bin/bash
}

function list() {
  echo "REPOSITORIOS"
  echo "-------------"
  for path in "${REPO_PATHS[@]}"; do
    echo "En $path:"
    for dir in "$path"/*; do
      if [[ -d "$dir" ]]; then
        echo "- $(basename "$dir")"
      fi
    done
    echo ""
  done
}