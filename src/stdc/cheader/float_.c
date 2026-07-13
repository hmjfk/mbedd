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
#include <float.h>
// C preprosessor helper header

const float flt_mant_dig = FLT_MANT_DIG; 
const double dbl_mant_dig =  DBL_MANT_DIG;
const long double ldbl_mant_dig =  LDBL_MANT_DIG;

const float flt_norm_max = FLT_NORM_MAX;
const double dbl_norm_max = DBL_NORM_MAX;
const long double ldbl_norm_max = LDBL_NORM_MAX;

const float flt_true_min = FLT_TRUE_MIN;
const double dbl_flt_true_min = DBL_TRUE_MIN;
const long double ldbl_true_min = LDBL_TRUE_MIN;