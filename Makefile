PREFIX ?= /usr
#MANDIR ?= $(PREFIX)/share/man
DOCDIR ?= $(PREFIX)/share/doc/teps

all:
	@echo Options: install or uninstall.

install:
#	@mkdir -p $(MANDIR)/man1
	@mkdir -p $(DOCDIR)
	@cp -p teps $(PREFIX)/bin/teps
	@chmod 755 $(PREFIX)/bin/teps
	@cp -p README.md $(DOCDIR)
#	@cp -p teps.1 $(MANDIR)/man1
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@ln -s /usr/bin/rename /usr/bin/rename.ul
endif

uninstall:
	@rm -f $(PREFIX)/bin/teps
#	@rm -f $(MANDIR)/man1/teps.1
	@rm -rf $(DOCDIR)
ifneq ($(shell ls -d /etc/apt 2>&-),/etc/apt)
	@rm -f /usr/bin/rename.ul
endif
