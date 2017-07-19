# gentoo-snappy
An unofficial Gentoo Overlay that enables installation of Canonical's "Snappy" backbone.

## Add the Overlay using Layman ##

If you manage your overlays with layman you can add it directly by pointing at the repo XML file:

    #  layman -o https://raw.githubusercontent.com/zyga/gentoo-snappy/master/repositories.xml -f -a gentoo-snappy

## Add the Overlay Manually ##

Gentoo's currently preferred Overlay system is through using a git sync.  What follows are abbreviated instructions assuming that you already have the `dev-vcs/git` package installed.

Next, create a custom `/etc/portage/repos.conf` entry for the **gentoo-snappy** overlay, so Portage knows what to do. Make sure that `/etc/portage/repos.conf` exists, and is a directory. Then, use your text editor without line wrapping:

    # nano -w /etc/portage/repos.conf/gentoo-snappy.conf

and put the following text in the file:

```
[gentoo-snappy]
 
# An unofficial overlay that supports the installation of the "Snappy" backbone.
# Maintainer: Clayton "kefnab" Dobbs (clayton.dobbs@gosecur.us)
# Upstream Maintainer: Zygmunt "zyga" Krynicki (me@zygoon.pl)
 
location = /usr/local/portage/gentoo-snappy
sync-type = git
sync-uri = https://github.com/zyga/gentoo-snappy.git
priority = 50
auto-sync = yes
```

Then run:

    # emaint sync --repo gentoo-snappy

## Packages
### `app-emulation/snapd`
Based off of Docker being available within this portage category, I have placed snapd (the guts of snappy) here as well.  Installation of this package will draw in `sys-apps/snap-confine` as a dependency.

### `sys-apps/snap-confine`
Provides sandbox type isolation of individual snap packages.  This is a dependency of `snapd` proper.

## Installation

    # emerge -av app-emulation/snapd
    
## Post-installation

    # systemctl enable --now snapd.service
