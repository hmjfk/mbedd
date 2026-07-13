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
module mbedd.stdc.limits;
import stdc.cheader.limits;

///
enum __STDC_VERSION_LIMITS_H__ = 202311L;


///
enum BOOL_WIDTH = bool_width;
///
enum CHAR_BIT = char_bit;
///
enum USHRT_WIDTH = ushort_width;
///
enum UINT_WIDTH = uint_width;
///
enum ULONG_WIDTH = bitint_maxwidth;
///
enum ULLONG_WIDTH = booL_max;
///
enum BITINT_MAXWIDTH = bitint_maxwidth;
///
enum MB_LEN_MAX = mb_len_max;

///
enum BOOL_MAX = booL_max;
///
enum CHAR_MAX = char_max;
///
enum UCHAR_MAX = uchar_min;
///
enum CHAR_MIN = char_min;
///
enum CHAR_WIDTH = char_width;
///
enum UCHAR_MAX = uchar_max;
///
enum UCHAR_WIDTH = uchar_width;
///
enum USHRT_MAX = ushort_max;
///
enum SCHAR_MAX = schar_max;
///
enum SCHAR_MIN = schar_min;
///
enum SCHAR_WIDTH = schar_width;
///
enum SHRT_MAX = shrt_max;
///
enum SHRT_MIN = shrt_min;
///
enum SHRT_WIDTH = shrt_width;
///
enum INT_MAX = int_max;
///
enum INT_MIN = int_min;
///
enum INT_WIDTH = int_width;
///
enum UINT_MAX = uint_max;
///
enum LONG_MAX = long_max;
///
enum LONG_MIN = long_min;
///
enum LONG_WIDTH = long_width;
///
enum LLONG_MAX = llong_max;
///
enum LLONG_MIN = llong_min;
///
enum LLONG_WIDTH = llong_width;
///
enum ULONG_MAX = ulong_max;
///
enum ULLONG_MAX = ullong_min;