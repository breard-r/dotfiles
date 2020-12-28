# dotfiles

This is just a bunch of dotfiles.


## ArchLinux packages

``` sh
# Base utils
pacman -S htop kitty-terminfo neovim openssh tmux transmission-cli tree wget whois zsh zsh-syntax-highlighting
pacman -S shared-mime-info xdg-user-dirs
pacman -S skim
# Rust
pacman -S cargo-audit cargo-outdated cargo-release rustup
# CLI software
pacman -S bind exiv2 imagemagick mkcert nmap rsync sqlmap youtube-dl
# WM
pacman -S i3status
pacman -S i3lock scrot
pacman -S grim
# Graphical software
pacman -S atril firefox gedit gimp handbrake kitty mpv pcmanfm rhythmbox ristretto tumbler thunderbird vlc zathura
# Fonts
pacman -S noto-fonts noto-fonts-emoji ttf-dejavu ttf-inconsolata ttf-liberation
```

``` sh
# Base utils
yay -S liquidprompt
# Printer
yay -S brother-dcp1610w brscan-skey brscan4
# Graphical software
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
