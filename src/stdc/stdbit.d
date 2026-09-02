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
public import stdc.stdint;
public import stdc.config: c_ulong;
public import stdc.limits;

extern (C):
nothrow:
@nogc:
@live:

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

///
uint stdc_leading_zeros_uc(ubyte value) pure;
/// ditto
uint stdc_leading_zeros_us(ushort value) pure;
/// ditto
uint stdc_leading_zeros_ui(uint value) pure;
/// ditto
uint stdc_leading_zeros_ul(c_ulong value) pure;
/// ditto
uint stdc_leading_zeros_ull(ulong value) pure;

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

/// ditto
uint stdc_leading_ones_uc(ubyte value) pure;
/// ditto
uint stdc_leading_ones_us(ushort value) pure;
/// ditto
uint stdc_leading_ones_ui(uint value) pure;
/// ditto
uint stdc_leading_ones_ul(c_ulong value) pure;
/// ditto
uint stdc_leading_ones_ull(ulong value) pure;
/// ditto

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

/// ditto
uint stdc_trailing_zeros_uc(ubyte value) pure;
/// ditto
uint stdc_trailing_zeros_us(ushort value) pure;
/// ditto
uint stdc_trailing_zeros_ui(uint value) pure;
/// ditto
uint stdc_trailing_zeros_ul(c_ulong value) pure;
/// ditto
uint stdc_trailing_zeros_ull(ulong value) pure;

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

/// ditto
uint stdc_trailing_ones_uc(ubyte value) pure;
/// ditto
uint stdc_trailing_ones_us(ushort value) pure;
/// ditto
uint stdc_trailing_ones_ui(uint value) pure;
/// ditto
uint stdc_trailing_ones_ul(c_ulong value) pure;
/// ditto
uint stdc_trailing_ones_ull(ulong value) pure;

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

/// ditto
uint stdc_first_leading_zero_uc(ubyte value) pure;
/// ditto
uint stdc_first_leading_zero_us(ushort value) pure;
/// ditto
uint stdc_first_leading_zero_ui(uint value) pure;
/// ditto
uint stdc_first_leading_zero_ul(c_ulong value) pure;
/// ditto
uint stdc_first_leading_zero_ull(ulong value) pure;

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

/// ditto
uint stdc_first_leading_one_uc(ubyte value) pure;
/// ditto
uint stdc_first_leading_one_us(ushort value) pure;
/// ditto
uint stdc_first_leading_one_ui(uint value) pure;
/// ditto
uint stdc_first_leading_one_ul(c_ulong value) pure;
/// ditto
uint stdc_first_leading_one_ull(ulong value) pure;

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

/// ditto
uint stdc_first_trailing_zero_uc(ubyte value) pure;
/// ditto
uint stdc_first_trailing_zero_us(ushort value) pure;
/// ditto
uint stdc_first_trailing_zero_ui(uint value) pure;
/// ditto
uint stdc_first_trailing_zero_ul(c_ulong value) pure;
/// ditto
uint stdc_first_trailing_zero_ull(ulong value) pure;

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

/// ditto
uint stdc_first_trailing_one_uc(ubyte value) pure;
/// ditto
uint stdc_first_trailing_one_us(ushort value) pure;
/// ditto
uint stdc_first_trailing_one_ui(uint value) pure;
/// ditto
uint stdc_first_trailing_one_ul(c_ulong value) pure;
/// ditto
uint stdc_first_trailing_one_ull(ulong value) pure;

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

/// ditto
uint stdc_count_zeros_uc(ubyte value) pure;
/// ditto
uint stdc_count_zeros_us(ushort value) pure;
/// ditto
uint stdc_count_zeros_ui(uint value) pure;
/// ditto
uint stdc_count_zeros_ul(c_ulong value) pure;
/// ditto
uint stdc_count_zeros_ull(ulong value) pure;

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

/// ditto
uint stdc_count_ones_uc(ubyte value) pure;
/// ditto
uint stdc_count_ones_us(ushort value) pure;
/// ditto
uint stdc_count_ones_ui(uint value) pure;
/// ditto
uint stdc_count_ones_ul(c_ulong value) pure;
/// ditto
uint stdc_count_ones_ull(ulong value) pure;

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

/// ditto
bool stdc_has_single_bit_uc(ubyte value) pure;
/// ditto
bool stdc_has_single_bit_us(ushort value) pure;
/// ditto
bool stdc_has_single_bit_ui(uint value) pure;
/// ditto
bool stdc_has_single_bit_ul(c_ulong value) pure;
/// ditto
bool stdc_has_single_bit_ull(ulong value) pure;

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

/// ditto
uint stdc_bit_width_uc(ubyte value) pure;
/// ditto
uint stdc_bit_width_us(ushort value) pure;
/// ditto
uint stdc_bit_width_ui(uint value) pure;
/// ditto
uint stdc_bit_width_ul(c_ulong value) pure;
/// ditto
uint stdc_bit_width_ull(ulong value) pure;

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

/// ditto
ubyte stdc_bit_floor_uc(ubyte value) pure;
/// ditto
ushort stdc_bit_floor_us(ushort value) pure;
/// ditto
uint stdc_bit_floor_ui(uint value) pure;
/// ditto
c_ulong stdc_bit_floor_ul(c_ulong value) pure;
/// ditto
ulong stdc_bit_floor_ull(ulong value) pure;

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

/// ditto
ubyte stdc_bit_ceil_uc(ubyte value) pure;
/// ditto
ushort stdc_bit_ceil_us(ushort value) pure;
/// ditto
uint stdc_bit_ceil_ui(uint value) pure;
/// ditto
c_ulong stdc_bit_ceil_ul(c_ulong value) pure;
/// ditto
ulong stdc_bit_ceil_ull(ulong value) pure;


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

/// ditto
ubyte stdc_rotate_left_uc(ubyte value, uint count) pure;
/// ditto
ushort stdc_rotate_left_us(ushort value, uint count) pure;
/// ditto
uint stdc_rotate_left_ui(uint value, uint count) pure;
/// ditto
c_ulong stdc_rotate_left_ul(c_ulong value, uint count) pure;
/// ditto
ulong stdc_rotate_left_ull(ulong value, uint count) pure;


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

/// ditto
ubyte stdc_rotate_right_uc(ubyte value, uint count) pure;
/// ditto
ushort stdc_rotate_right_us(ushort value, uint count) pure;
/// ditto
uint stdc_rotate_right_ui(uint value, uint count) pure;
/// ditto
c_ulong stdc_rotate_right_ul(c_ulong value, uint count) pure;
/// ditto
ulong stdc_rotate_right_ull(ulong value, uint count) pure;


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

static if(is(typeof(CHAR_BIT))) // importCの対応C規格が古いため、異常を診断するかもしれない。
static if (CHAR_BIT == 8)
{
    ///
    void stdc_memreverse8(size_t n, ubyte* ptr);
    /// ditto
    uint8_t stdc_memreverse8u8(uint8_t value);
    /// ditto
    uint16_t stdc_memreverse8u16(uint16_t value);
    /// ditto
    uint32_t stdc_memreverse8u32(uint32_t value);
    /// ditto
    uint64_t stdc_memreverse8u64(uint64_t value);

    /// 8bit load functions
    /// ditto
    uint_least8_t stdc_load8_leu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_load8_leu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_load8_leu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_load8_leu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_load8_beu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_load8_beu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_load8_beu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_load8_beu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_load8_aligned_leu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_load8_aligned_leu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_load8_aligned_leu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_load8_aligned_leu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_load8_aligned_beu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_load8_aligned_beu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_load8_aligned_beu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_load8_aligned_beu64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_load8_les8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_load8_les16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_load8_les32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_load8_les64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_load8_bes8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_load8_bes16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_load8_bes32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_load8_bes64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_load8_aligned_les8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_load8_aligned_les16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_load8_aligned_les32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_load8_aligned_les64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_load8_aligned_bes8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_load8_aligned_bes16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_load8_aligned_bes32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_load8_aligned_bes64(const(ubyte)* ptr);


    /// 8bit store functions
    uint_least8_t stdc_store8_leu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_store8_leu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_store8_leu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_store8_leu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_store8_beu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_store8_beu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_store8_beu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_store8_beu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_store8_aligned_leu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_store8_aligned_leu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_store8_aligned_leu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_store8_aligned_leu64(const(ubyte)* ptr);

    /// ditto
    uint_least8_t stdc_store8_aligned_beu8(const(ubyte)* ptr);
    /// ditto
    uint_least16_t stdc_store8_aligned_beu16(const(ubyte)* ptr);
    /// ditto
    uint_least32_t stdc_store8_aligned_beu32(const(ubyte)* ptr);
    /// ditto
    uint_least64_t stdc_store8_aligned_beu64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_store8_les8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_store8_les16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_store8_les32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_store8_les64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_store8_bes8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_store8_bes16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_store8_bes32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_store8_bes64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_store8_aligned_les8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_store8_aligned_les16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_store8_aligned_les32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_store8_aligned_les64(const(ubyte)* ptr);

    /// ditto
    int_least8_t stdc_store8_aligned_bes8(const(ubyte)* ptr);
    /// ditto
    int_least16_t stdc_store8_aligned_bes16(const(ubyte)* ptr);
    /// ditto
    int_least32_t stdc_store8_aligned_bes32(const(ubyte)* ptr);
    /// ditto
    int_least64_t stdc_store8_aligned_bes64(const(ubyte)* ptr);
}
