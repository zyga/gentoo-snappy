# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The snap-confine program helps to launch snappy applications"
HOMEPAGE="http://snapcraft.io/"
SRC_URI="https://github.com/snapcore/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
# Only have amd64 to test on
KEYWORDS="~amd64"

DEPEND="
	dev-python/docutils
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/gcc
	sys-devel/make
	virtual/libudev
	"

# Removed 'die' command because EAPI>=4
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
