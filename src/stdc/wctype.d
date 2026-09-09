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
module stdc.wctype;

public import stdc.cheader.wctype: wctrans_t, wctype_t;
public import stdc.locale: locale_t;

public import stdc.ctype;
public import stdc.stdarg;
public import stdc.stddef;
public import stdc.stdio;
public import stdc.stdlib;
public import stdc.string;
public import stdc.time;
public import stdc.wchar_;

extern (C):
@trusted:
nothrow:
@nogc:

version(none)
import core.stdc.wctype;

pure int iswalnum(wint_t);
///
int iswalnum_l(wint_t, locale_t);
///
pure int iswalpha(wint_t);
///
int iswalpha_l(wint_t, locale_t);
///
pure int iswblank(wint_t);
///
int iswblank_l(wint_t, locale_t);
///
pure int iswcntrl(wint_t);
///
int iswcntrl_l(wint_t, locale_t);
///
pure int iswctype(wint_t, wctype_t);
///
int iswctype_l(wint_t, wctype_t, locale_t);
///
pure int iswdigit(wint_t);
///
int iswdigit_l(wint_t, locale_t);
///
pure int iswgraph(wint_t);
///
int iswgraph_l(wint_t, locale_t);
///
pure int iswlower(wint_t);
///
int iswlower_l(wint_t, locale_t);
///
pure int iswprint(wint_t);
///
int iswprint_l(wint_t, locale_t);
///
pure int iswpunct(wint_t);
///
int iswpunct_l(wint_t, locale_t);
///
pure int iswspace(wint_t);
///
int iswspace_l(wint_t, locale_t);
///
pure int iswupper(wint_t);
///
int iswupper_l(wint_t, locale_t);
///
pure int iswxdigit(wint_t);
///
int iswxdigit_l(wint_t, locale_t);
///
wint_t towctrans(wint_t, wctrans_t);
///
wint_t towctrans_l(wint_t, wctrans_t, locale_t);
///
pure wint_t towlower(wint_t);
///
wint_t towlower_l(wint_t, locale_t);
///
pure wint_t towupper(wint_t);
///
wint_t towupper_l(wint_t, locale_t);

@system
{
    ///
    wctrans_t wctrans(const(char*));
    ///
    wctrans_t wctrans_l(const(char*), locale_t);
    ///
    wctype_t  wctype(const(char*));
    ///
    wctype_t  wctype_l(const(char*), locale_t);
}