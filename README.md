# dotfiles

This is just a bunch of dotfiles.


## ArchLinux packages

```
pacman -S tmux zsh htop neovim kitty-terminfo
pacman -S nmap sqlmap youtube-dl
pacman -S xdg-user-dirs shared-mime-info
```

```
yay -S liquidprompt
yay -S brother-dcp1610w brscan-skey brscan4
yay -S cardpeek
```

## vim

Plugins are managed by Vundle, which is a git submodule. After cloning the `dotfiles` repository, you have to initialize the submodule and install all plugins.

``` sh
cd dotfiles/
git submodule init
git submodule update
vim +PluginInstall +qall
```

Plugins can be updated with `vim +PluginUpdate +qall`.

Updating the Vundle submodule:

``` sh
cd .vim/bundle/Vundle.vim
git checkout master
git pull
cd -
git commit -m 'Update Vundle'
```


## wallpaper

The wallpaper is randomly set from images (png, jpg and jpeg) from `~/pictures/wallpapers/enabled/`. You should populate this directory with symbolic links pointing to images stored in `~/pictures/wallpapers/`.
