#!/bin/bash

if [[ "$#" -lt 1 ]]; then
  show_help
  exit 1
fi

case "$1" in
  start)
    if [[ "$#" -ne 2 ]]; then
      echo "Uso: $0 start <nombre-repositorio>"
      exit 1
    fi
    start "$2"
    ;;
  stop)
    if [[ "$#" -ne 2 ]]; then
      echo "Uso: $0 stop <nombre-repositorio>"
      exit 1
    fi
    stop "$2"
    ;;
  build)
    if [[ "$#" -ne 2 ]]; then
      echo "Uso: $0 build <nombre-repositorio>"
      exit 1
    fi
    build "$2"
    ;;
  status)
    status
    ;;
  logs)
    if [[ "$#" -ne 2 ]]; then
      echo "Uso: $0 logs <nombre-repositorio>"
      exit 1
    fi
    logs $2
    ;;
  exec)
    if [[ "$#" -ne 2 ]]; then
      echo "Uso: $0 exec <nombre-repositorio>"
      exit 1
    fi
    exec $2
    ;;
  list)
    list
    ;;
  *)
    show_help
    exit 1
esac

exit 0