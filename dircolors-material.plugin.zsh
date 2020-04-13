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
