#!/bin/bash
#title           :install.sh
#description     :This script will install dmux.
#author		 :Martin Evgeniev
#date            :08/12/2015
#version         :0.0.1
#usage		 :./install.sh
#notes           :I hope you enjoy dmux.
#bash_version    :4.3.42(1)-release


# Clone dmux repo
function clone_repo (){
git clone https://github.com/suizman/dmux ~/.dmux
}

# Get the container
function install_dmux (){
  echo -e "Pulling dmux container..\n"
  sudo docker pull suizman/dmux:latest
}

# Configure dmux alias for bash|zsh
function configure_bash (){
  # For Bash
  if [[ -f ~/.bashrc ]]; then
    echo -e "Configuring Bash alias..\n"
    echo 'alias dmux="sudo docker run --rm -ti -v ~/.dmux/conf/dmux.conf:/root/.dmux.conf suizman/dmux:latest"' >> ~/.bashrc
    source ~/.bashrc
  fi
}

function configure_zsh (){
  # For Zsh
  if [[ -f ~/.zshrc ]]; then
    echo -e "Configuring Zsh alias..\n"
    echo 'alias dmux="sudo docker run --rm -ti -v ~/.dmux/conf/dmux.conf:/root/.dmux.conf suizman/dmux:latest"' >> ~/.zshrc
    source ~/.zshrc
  fi
}

clone_repo
install_dmux
configure_bash
configure_zsh

echo -e "Instalation complated! Please reload your shell config"
