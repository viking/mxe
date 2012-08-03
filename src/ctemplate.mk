PKG             := ctemplate
$(PKG)_IGNORE   :=
$(PKG)_CHECKSUM := b00a35291bc5c5bb8493a68bbf76d6a9cfa5c117
$(PKG)_SUBDIR   := ctemplate-$($(PKG)_VERSION)
$(PKG)_FILE     := ctemplate-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ctemplate.googlecode.com/files/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc pthreads

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://code.google.com/p/ctemplate/downloads/list' | \
    egrep '^\s*ctemplate-.+?\.tar.gz\s*$' | \
    sed -n 's,^ *ctemplate-\([0-9]\+\.[0-9]\+\)\.tar\.gz *$,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        --host='$(TARGET)' \
        --prefix='$(PREFIX)/$(TARGET)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef
