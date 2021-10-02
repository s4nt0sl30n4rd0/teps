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

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/teps
	@rm -f $(DESTDIR)$(MANDIR)/teps.1.gz
	@rm -rf $(DESTDIR)$(DOCDIR)
