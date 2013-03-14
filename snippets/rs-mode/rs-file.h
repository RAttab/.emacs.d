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

#pragma once

namespace ${4:Datacratic} {

$0

} // namespace $4
