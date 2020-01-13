#!/usr/bin/bash

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# fzf
# install and verify and check preconditions
# make sure that this works correctly with nvim settings
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all



# install nvim/vim plugins from commandline
# chech which program to use first as precondition and then
#  dispatch and use that dinamically
nvim +'PlugInstall --sync' +qa

wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
sudo dpkg -i vagrant_2.2.6_x86_64.deb
