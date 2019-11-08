#!/usr/bin/env zsh

# Standarized $0 handling, following:
# https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
_DIRNAME="${0:h}"

if [[ ! -f "${_DIRNAME}/material.dircolors.cache.zsh" ]]; then
  if (( $+commands[dircolors] )); then
    dircolors "${_DIRNAME}/material.dircolors" > "${_DIRNAME}/material.dircolors.cache.zsh"
  else
    if (( $+commands[gdircolors] )); then
      gdircolors "${_DIRNAME}/material.dircolors" > "${_DIRNAME}/material.dircolors.cache.zsh"
    fi
  fi
fi
source "${_DIRNAME}/material.dircolors.cache.zsh"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
