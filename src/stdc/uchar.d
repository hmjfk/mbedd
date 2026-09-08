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
module stdc.uchar_;
public import stdc.wchar_ : mbstate_t;

extern(C):
nothrow:
@nogc:
@live:

///
alias char8_t = char;
///
alias char16_t = wchar;
///
alias char32_t = dchar;

///
size_t mbrtoc8(char8_t* pc8, scope const(char*) s, size_t n, mbstate_t* ps);
///
size_t c8rtomb(char* s, char8_t c8, mbstate_t* ps);
///
size_t mbrtoc16(char16_t* pc16, scope const(char*) s, size_t n, mbstate_t* ps);
///
size_t c16rtomb(char* s, char16_t c16, mbstate_t* ps);
///
size_t mbrtoc32(char8_t* pc32, scope const(char*) s, size_t n, mbstate_t* ps);
///
size_t c32rtomb(char* s, char32_t c32, mbstate_t* ps);