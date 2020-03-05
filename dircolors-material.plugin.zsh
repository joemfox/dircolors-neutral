#!/usr/bin/env zsh



if [[ ! -f "${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh" ]]; then
  # Standarized $0 handling, following:
  # https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  _DIRNAME="${0:h}"
  mkdir -p "${TMPDIR:-/tmp}/zsh-${UID}"

  if (( $+commands[dircolors] )); then
    dircolors "${_DIRNAME}/material.dircolors" > "${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"
  elif (( $+commands[gdircolors] )); then
    gdircolors "${_DIRNAME}/material.dircolors" > "${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"
  fi
fi
source "${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
