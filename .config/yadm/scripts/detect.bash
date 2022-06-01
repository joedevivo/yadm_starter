#!/usr/bin/env bash
# YADM Does good bootstrapping. So this is just to get us to a place where yadm
# can take over.
system_type=$(uname -s)
kernel="$(uname -r)"
machine="$(uname -m)"

##
linux=1
wsl=1
macos=1
deb=1
rh=1
arch=1
nix=1
nixos=1
raspi=1
m1=1
brew=1
choco=1

if [ "$system_type" = "Linux" ]; then
  if [[ $kernel =~ microsoft ]]; then wsl=0; fi
  if command -v apt-get &> /dev/null ; then deb=0; fi
  if command -v yum &> /dev/null ; then rh=0; fi
  if command -v yay &> /dev/null ; then arch=0; fi
  if command -v nixos-rebuild &> /dev/null ; then nixos=0; fi
  if [[ $machine =~ armv7l ]]; then raspi=0; fi
fi
if [ "$system_type" = "Darwin" ]; then
  macos=0
  if [[ $machine =~ arm64 ]]; then m1=0; fi
fi
if command -v brew &> /dev/null ; then brew=0; fi
if command -v nix &> /dev/null ; then nix=0; fi
if command -v choco.exe $> /dev/null ; then choco=0; fi

echo "Bootstrapping System:"
if [[ $DEBUG -eq 1 ]]; then
  echo "  is Linux? $linux"
  echo "  is macOS? $macos"
  echo "    is M1?  $m1"
  echo "  is WSL?   $wsl"
  echo "  Apt?      $deb"
  echo "  Yum?      $rh"
  echo "  Yay?      $arch"
  echo "  nix?      $nix"
  echo "  nixos?    $nixos"
  echo "  raspi?    $raspi"
  echo "  brew?     $brew"
  echo "  choco?    $choco"
else
  if [[ $linux -eq 0 ]]; then echo "$(printf '\U2705')  $(ansi --green Linux)"; fi
  if [[ $macos -eq 0 ]]; then echo "$(printf '\U2705')  $(ansi --green macOS)"; fi
  if [[ $m1 -eq 0 ]];    then echo "$(printf '\U2705')  $(ansi --green M1)"; fi
  if [[ $wsl -eq 0 ]];   then echo "$(printf '\U2705')  $(ansi --green WSL)"; fi
  if [[ $deb -eq 0 ]];   then echo "$(printf '\U2705')  $(ansi --green Apt)"; fi
  if [[ $rh -eq 0 ]];    then echo "$(printf '\U2705')  $(ansi --green Yum)"; fi
  if [[ $arch -eq 0 ]];  then echo "$(printf '\U2705')  $(ansi --green Yay)"; fi
  if [[ $nix -eq 0 ]];   then echo "$(printf '\U2705')  $(ansi --green nix)"; fi
  if [[ $nixos -eq 0 ]]; then echo "$(printf '\U2705')  $(ansi --green nixos)"; fi
  if [[ $raspi -eq 0 ]]; then echo "$(printf '\U2705')  $(ansi --green raspi)"; fi
  if [[ $brew -eq 0 ]];  then echo "$(printf '\U2705')  $(ansi --green brew)"; fi
  if [[ $choco -eq 0 ]]; then echo "$(printf '\U2705')  $(ansi --green choco)"; fi
fi