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
C++の言語機能移植と内部用部品

References:
 Based on ideas in Table 3.1 from
 $(LINK2 http://amazon.com/exec/obidos/ASIN/0201704315/ref=ase_classicempire/102-2957199-2585768,
     Modern C++ Design),
  Andrei Alexandrescu (Addison-Wesley Professional, 2001)
Copyright: Copyright The D Language Foundation 2005 - 2015, Denkousi 2026-.
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE). Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:
    $(HTTP digitalmars.com, Walter Bright),
    $(HTTP klickverbot.at, David Nadlinger),
    Denkousi
Source:    Original is $(PHOBOSSRC std/meta.d).

実装しない機能
## dynamic_cast
RTTIを使うため。
## reflexpr演算子
ABIには影響しない上、Dが持っている既存の言語機能を使えば、C++のそれよりもはるかに高度な自己言及ができる。
*/
module stdcpp.support;

@nogc:
nothrow:

/// sizeof...演算子
size_t sizeof___(Args...)(Args arg) => arg.length;

/**
もともとは、std.traitsにあったもの。
 C++側の型制約
---
template <class T, T... I>は、
---
は、
---
 if(is(Repeat!(I.length, T) == I))
---
とすること。
*/
template Repeat(size_t n, items...)
{
    static if (n == 0)
    {
        alias Repeat = Aliases!();
    }
    else
    {
        alias Repeat = items;
        enum log2n =
        {
            uint result = 0;
            auto x = n;
            while (x >>= 1)
                ++result;
            return result;
        }();
        static foreach (i; 0 .. log2n)
        {
            Repeat = Aliases!(Repeat, Repeat);
        }
        Repeat = Aliases!(Repeat, Repeat!(n - (1u << log2n), items));
    }
}

///
alias Alias(alias a) = a;
///
alias Aliases(T...) = T;