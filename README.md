# my.files

> _collection of my config files for easy customization - i.e., copying my style
> made really simple..._

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

My collection of configuration files for [Git](https://git-scm.com/))/
[GitHub](https://github.com/), [bash](https://www.gnu.org/software/bash/),
[xonsh](https://xon.sh/) (with GitHub integration via
[gitsome](https://github.com/donnemartin/gitsome)), and
[HyperTerm](https://hyperterm.org/) on macOS and Linux Ubuntu.

---

## Directions/Roadmap
```bash
git clone https://github.com/nhejazi/mydotfiles.git ~/.dotfiles
sh ~/.dotfiles/_setup.sh
```

__N.B.__,
*  Before running `sh ~/.dotfiles/_setup.sh`, update _user.name_ and
    _user.email_ in the `gitconfig` file appropriately.

*  To use the gitsome CLI (to add GitHub integration to xonsh), simply run
    `gh-configure` after installing gitsome via `pip install gitsome`. This
    assumes xonsh has been properly installed already (via `pip install xonsh`).

---

## License

&copy; 2016 [Nima Hejazi](http://nimahejazi.org)

This repository is licensed under the MIT license. See `LICENSE` for details.
