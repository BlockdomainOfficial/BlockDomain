
Debian
====================
This directory contains files used to package blockdomaind/blockdomain-qt
for Debian-based Linux systems. If you compile blockdomaind/blockdomain-qt yourself, there are some useful files here.

## blockdomain: URI support ##


blockdomain-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install blockdomain-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your blockdomainqt binary to `/usr/bin`
and the `../../share/pixmaps/blockdomain128.png` to `/usr/share/pixmaps`

blockdomain-qt.protocol (KDE)

