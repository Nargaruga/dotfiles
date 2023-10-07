# dotfiles
Configuration files for various applications.

## Usage
Clone the repository in your home directory and execute the `update_symlink.sh` script, which uses the `stow` command in order to create symbolic links to the configuration files in the appropriate locations. The `clear_symlinks.sh` script can be used to remove any symbolic link created by `stow`.

You can add any file or directory you don't want to symlink to `.stow-local-ignore`.
