#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir="${HOME}/dotfiles"            # dotfiles directory
olddir="${HOME}/dotfiles_old"     # old dotfiles backup directory
files="bashrc vimrc lintianrc dput.cf gbp.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
mkdir -p "${olddir}"
echo "...done"

# change to the dotfiles directory
echo "Changing to the ${dir} directory"
cd "${dir}" || exit
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in ${files}; do
    echo "Moving any existing dotfiles from ${HOME} to ${olddir}"
    mv "${HOME}/.${file}" "${olddir}"
    echo "Creating symlink to ${file} in home directory."
    ln -s "${dir}/${file}" "${HOME}/.${file}"
done

