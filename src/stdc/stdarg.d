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
module stdc.stdarg;
/**
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     stdc/stdarg.d
Standards:  ISO/IEC 9899:2024
*/
public import stdc.cheader.stdarg;

enum __STDC_VERSION_STDARG_H__ = 201710L;

extern(C):
nothrow:
@nogc:

version(D_Ddoc)
{
    private enum unspecified;
    ///
    alias va_list = unspecified;
}

///
pragma(LDC_va_start)
void va_start(T)(out va_list ap, ref T parmn);

///
T va_arg(T)(ref va_list ap);

///
pragma(LDC_va_end)
void va_end(va_list ap){}