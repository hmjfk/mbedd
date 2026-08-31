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
<float.h>
Copyright:  Copyright The D Language Foundation 2000 - 2011.
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0). 
Authors:    $(HTTP digitalmars.com, Walter Bright), Don Clugston,
            Conversion of CEPHES math library to D by Iain Buclaw and David Nadlinger
Authors:    Denkousi
Source:     Original is $(PHOBOSSRC std/math/operations.d)
*/
module stdc.float_;
public import stdc.cheader.float_;

///
enum FLT_SNAN = float.nan;
///
enum DBL_SNAN = double.nan;
///
enum LDBL_SNAN  = real.nan;

///
enum INFINITY = float.infinity;
///
enum float NAN = ()pure{ ulong v = 0x7FF0_0000_0000_0001; return *cast(double*) &v; }();

///
enum FLT_MANT_DIG = flt_mant_dig;
///
enum DBL_MANT_DIG = dbl_mant_dig;
///
enum LDBL_MANT_DIG = ldbl_mant_dig;

///
enum FLT_NORM_MAX = flt_norm_max;
///
enum DBL_NORM_MAX = dbl_norm_max;
///
enum LDBL_NORM_MAX = ldbl_norm_max;

///
enum FLT_TRUE_MIN = flt_true_min;
///
enum DBL_TRUE_MIN = dbl_flt_true_min;
///
enum LDBL_TRUE_MIN = ldbl_true_min;