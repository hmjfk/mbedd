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
module stdcpp.bit;

/// all freestanding
@nogc
extern (C++, "std")
{
    /// [bit.cast], bit_cast
    To bit_cast(To, From)(const ref From from) nothrow; // The C++ side uses a `requires` clause.
    
    /// [bit.byteswap], byteswap
    T byteswap(T)(T n) nothrow;
    
    /// [bit.pow.two], integral powers of 2
    bool has_single_bit(T)(T x) nothrow;
    /// ditto
    T bit_ceil(T)(T x);
    /// ditto
    T bit_floor(T)(T x) nothrow;
    /// ditto
    int bit_width(T)(T x) nothrow;

    /// [bit.shift], shifting
    T shl(T, S)(T x, S s) nothrow;
    /// ditto
    T shr(T, S)(T x, S s) nothrow;

    /// [bit.rotate], rotating
    T rotl(T)(T x, int s) nothrow;
    /// ditto
    T rotr(T)(T x, int s) nothrow;
    
    /// [bit.count], counting
    int countl_zero(T)(T x) nothrow;
    /// ditto
    int countl_one(T)(T x) nothrow;
    /// ditto
    int countr_zero(T)(T x) nothrow;
    /// ditto
    int countr_one(T)(T x) nothrow;
    /// ditto
    int popcount(T)(T x) nothrow;
    
    /// [bit.permute], permutation
    T bit_reverse(T)(T x) nothrow;
    /// ditto
    T bit_repeat(T)(T x, int l);
    /// ditto
    T bit_compress(T)(T x, T m) nothrow;
    /// ditto
    T bit_expand(T)(T x, T m) nothrow;

    /// [bit.endian], endian
    version(D_Ddoc)
    {
        private enum see_below = true;
        enum endian
        {
            little = see_below,
            big = see_below,
            native = see_below
        }
    }
    else version (LittleEndian)
    {
        enum endian
        {
            little,
            big,
            native = little,
        }
    }
    else version (BigEndian)
    {
        enum endian
        {
            little,
            big,
            native = big,
        }
    }
}
