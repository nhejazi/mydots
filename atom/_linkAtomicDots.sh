# remove broken symlinks
find -L ~/.atom/ -maxdepth 1 -type l -exec rm {} +

# for Atom text editor customization
if [ -e ~/.atom/config.cson ]; then
    mv -f ~/.atom/config.cson ~/.atom/config_orig.cson;
fi
ln -s ~/.dotfiles/atom/config.cson ~/.atom/config.cson

if [ -e ~/.atom/init.coffee ]; then
    mv -f ~/.atom/init.coffee ~/.atom/init_orig.coffee;
fi
ln -s ~/.dotfiles/atom/init.coffee ~/.atom/init.coffee

if [ -e ~/.atom/keymap.cson ]; then
    mv -f ~/.atom/keymap.cson ~/.atom/keymap_orig.cson;
fi
ln -s ~/.dotfiles/atom/keymap.cson ~/.atom/keymap.cson

if [ -e ~/.atom/snippets.cson ]; then
    mv -f ~/.atom/snippets.cson ~/.atom/snippets_orig.cson;
fi
ln -s ~/.dotfiles/atom/snippets.cson ~/.atom/snippets.cson

if [ -e ~/.atom/styles.less ]; then
    mv -f ~/.atom/styles.less ~/.atom/styles_orig.less;
fi
ln -s ~/.dotfiles/atom/styles.less ~/.atom/styles.less