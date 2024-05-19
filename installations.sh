#!/bin/bash

echo "Hello, $$(USER)! Lets start your setup."
echo "first, lets install your first applications"

sudo dnf update -y

sudo dnf install -y neovim zsh tmux snapd qbittorrent vlc alacritty clang
flatpak install -y chrome discord insomnia motrix 
snap install authy

echo "Now, lets install your development tools"

# docker setup
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#asdf setup
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
asdf plugin-add crystal https://github.com/asdf-community/asdf-crystal.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git

echo "Now lets setup our dotfiles"

git clone git clone https://github.com/Jorgeloch/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
make all

echo "Now you are ready to go!"
