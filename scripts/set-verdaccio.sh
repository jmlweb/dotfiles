#!/bin/sh

REGISTRY="#REGISTRY#"
SCOPE="#SCOPE#"

MODES=("enable" "disable")
BINS=(yarn npm)

function set_verdaccio() {
  if [ -z "$1" ]; then
    ask_mode
    MODE=${MODES[$?]}
  else
    MODE=$1
  fi

  revolver --style 'bouncingBall' start "Setting Verdaccio config"

  for i in "${BINS[@]}"; do
    if [ $MODE = "enable" ]; then
      echo $($i config set registry $REGISTRY)
      echo $($i config set scope $SCOPE)
    else
      echo $($i config delete registry)
      echo $($i config delete scope)
    fi
  done

  revolver stop
}

function ask_mode() {
  echo "Do you want to enable or disable verdaccio?"
  select ed in ${MODES[@]}; do
    if [ "$ed" = "enable" ]; then
      return 0
    fi
    return 1
  done
}

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  export -f set_verdaccio
else
  set_verdaccio "${@}"
  exit ${?}
fi
