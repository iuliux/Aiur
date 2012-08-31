#!/bin/bash

# Script that installs every little thing in place
# (UBUNTU-ISH specific [!])


echo "--- Prompt for manual installation of needed tools  --- --- --- --- ---"

echo "* Install vim (if not already installed)"
read
echo "* Install git {git-core} (if not already installed)"
read




echo "--- Necessary additional folders setup -- --- --- --- --- --- --- ---"

# Setup ~/bin
mkdir -p $HOME/bin # it is already added to PATH in .bashrc

# Setup ~/.vim/backup and ~/.vim/tmp
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/tmp




echo "--- RC files setup  --- --- --- --- --- --- --- --- --- --- --- --- ---"

# Get rc files from Aiur
cd $HOME
git clone https://github.com/iuliux/Aiur.git Aiur

# * Setup vimrc
if [ -f .vimrc ]; then
	mv -f .vimrc .vimrc.old
fi
ln -s $HOME/Aiur/.vimrc .vimrc

# * Setup bashrc
echo "if [ -f $HOME/Aiur/.bashrc ]; then . $HOME/Aiur/.bashrc; fi" >> .bashrc
echo >> .bashrc # new line at the end of file

# * Setup inputrc
if [ -f .inputrc ]; then
	mv -f .inputrc .inputrc.old
fi
ln -s $HOME/Aiur/.inputrc .inputrc

cd -




echo "--- Sublime Text 2 setup -- --- --- --- --- --- --- --- --- --- --- ---"

# Installs Sublime Text 2 (ask nicely)
echo "* Install Sublime Text 2 into $HOME/Sublime Text 2/"
echo "    (Download URL: http://www.sublimetext.com/2)"
read
echo "* Run it once (and close it) to complete the installation"
read

# Make symlink sublime->sublime_text (to have it in PATH)
# ln -s $HOME/Sublime\ Text\ 2/sublime_text $HOME/bin/sublime


# Now install plugins
mkdir -p $HOME/.config/sublime-text-2/Packages/
cd $HOME/.config/sublime-text-2/Packages/

# * Package Control
git clone git://github.com/wbond/sublime_package_control.git Package-Control

# * Back There
git clone git://github.com/iuliux/SublimeText2-BackThere.git Back-There

# * SublimeREPL
git clone git://github.com/wuub/SublimeREPL.git SublimeREPL

# * SublimePTY
git clone git://github.com/wuub/SublimePTY.git SublimePTY

# * Maybe Cscope?

cd -



echo "--- Done -- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---"
