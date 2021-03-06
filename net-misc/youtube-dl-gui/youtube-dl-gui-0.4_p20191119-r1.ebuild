# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 xdg-utils

GIT_REV="4d473d9751c4c91e67edbd6d3713104f169516c6"

DESCRIPTION="A cross platform front-end GUI of the popular youtube-dl written in wxPython"
HOMEPAGE="https://github.com/MrS0m30n3/youtube-dl-gui"
SRC_URI="https://api.github.com/repos/MrS0m30n3/youtube-dl-gui/tarball/${GIT_REV} -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="ffmpeg"

RDEPEND="${PYTHON_DEPS}
	dev-python/wxpython:*[${PYTHON_USEDEP}]
	net-misc/youtube-dl
	ffmpeg? ( media-video/ffmpeg )
	dev-python/twodict"
DEPEND="${RDEPEND}"

S="${WORKDIR}/MrS0m30n3-${PN}-${GIT_REV:0:7}"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
