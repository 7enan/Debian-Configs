#!/bin/bash

yes | sudo apt-get install cargo rustc libgtk-layer-shell-dev libgtk-3-dev libpango-1.0-0 librust-gdk-pixbuf-sys-dev libdbusmenu-gtk3-dev libcairo-5c-dev libcairo-gobject2 libgio-2.0-dev librust-glib-sys-dev librust-gobject-sys-dev libgcc-15-dev <<< 'y'

git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
sudo mv ./eww /usr/bin/
cd ~
rm -rf ~/eww

