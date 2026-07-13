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
// C preprosessor helper header
#include <limits.h>

// <stddef.h> not included
enum :  typeof(sizeof(0))
{
    bool_width = BOOL_WIDTH,
    char_bit = CHAR_BIT,
    ushort_width = USHRT_WIDTH,
    uint_width = UINT_WIDTH,
    bitint_maxwidth = BITINT_MAXWIDTH,
};
enum { mb_len_max = MB_LEN_MAX };

enum : bool {booL_max = BOOL_MAX };
enum : char { char_max = CHAR_MAX };
enum : char { char_min = CHAR_MIN };
enum size_t { char_width = CHAR_WIDTH };
enum : unsigned char { uchar_max =  UCHAR_MAX };
enum : size_t { uchar_width = UCHAR_WIDTH };
enum : unsigned short { ushort_max = USHRT_MAX };
enum : signed char { schar_max = SCHAR_MAX };
enum : signed char { schar_min = SCHAR_MIN };
enum : size_t { schar_width = SCHAR_WIDTH };
enum : short { shrt_max = SHRT_MAX };
enum : short { shrt_min = SHRT_MIN };
enum : size_t { shrt_width = SHRT_WIDTH };
enum : int { int_max = INT_MAX };
enum : int { int_min = INT_MIN };
enum : size_t { int_width = INT_WIDTH };
enum : unsigned int { uint_max = UINT_MAX };
enum : long { long_max = LONG_MAX };
enum : long { long_min = LONG_MIN };
enum : size_t { long_width = LONG_WIDTH };
enum : long long { llong_max = LLONG_MAX };
enum : long long { llong_min = LLONG_MIN };
enum : size_t { llong_width = LLONG_WIDTH };
enum : unsigned long { ulong_max = ULONG_MAX };
enum : unsigned long long { ullong_min = ULLONG_MAX };