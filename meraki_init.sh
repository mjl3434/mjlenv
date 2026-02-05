#autoload bashcompinit
#bashcompinit
#export PATH=~/co/router/scripts:$PATH
#for f in ~/co/router/scripts/bash_completion.d/*; do source $f; done

# This fixes weird issue with git being slow to do tab completion
__git_files () {
    _wanted files expl 'local files' _files
}

fixssh() {
    ssh-add -l
    eval $(tmux show-env |sed -n 's/^\(SSH_[^=]*\)=\(.*\)/export \1="\2"/p')
    ssh-add -l
}

fixmods() {
    git submodule sync --recursive
    git submodule update --init --recursive 
}

format() {
    pushd ~/co/router >/dev/null
    FILES=$(git diff --name-only | egrep "^meraki/cellular_jolteon" | xargs)
    echo "Clang formatting modified files: $FILES"
    scripts/ci/clang-format.sh -i $FILES
    echo "Clang formatting done."
    popd >/dev/null
}

#TLFILE=/Users/mlarwill/bin/tl
#if [ -f $TLFILE ]; then
#    . $TLFILE
#fi
