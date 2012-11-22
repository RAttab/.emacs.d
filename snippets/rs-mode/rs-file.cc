# -*- mode: snippet -*-
# name: cc
# key: rs-file
# expand-env: ((yas/indent-line 'fixed))
# --
/** `(file-name-nondirectory (buffer-file-name))`                                 -*- C++ -*-
    Rémi Attab, `(format-time-string "%d %b %Y")`
    Copyright (c) `(format-time-string "%Y")` Datacratic.  All rights reserved.

    ${1:Description}

*/

#include "`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.h"

using namespace std;
using namespace ML;

namespace Recoset {

$0

} // namepsace Recoset
