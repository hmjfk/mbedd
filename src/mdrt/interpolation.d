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
IES compiler
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is 
Authors:    Denkousi
Source:     

部品集によるIES表現子の実装。
総称型を使用して実装されているため、言語処理系の実装と同様、編纂時にIESの中身を取り出すことが可能である。
*/
module mdrt.interpolation;
public import mdrt.coredefs;

// work only
version(none)
{
    import core.interpolation;
}

///
struct InterpolationHeader
{
    ///
    alias toString = () => "";
}

///
struct InterpolationFooter
{
    ///
    alias toString = () => "";
}
///
struct InterpolatedLiteral(string text)
{
    ///
    static string toString() @nogc pure nothrow @safe 
    {
        return text;
    }
}

///
struct InterpolatedExpression(string text)
{
    ///
    enum expression = text;
    ///
    alias toString = () => "";
}

/// IESの字句解析器
template IESLiteral(string ies)
{
    private
    {
        alias Aliase(T...) = T;
        template lexser(string text)
        {
        }
    }
    alias IESLiteral = Aliase!(InterpolationHeader, InterpolationFooter);
}

unittest
{   
    // 簡易版 std.typecons.Tuple
    struct Tuple(T...) { T value; }
    Tuple!T tuple(T...)(T value) { return Tuple!T(value); }

    auto  items = IESLiteral!"Hello, $(name), how are you?";
    assert(items == tuple(
    InterpolationHeader(),                       // IESの開始を示す
    InterpolatedLiteral!("Hello, ")(),           // 文字列表現子の値
    InterpolatedExpression!("name")(),           // 式表現の値
    name,                                        // 直接渡された式
    InterpolatedLiteral!(", how are you?")(),    // 文字列表現子の値
    InterpolationFooter()));                     // IESの終了を示す
}