#!/usr/bin/env zsh


if (( $+functions[zpm] )); then #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
  zpm load zpm-zsh/colors #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
fi #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE

DIRCOLORS_CACHE_FILE="${TMPDIR:-/tmp}/zsh-${UID}/material-dircolors.zsh"

# Dircolors
source "${DIRCOLORS_CACHE_FILE}" 2>/dev/null || {
  # Standarized $0 handling, following:
  # https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  0="${${(M)0:#/*}:-$PWD/$0}"
  _DIRNAME="${0:h}"

  mkdir -p "${TMPDIR:-/tmp}/zsh-${UID}"

  local COMMAND
  if (( $+commands[dircolors] )); then
    COMMAND="dircolors"
  elif (( $+commands[gdircolors] )); then
    COMMAND="gdircolors"
  fi

  for file in "${_DIRNAME}/dircolors/"*.dircolors; do
    cat "$file"
  done | $COMMAND - > "${DIRCOLORS_CACHE_FILE}"

  source "${DIRCOLORS_CACHE_FILE}"
}

# Zsh colors
if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")'
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 'ma=7;33'
fi

# GCC Colors
GCC_COLORS=''
GCC_COLORS+="error=${c[bold]:2:-1};${c[red]:2:-1}"
GCC_COLORS+=":warning=${c[bold]:2:-1};${c[yellow]:2:-1}"
GCC_COLORS+=":note=01;36${c[bold]:2:-1};${c[white]:2:-1}"
GCC_COLORS+=":caret=01;32${c[bold]:2:-1};${c[white]:2:-1}"
GCC_COLORS+=":locus=${c[bg_black]:2:-1};${c[bold]:2:-1};${c[magenta]:2:-1}"
GCC_COLORS+=":quote=${c[bold]:2:-1};${c[yellow]:2:-1}"

export GCC_COLORS

# Less Colors
export LESS_TERMCAP_mb="${c[green]}"
export LESS_TERMCAP_md="${c[bold]}${c[blue]}${c[bg_black]}"
export LESS_TERMCAP_so="${c[bold]}${c[bg_yellow]}${c[black]}"
export LESS_TERMCAP_us="${c[green]}"

export LESS_TERMCAP_ue="${c[reset]}"
export LESS_TERMCAP_me="${c[reset]}"
export LESS_TERMCAP_se="${c[reset]}"

# Grep Colors
GREP_COLORS=''
GREP_COLORS+=":mt=${c[bold]:2:-1};${c[cyan]:2:-1}"
GREP_COLORS+=":ms=${c[bg_red]:2:-1};${c[bold]:2:-1};${c[black]:2:-1}"
GREP_COLORS+=":mc=${c[bold]:2:-1};${c[red]:2:-1}"
GREP_COLORS+=':sl='
GREP_COLORS+=':cx='
GREP_COLORS+=":fn=${c[bold]:2:-1};${c[magenta]:2:-1};${c[bg_black]:2:-1}"
GREP_COLORS+=':ln=32'
GREP_COLORS+=':bn=32'
GREP_COLORS+=":se=${c[bold]:2:-1};${c[cyan]:2:-1};${c[bg_black]:2:-1}"

export GREP_COLORS

# Ag Colors
function ag() {
  command ag --color-path "${c[bg_black]:2:-1};${c[bold]:2:-1};${c[magenta]:2:-1}" --color-match "${c[bg_red]:2:-1};${c[bold]:2:-1};${c[black]:2:-1}" --color-line-number "${c[bg_black]:2:-1};${c[bold]:2:-1};${c[green]:2:-1}" $@
}

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
FAST_HIGHLIGHT_STYLES[materialcomment]=fg=black,bold
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
