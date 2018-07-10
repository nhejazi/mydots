# my.files [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

> _a collection of my configuration/customization files_

This collection of configuration files affects behavior of the following tools:
* [git](https://git-scm.com/)
* [tmux](https://github.com/tmux/tmux/wiki)
* [jrnl](http://jrnl.sh/index.html)
* [zsh (shell)](http://zsh.sourceforge.net)
* [bash (shell)](https://www.gnu.org/software/bash/)
* [xonsh (shell)](https://xon.sh/)
* [gitsome (CLI)](https://github.com/donnemartin/gitsome)
* [Hyper (terminal)](https://hyper.is/)
* [iTerm2 (macOS terminal)](https://iterm2.com/)
* [Jupyter notebook](http://jupyter.org/)
* [Atom (editor)](https://atom.io)
* [R (language)](https://www.r-project.org)
* [i3 (Linux window manager](https://i3wm.org)

---

## Directions

Setting up these configuration files is as easy as...
```bash
git clone https://github.com/nhejazi/mydots.git ~/.dotfiles
cd ~/.dotfiles; make
```

*  Before running `_linkDots.sh`, update the _user.name_ and _user.email_ fields
    in the `gitconfig` file appropriately.

*  To use the gitsome CLI (to add GitHub integration to xonsh), simply run
    `gh-configure` after installing gitsome via `pip install gitsome`. This
    assumes xonsh has been properly installed already (via `pip install xonsh`).

---

## Related

* __[nhejazi/vimForLife](https://github.com/nhejazi/vimForLife)__ - convenient
    configurations for both the [Vim](http://www.vim.org/index.php) and
    [Neovim](https://neovim.io) editors.

* __[nhejazi/ubuntu-fresh](https://github.com/nhejazi/ubuntu-fresh)__ - setup
    scripts for Ubuntu, painlessly installing tools affected by this
    configuration.

* __[nhejazi/macOS-fresh](https://github.com/nhejazi/macOS-fresh)__ - setup
    scripts for macOS, easily installing tools that this configuration affects.

---

## License

&copy; 2016-2018 [Nima Hejazi](https://nimahejazi.org)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.

