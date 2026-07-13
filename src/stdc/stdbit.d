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
module stdc.stdbit;
public import stdc.cheader.stdbit;

/// ditto
enum __STDC_VERSION_STDBIT_H__ = 202311L;

/// ditto
enum : bool
{
    /// ditto
    __STDC_ENDIAN_LITTLE__,
    /// ditto
    __STDC_ENDIAN_BIG__
}

version(D_Ddoc)
{
    /// ditto
    enum __STDC_ENDIAN_NATIVE__;
}
else version (BigEndian)
{
    enum __STDC_ENDIAN_NATIVE__ =  __STDC_ENDIAN_BIG__;
}
else version(LittleEndian)
{
    enum __STDC_ENDIAN_NATIVE__ =  __STDC_ENDIAN_LITTLE__;
}

/// stdc_leading_zeros function generic macro
alias stdc_leading_zeros = stdc_leading_zeros_uc;
/// ditto
alias stdc_leading_zeros = stdc_leading_zeros_us;
/// ditto
alias stdc_leading_zeros = stdc_leading_zeros_ui;
/// ditto
alias stdc_leading_zeros = stdc_leading_zeros_ul;
/// ditto
alias stdc_leading_zeros = stdc_leading_zeros_ull;

/// stdc_leading_ones function generic macro
alias stdc_leading_ones = stdc_leading_ones_uc;
/// ditto
alias stdc_leading_ones = stdc_leading_ones_us;
/// ditto
alias stdc_leading_ones = stdc_leading_ones_ui;
/// ditto
alias stdc_leading_ones = stdc_leading_ones_ul;
/// ditto
alias stdc_leading_ones = stdc_leading_ones_ull;


/// stdc_trailing_zeros function generic macro
alias stdc_trailing_zeros = stdc_leading_ones_uc;
/// ditto
alias stdc_trailing_zeros = stdc_leading_ones_us;
/// ditto
alias stdc_trailing_zeros = stdc_leading_ones_ui;
/// ditto
alias stdc_trailing_zeros = stdc_leading_ones_ul;
/// ditto
alias stdc_trailing_zeros = stdc_leading_ones_ull;

/// stdc_trailing_ones function generic macro
alias stdc_trailing_ones = stdc_trailing_ones_uc;
/// ditto
alias stdc_trailing_ones = stdc_trailing_ones_us;
/// ditto
alias stdc_trailing_ones = stdc_trailing_ones_ui;
/// ditto
alias stdc_trailing_ones = stdc_trailing_ones_ul;
/// ditto
alias stdc_trailing_ones = stdc_trailing_ones_ull;

/// stdc_first_leading_zero function generic macro
alias stdc_first_leading_zero = stdc_first_leading_zero_uc;
/// ditto
alias stdc_first_leading_zero = stdc_first_leading_zero_us;
/// ditto
alias stdc_first_leading_zero = stdc_first_leading_zero_ui;
/// ditto
alias stdc_first_leading_zero = stdc_first_leading_zero_ul;
/// ditto
alias stdc_first_leading_zero = stdc_first_leading_zero_ull;

/// stdc_first_leading_one function generic macro
alias stdc_first_leading_one = stdc_first_leading_one_uc;
/// ditto
alias stdc_first_leading_one = stdc_first_leading_one_us;
/// ditto
alias stdc_first_leading_one = stdc_first_leading_one_ui;
/// ditto
alias stdc_first_leading_one = stdc_first_leading_one_ul;
/// ditto
alias stdc_first_leading_one = stdc_first_leading_one_ull;

/// stdc_first_trailing_zero function generic macro
alias stdc_first_trailing_zero = stdc_first_trailing_zero_uc;
/// ditto
alias stdc_first_trailing_zero = stdc_first_trailing_zero_us;
/// ditto
alias stdc_first_trailing_zero = stdc_first_trailing_zero_ui;
/// ditto
alias stdc_first_trailing_zero = stdc_first_trailing_zero_ul;
/// ditto
alias stdc_first_trailing_zero = stdc_first_trailing_zero_ull;

/// stdc_first_trailing_one function generic macro
alias stdc_first_trailing_one = stdc_first_trailing_one_uc;
/// ditto
alias stdc_first_trailing_one = stdc_first_trailing_one_us;
/// ditto
alias stdc_first_trailing_one = stdc_first_trailing_one_ui;
/// ditto
alias stdc_first_trailing_one = stdc_first_trailing_one_ul;
/// ditto
alias stdc_first_trailing_one = stdc_first_trailing_one_ull;

/// stdc_count_zeros function generic macro
alias stdc_count_zeros = stdc_count_zeros_uc;
/// ditto
alias stdc_count_zeros = stdc_count_zeros_us;
/// ditto
alias stdc_count_zeros = stdc_count_zeros_ui;
/// ditto
alias stdc_count_zeros = stdc_count_zeros_ul;
/// ditto
alias stdc_count_zeros = stdc_count_zeros_ull;

/// stdc_count_ones function generic macro
alias stdc_count_ones = stdc_count_ones_uc;
/// ditto
alias stdc_count_ones = stdc_count_ones_us;
/// ditto
alias stdc_count_ones = stdc_count_ones_ui;
/// ditto
alias stdc_count_ones = stdc_count_ones_ul;
/// ditto
alias stdc_count_ones = stdc_count_ones_ull;

/// stdc_has_single_bit function generic macro
alias stdc_has_single_bit = stdc_has_single_bit_uc;
/// ditto
alias stdc_has_single_bit = stdc_has_single_bit_us;
/// ditto
alias stdc_has_single_bit = stdc_has_single_bit_ui;
/// ditto
alias stdc_has_single_bit = stdc_has_single_bit_ul;
/// ditto
alias stdc_has_single_bit = stdc_has_single_bit_ull;

/// stdc_bit_width function generic macro
alias stdc_bit_width = stdc_bit_width_uc;
/// ditto
alias stdc_bit_width = stdc_bit_width_us;
/// ditto
alias stdc_bit_width = stdc_bit_width_ui;
/// ditto
alias stdc_bit_width = stdc_bit_width_ul;
/// ditto
alias stdc_bit_width = stdc_bit_width_ull;

/// stdc_bit_floor function generic macro
alias stdc_bit_floor = stdc_bit_floor_uc;
/// ditto
alias stdc_bit_floor = stdc_bit_floor_us;
/// ditto
alias stdc_bit_floor = stdc_bit_floor_ui;
/// ditto
alias stdc_bit_floor = stdc_bit_floor_ul;
/// ditto
alias stdc_bit_floor = stdc_bit_floor_ull;

/// stdc_bit_ceil function generic macro
alias stdc_bit_ceil = stdc_bit_ceil_uc;
/// ditto
alias stdc_bit_ceil = stdc_bit_ceil_us;
/// ditto
alias stdc_bit_ceil = stdc_bit_ceil_ui;
/// ditto
alias stdc_bit_ceil = stdc_bit_ceil_ul;
/// ditto
alias stdc_bit_ceil = stdc_bit_ceil_ull;

/// stdc_rotate_left function generic macro
alias stdc_rotate_left = stdc_rotate_left_uc;
/// ditto
alias stdc_rotate_left = stdc_rotate_left_us;
/// ditto
alias stdc_rotate_left = stdc_rotate_left_ui;
/// ditto
alias stdc_rotate_left = stdc_rotate_left_ul;
/// ditto
alias stdc_rotate_left = stdc_rotate_left_ull;

/// stdc_rotate_right function generic macro
alias stdc_rotate_right = stdc_rotate_right_uc;
/// ditto
alias stdc_rotate_right = stdc_rotate_right_us;
/// ditto
alias stdc_rotate_right = stdc_rotate_right_ui;
/// ditto
alias stdc_rotate_right = stdc_rotate_right_ul;
/// ditto
alias stdc_rotate_right = stdc_rotate_right_ull;