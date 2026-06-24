/*
    mbedd - 組み込みシステム向けのD言語標準ライブラリとDruntime
    Copyright (C) 2025 - Denkousi

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Under Section 7 of GPL version 3, you are granted additional
    permissions described in the GCC Runtime Library Exception, version
    3.1, as published by the Free Software Foundation.

    You should have received a copy of the GNU General Public License and
    a copy of the GCC Runtime Library Exception along with this program;
    see the files LICENSE and LICENSE.RUNTIME respectively.  If not, see
    <http://www.gnu.org/licenses/>.
*/
/**
これは、C言語でいう<stddef.h>に相当するものである。

License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Copyright:  Copyright Denkousi 2025 -
Copyright:  Copyright Digital Mars 2000 - 2011
Authors:    Denkousi
Authors:    Walter Bright, Sean Kelly
Source:     Original is $(DRUNTIMESRC object.d)
*/
module mdrt.coredefs;


/**
 * Bottom type.
 * See $(DDSUBLINK spec/type, noreturn, `noreturn`).
 */
alias noreturn = typeof(*null);


/// void value type
alias Void = void[1];

/// string type
alias string  = immutable(char)[];
/// ditto
alias wstring = immutable(wchar)[];
/// ditto
alias dstring = immutable(dchar)[];