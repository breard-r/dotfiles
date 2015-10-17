# dotfiles

This is just a bunch of dotfiles.


## vim

Plugins are managed by Vundle, which is a git submodule. After cloning the `dotfiles` repository, you have to initialize the submodule and install all plugins.

``` console
$ cd dotfiles/
$ git submodule init
$ git submodule update
$ vim +PluginInstall +qall
```

Plugins can be updated with `vim +PluginUpdate +qall`.


## qtile
The wallpaper is randomly set from images (png, jpg and jpeg) from `~/pictures/wallpapers/enabled/`. You should populate this directory with symbolic links pointing to images stored in `~/pictures/wallpapers/`.
