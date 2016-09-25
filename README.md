# my.files

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

> _a collection of my configuration/customization files_

This collection of configuration files affects behavior of the following tools:
* [git](https://git-scm.com/)
* [bash](https://www.gnu.org/software/bash/),
* [zsh](http://zsh.sourceforge.net)
* [xonsh](https://xon.sh/)
* [gitsome](https://github.com/donnemartin/gitsome))
* [HyperTerm](https://hyperterm.org/)
* [the R language](https://www.r-project.org)
* [the Atom editor](https://atom.io)

---

## Directions

Setting up these configuration files is as easy as...
```bash
git clone https://github.com/nhejazi/mydotfiles.git ~/.dotfiles
sh ~/.dotfiles/_linkDots.sh
```

---

## Notes

*  Before running `_linkDots.sh`, update the _user.name_ and _user.email_ fields
    in the `gitconfig` file appropriately.

*  To use the gitsome CLI (to add GitHub integration to xonsh), simply run
    `gh-configure` after installing gitsome via `pip install gitsome`. This
    assumes xonsh has been properly installed already (via `pip install xonsh`).

---

## Related

* [nhejazi/myneovimconfig](https://github.com/nhejazi/myneovimconfig) - a
    customized configuration for the [Neovim](https://neovim.io) editor.

* [nhejazi/myvimconfig](https://github.com/nhejazi/myvimconfig) - a customized
    configuration for the popular editor [Vim](http://www.vim.org/index.php).

* [nhejazi/ubuntu-fresh](https://github.com/nhejazi/macOS-fresh) - for setting
    up macOS systems from scratch, easily installing many of the tools that
    this configuration affects.

* [nhejazi/macOS-fresh](https://github.com/nhejazi/ubuntu-fresh) - for setting
    up Ubuntu systems, painlessly installing many of the tools affected by this
    configuration.

---

## License

&copy; 2016 [Nima Hejazi](http://nimahejazi.org)

This repository is licensed under the MIT license. See `LICENSE` for details.
