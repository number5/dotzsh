# compinit

[![License](https://img.shields.io/badge/license-MIT-007EC7)](/LICENSE)
[![built for](https://img.shields.io/badge/built%20for-%20%F0%9F%A6%93%20zshzoo-black)][zshzoo]

> A smarter way to initialize Zsh completions

## Installation

### Install with a Zsh plugin manager

To install using a Zsh plugin manager, add the following to your .zshrc

- [pz]: `pz source zshzoo/compinit`
- [zcomet]: `zcomet load zshzoo/compinit`
- [zgenom]: `zgenom load zshzoo/compinit`
- [znap]: `znap source zshzoo/compinit`

### Install manually, without a plugin manager

To install manually, first clone the repo:

```zsh
git clone https://github.com/zshzoo/compinit ${ZDOTDIR:-~}/.zplugins/compinit
```

Then, in your .zshrc, add the following line:

```zsh
source ${ZDOTDIR:-~}/.zplugins/compinit/compinit.zsh
```


[zshzoo]: https://github.com/zshzoo/zshzoo
[pz]: https://github.com/mattmc3/pz
[zcomet]: https://github.com/agkozak/zcomet
[zgenom]: https://github.com/jandamm/zgenom
[znap]: https://github.com/marlonrichert/zsh-snap
