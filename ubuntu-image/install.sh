#!/bin/bash -x

sudo apt update -y && apt upgrade -y
sudo apt install -y git curl vim zsh net-tools zsh-syntax-highlighting

# oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

rm .zshrc
wget https://raw.githubusercontent.com/calofmijuck/macbuntu/master/ubuntu-image/.zshrc

rm .vimrc
wget https://raw.githubusercontent.com/calofmijuck/macbuntu/master/ubuntu-image/.vimrc

wget https://raw.githubusercontent.com/calofmijuck/macbuntu/master/ubuntu-image/.tmux.conf

echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "export SHELL=/bin/zsh" >> .bash_profile
echo "exec /bin/zsh -l" >> .bash_profile
