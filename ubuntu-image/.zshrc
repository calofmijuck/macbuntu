export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="steeef"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias py="python3"
alias rm="rm -I"
alias mkdir="mkdir -pv"

alias du='du -kh'
alias df='df -kTh'
alias his='history | tail'

alias zshrc="vi ~/.zshrc"
alias zshapply="source ~/.zshrc"

alias tmux="tmux -u"
