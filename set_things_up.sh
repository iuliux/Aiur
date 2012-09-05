#!/bin/bash

# Script that installs every little thing in place
# (UBUNTU-ISH specific [!])


# Debugging
#set -x -e


# Check if user has enough privileges
if [ "$(whoami)" != "root" ]; then
	echo "Run this as root. (sudo $0)"
	exit 0
fi




echo "--- Installation of needed tools  --- --- --- --- --- --- --- --- ---"
echo

# Tries to install VIM
apt-get install vim
echo
echo "* If this failed, please install VIM manually!"
echo "  (>Enter)"
read

# Tries to install GIT after checking that it doesn't exists
# (It definitely should exist, but...)
if [ ! type git &> /dev/null ]; then
	apt-get install git-core git-email
	echo
	echo "* If this failed, please install GIT {git-core} manually!"
	echo "  (>Enter)"
	read
fi




echo "--- Necessary additional folders setup  --- --- --- --- --- --- --- ---"
echo

# Setup ~/bin
mkdir -p $HOME/bin # it is already added to PATH in .bashrc

# Setup ~/.vim/backup and ~/.vim/tmp
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/tmp




echo "--- Get Aiur (the home of personal configs) --- --- --- --- --- --- ---"
echo

# Get rc files from Aiur
cd $HOME
git clone https://github.com/iuliux/Aiur.git Aiur
AIUR="$HOME/Aiur"
cd -



echo "--- RC files setup  --- --- --- --- --- --- --- --- --- --- --- --- ---"
echo

cd $HOME

# * Setup vimrc
if [ -f .vimrc ]; then
	mv -f .vimrc .vimrc.old
fi
ln -s $AIUR/.vimrc .vimrc

# * Setup bashrc
echo "if [ -f $AIUR/.bashrc ]; then . $AIUR/.bashrc; fi" >> .bashrc
echo >> .bashrc # new line at the end of file

# * Setup inputrc
if [ -f .inputrc ]; then
	mv -f .inputrc .inputrc.old
fi
ln -s $AIUR/.inputrc .inputrc

cd -




echo "--- Sublime Text 2 setup -- --- --- --- --- --- --- --- --- --- --- ---"
echo

# Installs Sublime Text 2 (ask nicely)
echo "* Install Sublime Text 2 into $HOME/Sublime Text 2/"
echo "    (Download URL: http://www.sublimetext.com/2)"
echo "  (>Enter)"
read
echo "* Run it once (and close it) to complete the installation"
echo "  (>Enter)"
read

# Make symlink sublime->sublime_text (to have it in PATH)
ln -s $HOME/Sublime\ Text\ 2/sublime_text $HOME/bin/sublime


# Now install plugins
SUBLIME_PACKAGES="$HOME/.config/sublime-text-2/Packages"
mkdir -p $SUBLIME_PACKAGES/
mkdir -p $SUBLIME_PACKAGES/User
cd $SUBLIME_PACKAGES/

# * Package Control
git clone git://github.com/wbond/sublime_package_control.git Package-Control

# * Back There
git clone git://github.com/iuliux/SublimeText2-BackThere.git Back-There

# * SublimeREPL
git clone git://github.com/wuub/SublimeREPL.git SublimeREPL

# * SublimePTY
git clone git://github.com/wuub/SublimePTY.git SublimePTY

# * SublimeFileDiffs
git clone git://github.com/colinta/SublimeFileDiffs.git SublimeFileDiffs

# * SublimeLinter
git clone git://github.com/SublimeLinter/SublimeLinter.git SublimeLinter

# * Maybe Cscope?


# Setup the config files
for sublimecfg in `ls -1 $AIUR/sublime-text-2/Packages/User`; do
	ln -s $AIUR/sublime-text-2/Packages/User/"$sublimecfg" User/"$sublimecfg"
done

cd -




echo "--- Done -- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---"
