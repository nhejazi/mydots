# my.files [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

> _a collection of my configuration/customization files_

This collection of configuration files affects behavior of the following tools:
* [zsh](http://zsh.sourceforge.net), the Z shell
* [bash](https://www.gnu.org/software/bash/), the Bourne Again shell
* [Alacritty](https://github.com/jwilm/alacritty), GPU-accelerated terminal
   emulator
* [Jupyter](http://jupyter.org/), notebook environment
* [jrnl](http://jrnl.sh/index.html), command line journal
* [tmux](https://github.com/tmux/tmux/wiki), terminal multiplexer
* [git](https://git-scm.com/), version control system
* [R](https://www.r-project.org), statistical computing language
* [radian](https://github.com/randy3k/radian), a modern R REPL/console

---

## Directions

Setting up these configuration files is as easy as...
```bash
git clone https://github.com/nhejazi/mydots.git ~/.dotfiles
cd ~/.dotfiles
make
```

_Note:_ Before running `_setup.sh`, update the _user.name_ and _user.email_
fields in the `gitconfig` file appropriately.

---

## Related

* __[nhejazi/vim_lyfe](https://github.com/nhejazi/vim_lyfe)__ - convenient
    configurations for both the [Vim](http://www.vim.org/index.php) and
    [Neovim](https://neovim.io) editors.

* __[nhejazi/ubuntu-fresh](https://github.com/nhejazi/ubuntu-fresh)__ - setup
    scripts for Ubuntu, painlessly installing tools affected by this
    configuration.

* __[nhejazi/macOS-fresh](https://github.com/nhejazi/macOS-fresh)__ - setup
    scripts for macOS, easily installing tools that this configuration affects.

---

## License

&copy; 2016-2021 [Nima Hejazi](https://nimahejazi.org)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.
