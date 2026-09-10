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
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     stdc/monetary.d
*/
module stdc.monetary;

public import stdc.sys.types: ssize_t;
public import stdc.stddef: size_t;
public import stdc.locale: locale_t;


extern(C):
nothrow:
@nogc:
@live:

///
ssize_t strfmon(return scope char*  s, size_t maxsize, scope const(char*) format, ...);
///
ssize_t strfmon_l(return scope char*  s, size_t maxsize, locale_t locale, scope const(char*) format, ...);