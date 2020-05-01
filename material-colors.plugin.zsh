#!/usr/bin/env zsh

DIRCOLORS_CACHE_FILE="${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"

source "${DIRCOLORS_CACHE_FILE}" 2>/dev/null || {
  # Standarized $0 handling, following:
  # https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  0="${${(M)0:#/*}:-$PWD/$0}"
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

export LESS_TERMCAP_mb="${c[green]}"
export LESS_TERMCAP_md="${c[bold]}${c[blue]}${c[bg_black]}"
export LESS_TERMCAP_so="${c[bold]}${c[bg_yellow]}${c[black]}"
export LESS_TERMCAP_us="${c[green]}"

export LESS_TERMCAP_ue="${c[reset]}"
export LESS_TERMCAP_me="${c[reset]}"
export LESS_TERMCAP_se="${c[reset]}"

GREP_COLORS=''
GREP_COLORS+=":mt=${c[bold]:2:-1};${c[cyan]:2:-1}"
GREP_COLORS+=":ms=${c[bold]:2:-1};${c[green]:2:-1}"
GREP_COLORS+=":mc=${c[bold]:2:-1};${c[red]:2:-1}"
GREP_COLORS+=':sl='
GREP_COLORS+=':cx='
GREP_COLORS+=":fn=${c[bold]:2:-1};${c[magenta]:2:-1};${c[bg_black]:2:-1}"
GREP_COLORS+=':ln=32'
GREP_COLORS+=':bn=32'
GREP_COLORS+=":se=${c[bold]:2:-1};${c[cyan]:2:-1};${c[bg_black]:2:-1}"

export GREP_COLORS