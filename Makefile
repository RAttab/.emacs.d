CEDET_VER=1.1
ORG_VER=7.8.08
MAGIT_VER=1.2.0
YASNIPPET_VER=0.7.0
LUA_VER=66cd58a

MAKEINFO=makeinfo # replace with echo if makeinfo isn't available.
CORES=2

all: cedet org magit yasnippet init-file

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

yasnippet:
	-rm -rf vendor/yasnippet-$(YASNIPPET_VER)
	cd vendor && tar xf yasnippet-$(YASNIPPET_VER).tar
	-rm vendor/yasnippet
	cd vendor && ln -s yasnippet-$(YASNIPPET_VER) yasnippet
	cd vendor/yasnippet && rm -rf snippets # Default snippets have precendence so get rid of them.

lua-mode:
	-rm -rf vendor/immerrr-lua-mode-$(LUA_VER)
	cd vendor && tar xzf immerrr-lua-mode-$(LUA_VER).tar.gz
	cd vendor/immerrr-lua-mode-$(LUA_VER) && make -j$(CORES)
	-rm vendor/lua-mode
	cd vendor && ln -s immerrr-lua-mode-$(LUA_VER) lua-mode

init-file:
	ln -s ~/.emacs.d/.emacs ~/.emacs

.PHONY: cedet org magit yasnippet
