##
# Git Autocomplete
##

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

##
# Git Branch Info
##

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'


## 
# ZPLUG
##

# highlighting at end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

##
# Plugins (Zinit)
##

zinit light ael-code/zsh-colored-man-pages
zinit light b4b4r07/emoji-cli
zinit light zsh-users/zsh-apple-touchbar
zinit light xorkevin/code-review-zsh
zinit light mattmc3/zsh-safe-rm
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

##
# Plugin Prefs (Zinit)
##

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

##
# Shell Options (global)
##

setopt NO_CASE_GLOB
setopt HIST_REDUCE_BLANKS
zstyle :prompt:pure:git:stash show yes

##
# Env Var Overrides (Global)
##

export PATH="/usr/local/bin:$PATH"

## 
# Aliases (global)
##

alias ls=' gls --classify --tabsize=0 --literal --color=always --show-control-chars --human-readable --group-directories-first '
alias please='sudo !!'

##
# local options (checks for files in the format zsh.<file_type>.lcl, otherwise creates them)
##

TYPES=('opts' 'envvars' 'aliases' 'plugins')
for t in $TYPES
do
  if [ ! -f "$HOME/zsh.$t.lcl" ]; then
    touch "$HOME/zsh.$t.lcl"
  else
    source "$HOME/zsh.$t.lcl"
  fi
done

