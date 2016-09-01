# remove broken symlinks
find -L ~/.atom/ -maxdepth 1 -type l -exec rm {} +

# for Atom text editor customization
if [ -e ~/.atom/config.cson ]; then
    rm -f ~/.atom/config.cson;
fi
ln -s ~/.dotfiles/atom/config.cson ~/.atom/config.cson

if [ -e ~/.atom/init.coffee ]; then
    rm -f ~/.atom/init.coffee;
fi
ln -s ~/.dotfiles/atom/init.coffee ~/.atom/init.coffee

if [ -e ~/.atom/keymap.cson ]; then
    rm -f ~/.atom/keymap.cson;
fi
ln -s ~/.dotfiles/atom/keymap.cson ~/.atom/keymap.cson

if [ -e ~/.atom/packages.list ]; then
    rm -f ~/.atom/packages.list;
fi
ln -s ~/.dotfiles/atom/packages.list ~/.atom/packages.list

if [ -e ~/.atom/snippets.cson ]; then
    rm -f ~/.atom/snippets.cson;
fi
ln -s ~/.dotfiles/atom/snippets.cson ~/.atom/snippets.cson

if [ -e ~/.atom/styles.less ]; then
    rm -f ~/.atom/styles.less;
fi
ln -s ~/.dotfiles/atom/styles.less ~/.atom/styles.less
