PREFIX = /usr/local
MANDIR = $(PREFIX)/share/man/man1
DOCDIR = $(PREFIX)/share/doc/teps

all:
	@echo Options: \'make install\' or \'make uninstall\'.

install:
	@mkdir -p $(PREFIX)/bin
	@mkdir -p $(MANDIR)
	@mkdir -p $(DOCDIR)
	@cp -p teps $(PREFIX)/bin
	@chmod 755 $(PREFIX)/bin/teps
	@cp -p README.md $(DOCDIR)
	@cp -p teps.1 $(MANDIR)
	@gzip $(MANDIR)/teps.1
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@ln -s /usr/bin/rename $(PREFIX)/bin/rename.ul
endif

uninstall:
	@rm -f $(PREFIX)/bin/teps
	@rm -f $(MANDIR)/teps.1.gz
	@rm -rf $(DOCDIR)
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@rm -f $(PREFIX)/bin/rename.ul
endif
