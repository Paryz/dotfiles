FROM ubuntu:latest

USER root

RUN apt-get update
RUN apt-get install neovim curl git nodejs -y

RUN useradd -ms /bin/bash myuser

USER myuser

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

WORKDIR /home/myuser
