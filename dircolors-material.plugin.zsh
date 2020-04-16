#!/usr/bin/env zsh

DIRCOLORS_CACHE_FILE="${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"

source "${DIRCOLORS_CACHE_FILE}" 2>/dev/null || {
  # Standarized $0 handling, following:
  # https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  _DIRNAME="${0:h}"

  mkdir -p "${TMPDIR:-/tmp}/zsh-${UID}"

  if (( $+commands[dircolors] )); then
    dircolors "${_DIRNAME}/material.dircolors" > "${DIRCOLORS_CACHE_FILE}"
  elif (( $+commands[gdircolors] )); then
    gdircolors "${_DIRNAME}/material.dircolors" > "${DIRCOLORS_CACHE_FILE}"
  fi
  source "${DIRCOLORS_CACHE_FILE}"
}

if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")'
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 'ma=7;33'
fi
