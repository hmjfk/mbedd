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
<inttypes.h>
Copyright:  Copyright Sean Kelly 2005 - 2009.
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0). 
Authors:    Sean Kelly
Authors:    Denkousi
Source:     Original is $(DRUNTIMESRC core/stdc/inttypes.d)
*/
module stdc.inttypes;
public import stdc.cheader.inttypes;

nothrow:
extern(C):
@nogc:
@live:
///
intmax_t  imaxabs(intmax_t j);
/// since C2y
uintmax_t  umaxabs(uintmax_t j);
/// 
imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom);
///
intmax_t  strtoimax(const scope char* nptr, char** endptr, int base);
///
uintmax_t strtoumax(const scope char* nptr, char** endptr, int base);
///
intmax_t  wcstoimax(const scope wchar_t* nptr, wchar_t** endptr, int base);
///
uintmax_t wcstoumax(const scope wchar_t* nptr, wchar_t** endptr, int base);