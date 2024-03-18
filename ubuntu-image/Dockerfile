FROM ubuntu:20.04

RUN apt update -y && apt upgrade -y \
    && apt install -y git curl vim zsh net-tools sudo

# must install language pack for zsh to work
RUN apt install -y zsh-syntax-highlighting language-pack-en

# add user
RUN useradd -ms /bin/bash -G sudo -g root -p "$(openssl passwd -6 password)" zxcvber
USER zxcvber
WORKDIR /home/zxcvber

# install oh-my-zsh
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

COPY .vimrc .vimrc
COPY .zshrc .zshrc

# plugins
RUN echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

CMD tail -f /dev/null
