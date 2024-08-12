export PATH="$PATH:$HOME/.cargo/env:$HOME/anaconda3/bin:/usr/bin/dotnet:/var/tmp/cool/bin:$HOME/.local/bin:$HOME/.yarn/bin"
# export ZSH="$HOME/.oh-my-zsh"
export ZSHRC="$HOME/.zshrc"
export EDITOR="zed"

################### Added by Zinit's installer ###################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
################# End of Zinit's installer chunk #################
# plugins
zinit ice depth=1
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# case insensitive completion
autoload -Uz compinit && compinit
zinit cdreplay -q

# starship prompt
eval "$(starship init zsh)"

# cursor = |
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q'; }

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# history config
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ctrl arrows
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias ls="ls --color"

# sourcing custom plugins
for f in ~/.config/zshcustom/plugins/*; do source $f; done

# sourcing aliases
for f in ~/.config/zshcustom/aliases/*; do source $f; done

# zoxide
eval "$(zoxide init --cmd cd zsh)"
##################################################################

neofetch
