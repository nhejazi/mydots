# MyDotfiles

> _collection of my config files for easy customization - i.e., copying my style
> made really simple..._

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

Collection of configuration files for the [bash
shell](https://www.gnu.org/software/bash/), the [xonsh
shell](http://xon.sh/), and [Git](http://git-scm.com/) with
[GitHub](http://github.com/), as well as Git/GitHub shell
completion via the [gitsome
CLI](http://github.com/donnemartin/gitsome) on Mac OSX and
Linux Ubuntu.

## Directions/Roadmap
```bash
git clone https://github.com/nhejazi/mydotfiles.git ~/.dotfiles
sh ~/.dotfiles/_setup.sh
```

__N.B.__, 
*  Before running `sh ~/.dotfiles/_setup.sh`, update _user.name_ and
   _user.email_ in the `gitconfig` file appropriately.

*  To use the gitsome CLI (to add GitHub integration to xonsh),
   simply run `gh-configure` after installing gitsome via
   `pip install gitsome`. This assumes `Xonsh` has been properly
   installed already (via `pip install xonsh`).

---

## License

&copy; 2016 Nima Hejazi

This repository is licensed under the MIT license. See `LICENSE` for details.
