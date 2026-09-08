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
module stdc.ctype;
public import stdc.locale: local_t;

version(none)
import core.stdc.ctype;

extern(C):
@trusted:
nothrow:
@nogc:

///
pure int isalnum(int);
///
int isalnum_l(int, locale_t);
///
pure int isalpha(int);
///
int isalpha_l(int, locale_t);
///
pure int isblank(int);
///
int isblank_l(int, locale_t);
///
pure int iscntrl(int);
///
int iscntrl_l(int, locale_t);
///
pure int isdigit(int);
///
int isdigit_l(int, locale_t);
///
pure int isgraph(int);
///
int isgraph_l(int, locale_t);
///
pure int islower(int);
///
int islower_l(int, locale_t);
///
pure int isprint(int);
///
int isprint_l(int, locale_t);
///
pure int ispunct(int);
///
int ispunct_l(int, locale_t);
///
pure int isspace(int);
///
int isspace_l(int, locale_t);
///
pure int isupper(int);
///
int isupper_l(int, locale_t);
///
pure int isxdigit(int);
///
int isxdigit_l(int, locale_t);
///
pure int tolower(int);
///
int tolower_l(int, locale_t);
///
pure int toupper(int);
///
int toupper_l(int, locale_t);