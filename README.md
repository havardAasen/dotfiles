# Dotfiles
This repository includes all of my custom dotfiles.  They should be cloned to
your home directory so that the path is `~/dotfiles/`.  The included setup
script creates symlinks from your home directory to the files which are located
in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory

## Usage
Since the dotfiles is symlinked from `~/dotfiles/` directory, the files can
be edited in either folder. The `dotfiles_old` is only valid once, on a
new istall. The `makesymlink.sh` should also only be used that one time.

## Installation

``` bash
git clone git@github.com:havardAasen/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

