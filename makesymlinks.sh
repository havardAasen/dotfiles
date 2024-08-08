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
readonly BACKUP_DIR="${SOURCE_DIR}/dotfiles_old"
declare -ar FILES=(bashrc vimrc lintianrc gbp.conf sbuildrc inputrc)

echo "Creating ${BACKUP_DIR} for backup of any existing dotfiles in ${HOME}"
mkdir -p "${BACKUP_DIR}"
echo "...done"

echo "Move existing dotfiles from ${HOME} to ${BACKUP_DIR}"
for file in "${FILES[@]}"; do
    if [[ -f "${HOME}/.${file}" ]]; then
        mv "${HOME}/.${file}" "${BACKUP_DIR}"
    fi
    echo "Creating symlink to ${file} in home directory."
    ln -sf "${SOURCE_DIR}/${file}" "${HOME}/.${file}"
done
