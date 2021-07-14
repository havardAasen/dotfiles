#!/bin/bash
#
# Create symlinks from the home directory to all dotfiles
# in the same directory as this script resides.
# The repository can be saved in whichever path the user wants.
#
# 'mv' does not follow symlinks. That means that if the script is run
# multiple times, the files will only get copied the first time, as
# long as the files wasn't symlinked in the first place.

readonly SOURCE_DIR="$(dirname "$(realpath "$0")")" # Absolute path to script.
readonly olddir="${SOURCE_DIR}/dotfiles_old" # Old dotfiles backup directory.
declare -ar files=("bashrc"
                   "vimrc"
                   "lintianrc"
                   "dput.cf"
                   "gbp.conf") # Array of files to symlink in homedir.

# Create directory dotfiles_old.
echo "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
mkdir -p "${olddir}"
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks.
echo "Move existing dotfiles from ${HOME} to ${olddir}"
for file in "${files[@]}"; do
    if [[ -f "${HOME}/.${file}" ]]; then
        mv "${HOME}/.${file}" "${olddir}"
    fi
    echo "Creating symlink to ${file} in home directory."
    ln -sf "${SOURCE_DIR}/${file}" "${HOME}/.${file}"
done
