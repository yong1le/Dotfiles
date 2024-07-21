#!/usr/bin/env bash

# Seting up DNF
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf update -y

# Install Hyprland Stuff
sudo dnf copr -y enable solopasha/hyprland
sudo dnf install -y \
  hyprland \
  hyprland-devel \
  hyprpicker \
  hypridle \
  hyprlock \
  grim slurp swappy \
  waybar-git \
  SwayNotificationCenter \
  aylurs-gtk-shell-git \
  cliphist \
  swww waypaper \
  network-manager-applet blueman \
  pamixer brightnessctl pavucontrol \
  polkit-gnome gnome-keyring gdm-1
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
# SwayOSD building
sudo dnf install -y \
  gtk-layer-shell-devel \
  gtk3-devel
git clone https://github.com/ErikReider/SwayOSD
cd SwayOSD || exit
meson setup build --prefix /usr/lib
ninja -C build
meson install -C build
cd .. && rm -rf SwayOSD
sudo systemctl enable --now swayosd-libinput-backend.service

# Install Core Programs
sudo dnf install -y \
  neovim \
  tmux \
  zoxide \
  alacritty \
  zsh \
  ripgrep \
  fzf \
  fd-find \
  btop \
  nautilus \
  xlsclients \
  fcitx5 fcitx5-chinese-addons \
  baobab \
  socat

sudo dnf copr enable -y atim/lazygit
sudo dnf copr enable -y atim/starship
sudo dnf copr enable -y tofik/nwg-shell
sudo dnf install -y lazygit starship lazygit nwg-look

# Rust
sudo dnf install -y rustup
rustup-init -y

# Node
curl -fsSL https://fnm.vercel.app/install | bash
~/.local/share/fnm/fnm install --lts
~/.local/share/fnm/fnm default "$(fnm ls | awk '{print $2}' | head -n 1)"

# Go
sudo dnf install -y golang

# Gradience
sudo dnf install -y lyessaadi/gradience
sudo dnf install -y gradience adw-gtk3-theme
flatpak install -y org.gtk.Gtk3theme.adw-gtk3
flatpak install -y org.gtk.Gtk3theme.adw-gtk3-dark

# Flatpak Apps
flatpak install -y \
  com.github.tchx84.Flatseal \
  com.spotify.Client \
  dev.vencord.Vesktop \
  io.dbeaver.DBeaverCommunity \
  io.github.celluloid_player.Celluloid \
  io.github.realmazharhussain.GdmSettings \
  io.gitlab.adhami3310.Converter \
  org.gnome.Loupe \
  org.gnome.Papers \
  org.gnome.Snapshot \
  org.mozilla.firefox

# User Configs  NOTE: Dotfiles should be in ~/Dotfiles
sudo dnf install -y xdg-user-dirs
xdg-user-dirs-update
chsh -s /usr/bin/zsh

sudo dnf install -y stow
stow ~/Dotfiles/swayosd
stow ~/Dotfiles/tmux
stow ~/Dotfiles/lazyvim
stow ~/Dotfiles/swaync
stow ~/Dotfiles/starship
stow ~/Dotfiles/swappy
stow ~/Dotfiles/starship
stow ~/Dotfiles/tmux
stow ~/Dotfiles/waybar
stow ~/Dotfiles/electron
stow ~/Dotfiles/alacritty
stow ~/Dotfiles/ags
stow ~/Dotfiles/hyprland
stow ~/Dotfiles/gradience
