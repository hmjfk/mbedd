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
module stdcpp.cstddef;

import core.attribute: weak;
public import stdc.stddef;
public import stdcpp.version_: __cpp_lib_byte;

/**
D言語では、C++の場合と違って文字型のcharと1B長整数型のbyteは基本型として
区別されていることから、std::byteは不要と判断し、実装しないことにした。
*/

///
IntType to_integer(IntType)(ubyte a) nothrow @weak
if(__traits(isIntegral ,IntType))
=> cast(IntType)a;

/// Examples: ubyte type used bit operation.
unittest
{
    import stdc.stdio;

    const ubyte c = 0b1111;

    auto a = c << 2;
    pragma(msg, to_integer!int(a));
}