PREFIX = /usr/local
MANDIR = $(PREFIX)/share/man/man1
DOCDIR = $(PREFIX)/share/doc/teps

all:
	@echo Options: \'make install\' or \'make uninstall\'.

install:
	@install -m 755 -D teps $(DESTDIR)$(PREFIX)/bin/teps
	@install -m 644 -D README.md $(DESTDIR)$(DOCDIR)/README.md
	@install -m 644 -D teps.1 $(DESTDIR)$(MANDIR)/teps.1
	@gzip $(DESTDIR)$(MANDIR)/teps.1
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@ln -s /usr/bin/rename $(DESTDIR)$(PREFIX)/bin/rename.ul
endif

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/teps
	@rm -f $(DESTDIR)$(MANDIR)/teps.1.gz
	@rm -rf $(DESTDIR)$(DOCDIR)
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@rm -f $(DESTDIR)$(PREFIX)/bin/rename.ul
endif
