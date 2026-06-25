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

@nogc
extern (C++, "std")
{
    /// bit_cast
    To bit_cast(To, From)(const ref From from) nothrow; // The C++ side uses a `requires` clause.
    
    /// byteswap
    T byteswap(T)(T n) nothrow;
    
    /// integral powers of 2
    bool has_single_bit(T)(T x) nothrow;
    ///
    T bit_ceil(T)(T x);
    ///
    T bit_floor(T)(T x) nothrow;
    ///
    int bit_width(T)(T x) nothrow;

    /// rotating
    T rotl(T)(T x, int s) nothrow;
    ///
    T rotr(T)(T x, int s) nothrow;
    
    /// counting
    int countl_zero(T)(T x) nothrow;
    ///
    int countl_one(T)(T x) nothrow;
    ///
    int countr_zero(T)(T x) nothrow;
    ///
    int countr_one(T)(T x) nothrow;
    ///
    int popcount(T)(T x) nothrow;

    /// endian
    version (LittleEndian)
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
