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
module stdcpp.numeric;
import stdcpp.type_traits: common_type_t;

@live
@nogc
extern(C++, "std")
{
    /// [numeric.ops.gcd], greatest common divisor
    common_type_t!(M, N) gcd(M, N)(M m, N n);
    
    /// [numeric.ops.lcm], least common multiple
    common_type_t!(M, N) lcm(M, N)(M m, N n);
    
    /// [numeric.ops.lcm], least common multiple
    T midpoint(T)(T a, T b) nothrow;
    ///
    T* midpoint(T)(T* a, T* b);
    
    /// [numeric.sat], saturation arithmetic
    T add_sat(T)(T x, T y) nothrow;
    ///
    T sub_sat(T)(T x, T y) nothrow;
    ///
    T mul_sat(T)(T x, T y) nothrow;
    ///
    T div_sat(T)(T x, T y) nothrow;
    ///
    T saturate_cast(T, U)(U x) nothrow;
}