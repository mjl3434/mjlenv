#!/bin/bash

HOME_DIR=$(echo ~)
CURRENT_SHELL=$SHELL
CURRENT_SHELL=${SHELL##*/}
MJL_ENV_DIR=~/.mjlenv
CUSTOM_BASHRC="$MJL_ENV_DIR/bashrc_mjl"

if [ $CURRENT_SHELL = "bash" ]; then
    SHELL_RC=$HOME_DIR/.bashrc
elif [ $CURRENT_SHELL = "zsh" ]; then
    SHELL_RC=$HOME_DIR/.zshrc
else
    echo "Error: Unknown shell type $SHELL"
fi

# if we know the shell type we can find its rc file
if [ "$SHELL_RC" != "" ]; then

    if [ -f $SHELL_RC ]; then
        # Check if we already added our call to our custom bashrc script
        FOUND=$(grep -c -m 1 $CUSTOM_BASHRC $SHELL_RC)

    else
        touch $SHELL_RC
	FOUND=0
    fi



    # If the shell rc file does not already have lines to source our file, then add them
    if [ $FOUND = 0 ]; then

	# Append lines to the file
cat <<EOF >> "$SHELL_RC"

if [ -f $CUSTOM_BASHRC ]; then
    . $CUSTOM_BASHRC
fi
EOF

        # And execute our custom rc file since it was not run automatically
        . $CUSTOM_BASHRC
    fi
fi


if [ ! -L ~/.vimrc ]; then
	ln -s $MJL_ENV_DIR/vimrc ~/.vimrc
fi

if [ ! -L ~/.gvimrc ]; then
	ln -s $MJL_ENV_DIR/gvimrc ~/.gvimrc
fi
