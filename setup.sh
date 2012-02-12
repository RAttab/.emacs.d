#! /bin/bash

cd cedet-1.0
make EMACS=emacs # MAKEINFO=echo # in case makeinfo isn't available.
cd ..

cd org-mode
make
cd ..
