#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

readonly SOURCE_DIR="$(dirname "$(realpath "$0")")" # Absolute path to script.
readonly olddir="${SOURCE_DIR}/dotfiles_old" # old dotfiles backup directory.
declare -ar files=("bashrc"
                   "vimrc"
                   "lintianrc"
                   "dput.cf"
                   "gbp.conf") # Array of files to symlink in homedir.

##########

# Create directory dotfiles_old.
echo "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
mkdir -p "${olddir}"
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in "${files[@]}"; do
    echo "Moving any existing dotfiles from ${HOME} to ${olddir}"
    if [[ -f "${HOME}/.${file}" ]]; then
        mv "${HOME}/.${file}" "${olddir}"
    fi
    echo "Creating symlink to ${file} in home directory."
    ln -s "${SOURCE_DIR}/${file}" "${HOME}/.${file}"
done

