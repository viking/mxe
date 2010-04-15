# This file is part of mingw-cross-env.
# See doc/index.html for further information.

# GNU Libtool
PKG             := libtool
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.2.6b
$(PKG)_CHECKSUM := 5afa73c8ef9ebe64bbb438a0f8779c9036e43c55
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_WEBSITE  := http://www.gnu.org/software/$(PKG)/
$(PKG)_URL      := http://ftp.gnu.org/gnu/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    wget -q -O- 'http://git.savannah.gnu.org/gitweb/?p=$(PKG).git;a=tags' | \
    grep '<a class="list name"' | \
    $(SED) -n 's,.*<a[^>]*>v\([0-9][^<]*\)<.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)/libltdl' && ./configure \
        --host='$(TARGET)' \
        --prefix='$(PREFIX)/$(TARGET)' \
        --disable-shared \
        --enable-ltdl-install
    $(MAKE) -C '$(1)/libltdl' -j '$(JOBS)'
    $(MAKE) -C '$(1)/libltdl' -j 1 install
endef