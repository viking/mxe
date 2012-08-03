PKG             := qhttpserver
$(PKG)_IGNORE   :=
$(PKG)_CHECKSUM := b1ec4347eb692465b5ab49888ed98d2045bfeac4
$(PKG)_SUBDIR   := nikhilm-qhttpserver-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/nikhilm/qhttpserver/tarball/$($(PKG)_VERSION)
$(PKG)_DEPS     := gcc qt

define $(PKG)_UPDATE
    echo 'Warning: Updates are disabled for package qhttpserver.' >&2;
endef

define $(PKG)_BUILD
    cd '$(1)' && $(PREFIX)/bin/$(TARGET)-qmake \
      -r PREFIX="$(PREFIX)/$(TARGET)"
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef
