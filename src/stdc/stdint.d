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
module stdc.stdint;

version(D_Ddoc)
{

    private
    {
        enum signed_integer_type;
        enum unsigned_integer_type;
        enum see_below;
    }

    /// optional
    alias int8_t = signed_integer_type;
    /// ditto
    alias int16_t = signed_integer_type;
    /// ditto
    alias int32_t = signed_integer_type;
    /// ditto
    alias int64_t = signed_integer_type;
    /// ditto 
    alias intN_t = see_below;

    /// optional
    alias uint8_t = unsigned_integer_type;
    /// ditto
    alias uint16_t = unsigned_integer_type;
    /// ditto
    alias uint32_t = unsigned_integer_type;
    /// ditto
    alias uint64_t = unsigned_integer_type;
    /// ditto 
    alias uintN_t = see_below;

    ///
    alias  int_least8_t = signed_integer_type;
    ///
    alias  int_least16_t = signed_integer_type;
    ///
    alias  int_least32_t = signed_integer_type;
    ///
    alias  int_least64_t = signed_integer_type;
    /// optional 
    alias int_leastN_t = see_below;


    ///
    alias  uint_least8_t = unsigned_integer_type;
    ///
    alias  uint_least16_t = unsigned_integer_type;
    ///
    alias  uint_least32_t = unsigned_integer_type;
    ///
    alias  uint_least64_t = unsigned_integer_type;
    /// optional 
    alias uint_leastN_t = see_below;


    ///
    alias  int_fast8_t = signed_integer_type;
    ///
    alias  int_fast16_t = signed_integer_type;
    ///
    alias  int_fast32_t = signed_integer_type;
    ///
    alias  int_fast64_t = signed_integer_type;
    /// optional 
    alias  int_fastN_t = signed_integer_type;
    

    ///
    alias  uint_fast8_t = unsigned_integer_type;
    ///
    alias  uint_fast16_t = unsigned_integer_type;
    ///
    alias  uint_fast32_t = unsigned_integer_type;
    ///
    alias  uint_fast64_t = unsigned_integer_type;
    /// optional 
    alias  uint_fastN_t = signed_integer_type;

    alias intmax_t = signed_integer_type;
    alias uintmax_t = unsigned_integer_type;
    
    /// optional
    alias intptr_t = signed_integer_type;
    /// ditto
    alias uintptr_t = unsigned_integer_type;
}
else
    public import stdc.cheader.stdint;

///
enum __STDC_VERSION_STDINT_H__ = 202311L;

///
enum PTRDIFF_WIDTH = ptrdiff_t.sizeof * 8;
///
enum SIZE_WIDTH = size_t.sizeof * 8;