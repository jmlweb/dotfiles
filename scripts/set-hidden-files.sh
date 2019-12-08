#!/bin/sh

function set_hidden_files() {
  if [ "$1" == "visible" ]; then
    mode="YES"
  elif [ "$1" == "hidden" ]; then
    mode="NO"
  else
    echo "Do you want to make the files hidden or visible?"
    select vh in "visible" "hidden"; do
      case $vh in
      visible)
        mode="YES"
        break
        ;;
      hidden)
        mode="NO"
        break
        ;;
      esac
    done
  fi

  revolver --style 'bouncingBall' start "Setting hidden files"

  defaults write com.apple.finder AppleShowAllFiles $mode
  killall Finder /System/Library/CoreServices/Finder.app

  revolver stop
}

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  export -f set_hidden_files
else
  set_hidden_files "${@}"
  exit ${?}
fi
