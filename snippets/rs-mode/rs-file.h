# -*- mode: snippet -*-
# name: h
# key: rs-file
# expand-env: ((yas/indent-line 'fixed))
# --
/** `(file-name-nondirectory (buffer-file-name))`                                 -*- C++ -*-
    Rémi Attab, `(format-time-string "%d %b %Y")`
    Copyright (c) `(format-time-string "%Y")` Datacratic.  All rights reserved.

    ${1:Description}

*/

#ifndef __${2:mmap}__${3:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}_h__
#define __$2__$3_h__

namespace Datacratic {

$0

} // Datacratic

#endif // __$2__$3_h__