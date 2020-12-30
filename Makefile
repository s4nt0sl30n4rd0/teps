PREFIX ?= /usr
MANDIR ?= $(PREFIX)/share/man
DOCDIR ?= $(PREFIX)/share/doc/teps

all:
	@echo Run \'make install\' to install teps.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@cp -p teps $(DESTDIR)$(PREFIX)/bin/teps
	@cp -p teps.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/teps

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/teps
	@rm -rf $(DESTDIR)$(MANDIR)/man1/teps.1*
	@rm -rf $(DESTDIR)$(DOCDIR)
