CEDET_VER=1.1
ORG_VER=7.8.08
MAGIT_VER=1.1.1

MAKEINFO=makeinfo # replace with echo if makeinfo isn't available.
CORES=2

all: cedet org magit

cedet:
	-rm -rf vendor/cedet-$(CEDET_VER)
	cd vendor && tar xzf cedet-$(CEDET_VER).tar.gz
	cd vendor/cedet-$(CEDET_VER) && make -j$(CORES) EMACS=emacs MAKEINFO=$(MAKEINFO)
	-rm vendor/cedet
	cd vendor && ln -s cedet-$(CEDET_VER) cedet

org:
	-rm -rf vendor/org-$(ORG_VER)
	cd vendor && tar xzf org-$(ORG_VER).tar.gz
	cd vendor/org-$(ORG_VER) && make -j$(CORES)
	-rm vendor/org
	cd vendor && ln -s org-$(ORG_VER) org

magit:
	-rm -rf vendor/magit-$(MAGIT_VER)
	cd vendor && tar xzf magit-$(MAGIT_VER).tar.gz
	cd vendor/magit-$(MAGIT_VER) && make -j$(CORES)
	-rm vendor/magit
	cd vendor && ln -s magit-$(MAGIT_VER) magit

.PHONY: cedet org magit
