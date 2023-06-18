#!/usr/bin/env zsh

ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-${TMPDIR:-/tmp}/zsh-${UID:-user}}"
DIRCOLORS_CACHE_FILE="${ZSH_CACHE_DIR}/material-dircolors.zsh"

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

zstyle ':completion:*' list-dirs-first true


# FSH Colors
zstyle :plugin:fast-syntax-highlighting theme "material"
typeset -g FAST_THEME_NAME="material"
typeset -Ag FAST_HIGHLIGHT_STYLES

FAST_HIGHLIGHT_STYLES[materialdefault]=none
FAST_HIGHLIGHT_STYLES[materialunknown-token]=fg=red,bold
FAST_HIGHLIGHT_STYLES[materialreserved-word]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialalias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialsuffix-alias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialbuiltin]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialfunction]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialcommand]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialprecommand]=fg=green,bold,underline
FAST_HIGHLIGHT_STYLES[materialcommandseparator]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialhashed-command]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialpath]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialpath_pathseparator]=fg=red,bold
FAST_HIGHLIGHT_STYLES[materialglobbing]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialglobbing-ext]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialhistory-expansion]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialsingle-hyphen-option]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialdouble-hyphen-option]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialback-quoted-argument]=none,bold
FAST_HIGHLIGHT_STYLES[materialsingle-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialdouble-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialdollar-quoted-argument]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialback-or-dollar-double-quoted-argument]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialback-dollar-quoted-argument]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialassign]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialredirection]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialcomment]=fg=8,bold
FAST_HIGHLIGHT_STYLES[materialvariable]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialmathvar]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialmathnum]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialmatherr]=fg=red,bold
FAST_HIGHLIGHT_STYLES[materialassign-array-bracket]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialfor-loop-variable]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialfor-loop-number]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialfor-loop-operator]=fg=red,bold
FAST_HIGHLIGHT_STYLES[materialfor-loop-separator]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialexec-descriptor]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialhere-string-tri]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialhere-string-text]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialhere-string-var]=fg=cyan,bg=black
FAST_HIGHLIGHT_STYLES[materialcase-input]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialcase-parentheses]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialcase-condition]=bg=blue,none,bold
FAST_HIGHLIGHT_STYLES[materialcorrect-subtle]=fg=blue,bold,bg=black
FAST_HIGHLIGHT_STYLES[materialincorrect-subtle]=fg=red,bold,bg=black
FAST_HIGHLIGHT_STYLES[materialsubtle-separator]=bg=black,fg=green,bold
FAST_HIGHLIGHT_STYLES[materialsubtle-bg]=bg=black
FAST_HIGHLIGHT_STYLES[materialpath-to-dir]=fg=blue,bold
FAST_HIGHLIGHT_STYLES[materialpaired-bracket]=bg=blue
FAST_HIGHLIGHT_STYLES[materialbracket-level-1]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialbracket-level-2]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialbracket-level-3]=fg=cyan,bold
FAST_HIGHLIGHT_STYLES[materialglobal-alias]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialsubcommand]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialsingle-sq-bracket]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialdouble-sq-bracket]=fg=green,bold
FAST_HIGHLIGHT_STYLES[materialdouble-paren]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialoptarg-string]=fg=yellow,bold
FAST_HIGHLIGHT_STYLES[materialoptarg-number]=fg=magenta,bold
FAST_HIGHLIGHT_STYLES[materialrecursive-base]=fg=default

FAST_HIGHLIGHT_STYLES[materialsecondary]=material
