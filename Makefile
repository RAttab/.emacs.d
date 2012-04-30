CEDET_VER=1.1
ORG_VER=7.8.08

MAKEINFO=makeinfo # replace with echo if makeinfo isn't available.

all: cedet org

cedet: clean-cedet
	-rm -rf vendor/cedet-$(CEDET_VER)
	cd vendor && tar xzf cedet-$(CEDET_VER).tar.gz
	cd vendor/cedet-$(CEDET_VER) && make -j2 EMACS=emacs MAKEINFO=$(MAKEINFO)
	cd vendor && ln -s cedet-$(CEDET_VER) cedet

org:
	-rm -rf vendor/org-$(ORG_VER)
	cd vendor && tar xzf org-$(ORG_VER).tar.gz
	cd vendor/org-$(ORG_VER) && make -j2
	cd vendor && ln -s org-$(ORG_VER) org


.PHONY: cedet org
