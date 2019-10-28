#!/usr/bin/env zsh

if [[ ! -f ${${(%):-%x}:a:h}/material.dircolors.cache.zsh ]]; then
  if (( $+commands[dircolors] )); then
    dircolors ${${(%):-%x}:a:h}/material.dircolors > "${${(%):-%x}:a:h}/material.dircolors.cache.zsh"
  else
    if (( $+commands[gdircolors] )); then
      gdircolors ${${(%):-%x}:a:h}/material.dircolors > "${${(%):-%x}:a:h}/material.dircolors.cache.zsh"
    fi
  fi
fi
source "${${(%):-%x}:a:h}/material.dircolors.cache.zsh"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
