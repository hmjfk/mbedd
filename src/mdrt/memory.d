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
@nogc dynamic memory allocate/free functions.

Copyright:  2025 - Denkousi
Copyright:  Copyright Digital Mars 2000 - 2011.
License:    $(HTTP www.gnu.org/licenses/gpl-3.0.html, GPL 3.0).
License:    Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:    Denkousi
Authors:    Walter Bright, Sean Kelly
Source:     druntime/src/rt/dmain2.d

ここでは、記憶域の確保と開放を行う低層な関数を定義している。
@nogc下でD固有の機能を使用した際、C言語のmalloc, free関数と同様に動的な記憶域を管理したい場合に便利である。
*/

module mdrt.memory;

import mebdd.stdc.stdlib: malloc, free, alloca;

@nogc:
nothrow:
extern(C):

/// new式のmdrt版
template New(T)
{

}

///
T[] dynAlloc(T:T[])(size_t alloc_size)
    => (cast(T*)malloc((T[]).sizeof*alloc_size))[0..alloc_size];

///
T[] dynCalloc(T:T[])(size_t alloc_size)
    => (cast(T*)malloc((T[]).sizeof*alloc_size))[0..alloc_size];

///
T[] dynRealloc(T:T[])(size_t alloc_size)
    => (cast(T*)malloc((T[]).sizeof*alloc_size))[0..alloc_size];


/// core.memoryの関数
/// pureMalloc, pureCalloc, pureFree

