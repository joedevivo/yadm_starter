#!/usr/bin/env bash
echo "Loading mdsh shell preprocessor"

mdsh="$( dirname "${BASH_SOURCE[0]}" )/mdsh"

if command -v curl > /dev/null; then
  curl -fsLo $mdsh https://raw.githubusercontent.com/bashup/mdsh/master/bin/mdsh 2>&1 /dev/null
  chmod +x $mdsh
  yadm add $mdsh 2&> /dev/null
fi

mdsh() {
  echo "$($mdsh $@)"
}