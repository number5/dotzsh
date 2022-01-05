# let's use zsh_unplugged to load our plugins
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-~/.config/zsh}/plugins}
[[ -d $ZPLUGINDIR/zsh_unplugged ]] \
  || git clone https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
source $ZPLUGINDIR/zsh_unplugged/unplugged.zsh

#################################################################
# PROMPT SETTINGS
#
# This settings are applied immidiately (because we need to show
# prompt as fast as possible), so the plugins are being loaded
# eagerly.
#

# Python virtual environment name
#AGKOZAK_CUSTOM_PROMPT='%(10V.%B%F{green}(%10v)%f%b.)'
# Username and hostname
#AGKOZAK_CUSTOM_PROMPT+='%(!.%S%B.%B%F{yellow})%n%1v%(!.%b%s.%f%b) '
# Path
#AGKOZAK_CUSTOM_PROMPT+=$'%B%F{green}%2v%f%b '
# Prompt character
#AGKOZAK_CUSTOM_PROMPT+='%B%F{red}%(4V.:.%#)%f%b '
# Git status
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' 'S')
AGKOZAK_CUSTOM_RPROMPT='%(3V#%F{yellow}($prompt_git_tag %7v)%f#)'
#AGKOZAK_CUSTOM_RPROMPT='%(3V.%F{yellow}%3v%f.)'
# Exit status
AGKOZAK_CUSTOM_RPROMPT+=' %(?..%B%F{red}(%?%)%f%b)'
# Execution time
AGKOZAK_CMD_EXEC_TIME=1
AGKOZAK_CUSTOM_RPROMPT+=' %B%F{green}%9v%f%b'
# Display the time
AGKOZAK_CUSTOM_RPROMPT+=' %F{033}%*'
AGKOZAK_PROMPT_CHAR=( λ λ ❮ )
AGKOZAK_COLORS_PROMPT_CHAR='magenta'
AGKOZAK_USER_HOST_DISPLAY=0
AGKOZAK_BLANK_LINES=1
AGKOZAK_PROMPT_DIRTRIM=0


# make your Zsh plugins list
plugins=(
  # load these first
 agkozak/agkozak-zsh-prompt
 romkatv/zsh-defer

  # ZshZoo plugins
  zshzoo/setopts
  zshzoo/history
  zshzoo/keybindings
  zshzoo/zstyle-completions
  zshzoo/macos
  zshzoo/zfishcmds
  zshzoo/termtitle
  zshzoo/zfunctions

  # 3rd party plugins
  Aloxaf/fzf-tab
  djui/alias-tips
  chrissicool/zsh-256color
  paulirish/git-open
  marzocchi/zsh-notify
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  olets/zsh-abbr
  rummik/zsh-tailf
  lainiwa/zsh-manydots-magic

  # load these last
  zshzoo/compinit
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-completions

)

# load your plugins
plugin-load $plugins

# vim:ft=zsh
#

PURE_PROMPT_SYMBOL=λ
PURE_GIT_PULL=0



# plugins


# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(gimme 1.17.3)"

export GOPATH=/Users/bruce.wang/go

# profiling zsh startup
#zprof

source /Users/bruce.wang/.config/broot/launcher/bash/br

alias luamake=/Users/bruce.wang/src/git/lua-language-server/3rd/luamake/luamake

# direnv
eval "$(direnv hook zsh)"
