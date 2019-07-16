#!/bin/bash

BASHRC=$(echo ~)
BASHRC="$BASHRC/.bashrc"
MJL_ENV_DIR=~/.mjlenv
CUSTOM_BASHRC="$MJL_ENV_DIR/bashrc_mjl"

# Check if there is a .bashrc file
if [ -f $BASHRC ]; then
	# Check if we already added our call to our custom bashrc script
	FOUND=$(grep "$CUSTOM_BASHRC" $BASHRC)
else
	# There is no .bashrc file so create it
	touch $BASHRC
	FOUND=
fi

# If we don't have the code to call our custom bashrc script
if [ "$FOUND" == "" ]; then

	# Then add it
cat << FOOBAR >> $BASHRC

if [ -f $CUSTOM_BASHRC ]; then
	. $CUSTOM_BASHRC
fi
FOOBAR

	# And execute the custom script
	. $CUSTOM_BASHRC
fi

if [ ! -L ~/.vimrc ]; then
	ln -s $MJL_ENV_DIR/vimrc ~/.vimrc
fi

if [ ! -L ~/.gvimrc ]; then
	ln -s $MJL_ENV_DIR/gvimrc ~/.gvimrc
fi
