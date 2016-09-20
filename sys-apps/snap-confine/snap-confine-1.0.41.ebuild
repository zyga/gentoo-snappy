# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The snap-confine program helps to launch snappy applications"
HOMEPAGE="http://snapcraft.io/"
# Changed SRC_URI because recent update is not a 'releases' path; as such package renaming becomes needed.
# SRC_URI="https://github.com/snapcore/${PN}/releases/download/${PV}/${P}.tar.gz"
# non-standard versioning upstream makes package renaming (below) prudent
SRC_URI="https://github.com/snapcore/${PN}/archive/${PV}.tar.gz -> ${PF}.tar.gz"
# Unofficial ebuild, so mirrors should not be checked for packages.
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
# Only have amd64 to test on
KEYWORDS="~amd64"

DEPEND="dev-python/docutils
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/gcc
	sys-devel/make
	virtual/libudev"

# Note: Formerly, the || die construct had to be used after every command to check for errors. This is no longer necessary in EAPI 4 -
# functions provided by Portage will die by themselves if something failed.
# DIE WILL NOT WORK within a subshell or with external binaries.

src_configure() {
	econf --disable-apparmor
}

src_compile() {
	emake || die "emake failed"
	# check is broken in 1.0.40, will be fixed in .41
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md PORTING
}
