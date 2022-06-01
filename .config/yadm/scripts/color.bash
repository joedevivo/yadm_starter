#!/usr/bin/env bash
echo "Loading ANSI Color Library"

ansi="$( dirname "${BASH_SOURCE[0]}" )/ansi"

if command -v curl > /dev/null; then
  curl -fsLo $ansi git.io/ansi 2>&1 /dev/null
  chmod +x $ansi
  yadm add $ansi 2&> /dev/null
else
  echo "Could not download 'ansi', do you have 'curl' installed?"
fi

ansi() {
  echo "$($ansi $@)"
}
