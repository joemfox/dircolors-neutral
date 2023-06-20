#!/usr/bin/env zsh

ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-${TMPDIR:-/tmp}/zsh-${UID:-user}}"
DIRCOLORS_CACHE_FILE="${ZSH_CACHE_DIR}/neutral-dircolors.zsh"

if (( $+functions[zpm] )); then
  zpm load zpm-zsh/colors
fi

# Dircolors
source "${DIRCOLORS_CACHE_FILE}" 2>/dev/null || {
  # Standarized $0 handling, following:
  # https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  0="${${(M)0:#/*}:-$PWD/$0}"
  _DIRNAME="${0:h}"

  mkdir -p "${ZSH_CACHE_DIR}"

  local COMMAND
  if (( $+commands[dircolors] )); then
    COMMAND="dircolors"
  elif (( $+commands[gdircolors] )); then
    COMMAND="gdircolors"
  fi

  source "${_DIRNAME}/dircolors/colors.sh"

  for file in "${_DIRNAME}/dircolors/"*.dircolors; do
    cat "$file"
  done | envsubst  | $COMMAND - > "${DIRCOLORS_CACHE_FILE}"

  source "${DIRCOLORS_CACHE_FILE}"
}

# FSH Colors
zstyle :plugin:fast-syntax-highlighting theme "neutral"
typeset -g FAST_THEME_NAME="neutral"
typeset -Ag FAST_HIGHLIGHT_STYLES

FAST_HIGHLIGHT_STYLES[neutraldefault]=none
FAST_HIGHLIGHT_STYLES[neutralunknown-token]=fg=red,bold
FAST_HIGHLIGHT_STYLES[neutralreserved-word]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralalias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralsuffix-alias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralbuiltin]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralfunction]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralcommand]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralprecommand]=fg=green,bold,underline
FAST_HIGHLIGHT_STYLES[neutralcommandseparator]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralhashed-command]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralpath]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralpath_pathseparator]=fg=red,bold
FAST_HIGHLIGHT_STYLES[neutralglobbing]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralglobbing-ext]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralhistory-expansion]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralsingle-hyphen-option]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutraldouble-hyphen-option]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralback-quoted-argument]=none,bold
FAST_HIGHLIGHT_STYLES[neutralsingle-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutraldouble-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutraldollar-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralback-or-dollar-double-quoted-argument]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralback-dollar-quoted-argument]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralassign]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralredirection]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralcomment]=fg=8,bold
FAST_HIGHLIGHT_STYLES[neutralvariable]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralmathvar]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralmathnum]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralmatherr]=fg=red,bold
FAST_HIGHLIGHT_STYLES[neutralassign-array-bracket]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralfor-loop-variable]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralfor-loop-number]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralfor-loop-operator]=fg=red,bold
FAST_HIGHLIGHT_STYLES[neutralfor-loop-separator]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralexec-descriptor]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralhere-string-tri]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralhere-string-text]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralhere-string-var]=fg=cyan,bg=black
FAST_HIGHLIGHT_STYLES[neutralcase-input]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralcase-parentheses]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralcase-condition]=bg=blue,none,bold
FAST_HIGHLIGHT_STYLES[neutralcorrect-subtle]=fg=blue,bold,bg=black
FAST_HIGHLIGHT_STYLES[neutralincorrect-subtle]=fg=red,bold,bg=black
FAST_HIGHLIGHT_STYLES[neutralsubtle-separator]=bg=black,fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralsubtle-bg]=bg=black
FAST_HIGHLIGHT_STYLES[neutralpath-to-dir]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[neutralpaired-bracket]=bg=blue
FAST_HIGHLIGHT_STYLES[neutralbracket-level-1]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralbracket-level-2]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralbracket-level-3]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[neutralglobal-alias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutralsubcommand]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutralsingle-sq-bracket]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutraldouble-sq-bracket]=fg=green,bold
FAST_HIGHLIGHT_STYLES[neutraldouble-paren]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutraloptarg-string]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[neutraloptarg-number]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[neutralrecursive-base]=fg=default

FAST_HIGHLIGHT_STYLES[neutralsecondary]=neutral
