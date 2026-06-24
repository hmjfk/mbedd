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
/**
Copyright: Copyright Digital Mars 2000 - 2011, Denkousi 2026 -
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE). Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   Walter Bright, Sean Kelly, Denkousi
*/
module mdrt.utility;
public import mdrt.coredefs;

@nogc:
nothrow:
@safe:
@live:

template imported(string moduleName)
{
    mixin("import imported = " ~ moduleName ~ ";");
}

// hashOf
// 本来のobject.hashOfと全く同じ関数
size_t hashOf(T)(auto ref T arg);
size_t hashOf(T)(auto ref T arg, size_t seed);

// toDArgs
// C言語形式のcommand line引数をD言語形式に変換する。
string[] toDArgs(int argc, char** argv);