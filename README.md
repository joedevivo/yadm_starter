# YADM Dotfiles Starter

This is a very slim dotfile starter for [yadm](https://yadm.io) that adds the
following features.

## VSCode Support
Use `code ~` and you'll only see files managed by `yadm`. Install the
recommended extensions to have that view refresh on any yadm operation.

Due to the way we're leveraging git-ignores to handle this, adding a new file to
the repo needs to be forced with `-f`.

## mdsh literate bootstrap
Use markdown files with shell codeblocks for bootstrapping, thanks to
[mdsh](https://github.com/bashup/mdsh).

## ansi color for bootstrap
`echo "$(ansi --green XCode Setup)"` in a bootstrap shell block will print
"XCode Setup" in green.

## detect script
Included in bootstrap is a script that detects as many things as it can. Regular
output will be of the tools it can find, but add `DEBUG=1` and you'll see full
output of what's availible, and you can use these variables anywhere in a
`bootstrap.md`.

Normal view

```
Bootstrapping System:
✅  macOS
✅  nix
✅  brew
```

Debug

```
Bootstrapping System:
  is Linux? 1
  is macOS? 0
    is M1?  1
  is WSL?   1
  Apt?      1
  Yum?      1
  Yay?      1
  nix?      0
  nixos?    1
  raspi?    1
  brew?     0
  choco?    1
```

## Getting Started

1. Fork this repo, but call your fork `dotfiles`.
1. Install `yadm` any of [these ways](https://yadm.io/docs/install)
1. `yadm clone $YOUR_FORK_HERE`
1. `yadm bootstrap`
  - this will run the bootstrap script, and verify everything is working.

