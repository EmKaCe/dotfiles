# Dotfiles
These files are for my personal config. Running on EndeavourOS using KDE and Wayland.

## What does this install?
- Loads the [RTW89 wireless module](https://wiki.archlinux.org/title/Network_configuration/Wireless#RTW88) 
- Replaces [yay](https://github.com/Jguer/yay) with [paru](https://github.com/Morganamilo/paru)
- Installs docker and [oxker](https://github.com/mrjackwills/oxker)
- Changes shell with Z-Shell
  - Uses [antidote](https://getantidote.github.io/)
  - [bat](https://archlinux.org/packages/extra/x86_64/bat/) + [extras](https://archlinux.org/packages/extra/any/bat-extras/)
  - [eza](https://archlinux.org/packages/extra/x86_64/eza/)
  - [powerlevel10K](https://github.com/romkatv/powerlevel10k)
  - [pyenv](https://github.com/pyenv/pyenv) + [virtualenv](https://github.com/pyenv/pyenv-virtualenv)
  - [thefuck](https://github.com/nvbn/thefuck)
  - alias for yay and paru, with sudoloop
  - alias for man to use batman
  - added calc function using python
  - alias for tree with eza
- Installs [flatpak](https://flatpak.org/) and various applications
  - [Brave Browser](https://flathub.org/apps/com.brave.Browser)
  - [Ǵalaxy Buds Manager](https://github.com/timschneeb/GalaxyBudsClient/)
  - [ProtonVPN](https://flathub.org/apps/com.protonvpn.www)
  - [qBittorrent](https://flathub.org/apps/org.qbittorrent.qBittorrent)
  - [Raspberry Pi Imager](https://flathub.org/apps/org.raspberrypi.rpi-imager)
  - [Signal Desktop](https://flathub.org/apps/org.signal.Signal)
  - [Thunderbird](https://flathub.org/apps/org.mozilla.Thunderbird)
  - [Vesktop](https://github.com/Vencord/Vesktop/)
- Adds systemd-service that auto-updates flatpaks
- Installs additional system-packages
  - [easyroam](https://aur.archlinux.org/packages/easyroam-desktop-bin)
  - [Visual Studio Code](https://aur.archlinux.org/packages/visual-studio-code-bin) + Extensions
    - GitHub.copilot
    - GrapeCity.gc-excelviewer
    - Gruntfuggly.todo-tree
    - mechatroner.rainbow-csv
    - ms-azuretools.vscode-docker
    - ms-python.python
    - ms-toolsai.jupyter
    - ms-vscode-remote.remote-containers
    - myriad-dreamin.tinymist
    - njpwerner.autodocstring
    - nvarner.typst-lsp
    - rust-lang.rust-analyzer
    - svelte.svelte-vscode
    - tomoki1207.pdf
  - [CLion](https://aur.archlinux.org/packages/clion)
  - [IntelliJ Ultimate Edition](https://aur.archlinux.org/packages/intellij-idea-ultimate-edition)
  - [PyCharm Professional](https://aur.archlinux.org/packages/pycharm-professional)
  - [PlatformIO](https://archlinux.org/packages/extra/any/platformio-core/) + [udev rules](https://archlinux.org/packages/extra/any/platformio-core-udev/)
  - [Ventoy](https://aur.archlinux.org/packages/ventoy-bin)
  - [rustup](https://rustup.rs/)
- NeoVim
  - Config based on kickstart.nvim
  - Only slight changes

## How to install
- Clone this repo **with** submodules.
```sh
git clone --recurse-submodules https://github.com/EmKaCe/dotfiles.git
```
- Note: If you wish to only use this as a basis to create your own dotfiles repo, create a fork and clone your fork instead!
- Run install.sh
- You might have to enter your sudo password a couple of times
- **Important:** Do **not** remove the cloned directory, symlinks are being used.
