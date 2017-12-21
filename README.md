# gentoo-snappy
An unofficial Gentoo Overlay that enables installation of Canonical's "Snappy" backbone.

## Add the Overlay
Gentoo's currently preferred Overlay system is through using a git sync.  What follows are abbreviated instructions assuming that you already have the `dev-vcs/git` and  `app-portage/layman` packages installed.

Add the overlay:

    # layman -o https://raw.githubusercontent.com/gentoomaniac/gentoo-snappy/master/gentoo-snappy.xml -f -a gentoo-snappy

Sync overlay:

    # layman -S

## Packages
### `app-emulation/snapd`
Based off of Docker being available within this portage category, I have placed snapd (the guts of snappy) here as well.  Installation of this package will draw in `sys-apps/snap-confine` as a dependency.

### `sys-apps/snap-confine`
Provides sandbox type isolation of individual snap packages.  This is a dependency of `snapd` proper.

## Installation

    # emerge -av app-emulation/snapd

## Post-installation

    # systemctl enable --now snapd.service
