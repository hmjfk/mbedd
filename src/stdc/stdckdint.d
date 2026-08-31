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
module stdc.stdckdint;
/**
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     stdc/stdckdint.d
Standards:  ISO/IEC 9899:2024, ISO/IEC 14882:2026

本部品集では、移植性を確保するためにC++側の宣言を採用することにした。
*/

extern(C++):
nothrow:
@nogc:
@live:

///
enum  __STDC_VERSION_STDCKDINT_H__ = 202311L;

///
bool ckd_add(type1, type2, type3)(return type1* result, type2 a, type3 b);
///
bool ckd_sub(type1, type2, type3)(return type1* result, type2 a, type3 b);
///
bool ckd_mul(type1, type2, type3)(return type1* result, type2 a, type3 b);