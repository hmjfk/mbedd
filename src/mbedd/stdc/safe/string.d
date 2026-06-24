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

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
/**
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+). Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   Denkousi
Source: https://dlang.org/spec/function.html#safe-interfaces

ここで実装されるmem系関数は、C標準とは異なり配列の要素型や文字cをubyte(unsigned char)へ変換しない。必要な場合は、利用者の責任で明示的に型変換すること。
*/

module mbedd.stdc.safe.string;

version(withDruntime){} else
{
    import mbedd.stdc.stddef: size_t;
    import mdrt.coredefs;
}
@nogc:
nothrow:
extern(D):

/// 
ref T[N1] memcpy(T, size_t N1, size_t N2)(ref T[N1] s1, ref const T[N2] s2, size_t n) pure @safe

{
    assert(N1 >= n);

    foreach(size_t i; 0 .. n)
        s1[i] = s2[i];
    
    return s1[];
}

unittest
{
    int[4] a = [1,2,3,4];
    int[4] b = [5,6,7,8];

    b = memcpy(b, a, 4);
    
    for(size_t i; i< b.length; i++)
        printf("%d,", b[i]);
}


/// 規格上戻り値がnullptrとなる場合、戻り値型の初期値を返す。
ref T[N1] memccpy(T, size_t N1, size_t N2)(ref T[N1] s1, ref const T[N2] s2, T c, size_t n) pure @safe
{
    assert(N1 >= n);

    foreach(size_t i; 0 .. n)
    {
        s1[i] = s2[i];
        if(s2[i] == c)
            return s1[];
    }

    foreach(ref T arr; s1)
        arr = T.init;
    return s1[];
}

unittest
{
    int[4] a = [1,2,3,4];
    int[4] b = [5,6,7,8];

    b = memccpy(a, b, 2, 2);
    
    for(size_t i; i< b.length; i++)
        printf("%d,", b[i]);
}
version(none)
{
///
ref T[N1] memmove(T, size_t N1, size_t N2)(ref T[N1] s1, ref const T[N2] s2, size_t n) pure @safe;

unittest
{
    int[6] a = [1,2,3,4,5,6];
    int[6] b = [7,8,3,4,9,10];
    b = memmove(b, a, 4);
    
    for(size_t i; i< b.length; i++)
        printf("%d,", b[i]);
}
}
///
string strdup(string s)
{
    import mdrt.memory: dynAlloc;

    auto dup = dynAlloc!(char[])(s.length);

    foreach(size_t i; 0 .. s.length)
        dup[i] = s[i];

    return cast(string)dup[];
}
///
string strndup(string s, size_t n)
{
    import mdrt.memory: dynAlloc;

    assert(s.length >= n);
    auto dup = dynAlloc!char[](n);

    foreach(size_t i; 0 .. n)
        dup[i] = s[i];

    return cast(string)dup[];
}
///
ref T[N] memset(T, size_t N)(ref T[N] s, T c, size_t n) pure @safe
{
    assert(N >= n);
    foreach(size_t i; 0 .. n)
        s[i] = c;
    return s[];
}

///
ref T[N] memset_explicit(T, size_t N)(ref T[N] s, T c, size_t n) @safe
if(__traits(isUnsigned, T))
{
    import core.volatile;

    assert(N >= n);
    foreach(size_t i; 0 .. n)
        volatileStore(&s[i], c);
    return s[];
}
///
size_t strlen(const string s) pure @safe => s.length;
///
size_t strnlen(const string s, size_t n) pure @safe => s.length;