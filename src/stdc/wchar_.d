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
module stdc.wchar_;

public import stdc.cheader.wchar_: mbstate_t, wint_t;
public import stdc.config: c_ulong, c_long;

public import stdc.stdio;
public import stdc.locale;
public import stdc.stdarg;
public import stdc.stddef;
public import stdc.stdint;
public import stdc.time;

version(none)
{
    import core.stdc.wchar_;
}
version(D_Ddoc)
{
    private struct va_list {}
}

extern(C):
nothrow:
@nogc:
@live:

///
int fwprintf(FILE* stream, scope const(wchar_t*) format, scope const ...);
///
int fwscanf(FILE* stream, scope const(wchar_t*) format, scope ...);
///
int swprintf(wchar_t* s, size_t n, scope const(wchar_t*) format, scope const ...);
///
int swscanf(scope const(wchar_t*) s, scope const(wchar_t*) format, scope ...);
///
int vfwprintf(FILE* stream, scope const(wchar_t*) format, va_list arg);
///
int vfwscanf(FILE* stream, scope const(wchar_t*) format, va_list arg);
///
int vswprintf(wchar_t* s, size_t n, scope const(wchar_t*) format, va_list arg);
///
int vswscanf(scope const(wchar_t*) s, scope const(wchar_t*) format, va_list arg);
///
int vwprintf(scope const(wchar_t*) format, va_list arg);
///
int vwscanf(scope const(wchar_t*) format, va_list arg);
///
int wprintf(scope const(wchar_t*) format, scope const ...);
///
int wscanf(scope const(wchar_t*) format, scope ...);
///
@trusted wint_t fgetwc(FILE* stream);
///
wchar_t* fgetws(wchar_t* s, int n, FILE* stream);
///
@trusted wint_t fputwc(wchar_t c, FILE* stream);
///
int fputws(scope const(wchar_t*) s, FILE* stream);
///
@trusted int fwide(FILE* stream, int mode);
///
wint_t getwc(FILE* stream);
///
@trusted wint_t getwchar();
///
wint_t putwc(wchar_t c, FILE* stream);

@trusted
{
    ///
    wint_t putwchar(wchar_t c);
    ///
    wint_t ungetwc(wint_t c, FILE* stream);
}
///
double wcstod(scope const(wchar_t*) nptr, wchar_t** endptr);
///
float wcstof(scope const(wchar_t*) nptr, wchar_t** endptr);
///
real wcstold(scope const(wchar_t*) nptr, wchar_t** endptr);
///
c_long wcstol(scope const(wchar_t*) nptr, wchar_t** endptr, int base);
///
long wcstoll(scope const(wchar_t*) nptr, wchar_t** endptr, int base);
///
c_ulong wcstoul(scope const(wchar_t*) nptr, wchar_t** endptr, int base);
///
ulong wcstoull(scope const(wchar_t*) nptr, wchar_t** endptr, int base);
///
pure
{
    wchar_t* wcscpy(return scope wchar_t* s1, scope const(wchar_t*) s2);
    ///
    wchar_t* wcsncpy(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    size_t wcslcpy(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    wchar_t* wcpcpy(return scope wchar_t* s1, scope const(wchar_t*) s2);
    ///
    wchar_t* wcpncpy(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    wchar_t* wmemcpy(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    wchar_t* wmemmove(return scope  wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    wchar_t* wcscat(return scope wchar_t* s1, scope const(wchar_t*) s2);
    ///
    wchar_t* wcsncat(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    size_t wcslcat(return scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
    ///
    int wcscmp(scope const(wchar_t*) s1, scope const(wchar_t*) s2);
}
///
int wcscasecmp(scope const(wchar_t*) s1, scope const(wchar_t*) s2);
///
int wcscasecmp_l(scope const(wchar_t*) s1, scope const(wchar_t*) s2, locale_t);
///
int wcscoll(scope const(wchar_t*) s1, scope const(wchar_t*) s2);
///
int wcscoll_l(scope const(wchar_t*) s1, scope const(wchar_t*) s2, locale_t);

pure
{
    ///
    int wcswidth(scope const(wchar_t*) , size_t n);
    ///
    int wcsncmp(scope const(wchar_t*) s1, scope const(wchar_t*) s2, size_t n);
}
///
size_t wcsxfrm(scope wchar_t* s1, scope const(wchar_t*) s2, size_t n);
///
size_t wcsxfrm_l(scope wchar_t* s1, scope const(wchar_t*) s2, size_t n, locale_t);

pure
{

    ///
    int wmemcmp(scope const(wchar_t*) s1, scope const(wchar_t*) s2, size_t n);
    ///
    inout(wchar_t)* wcschr(return scope inout(wchar_t)*s, wchar_t c);
    ///
    inout(wchar_t)* wcspbrk(return scope inout(wchar_t)* s, wchar_t c);
    ///
    size_t wcscspn(scope const(wchar_t*) s1, scope const(wchar_t*) s2);
    ///
    inout(wchar_t)* wcspbrk(return scope inout(wchar_t)* s1, scope const(wchar_t*) s2);
    ///
    inout(wchar_t)* wcsrchr(return scope inout(wchar_t)* s, wchar_t c);
    ///
    size_t wcsspn(scope const(wchar_t*) s1, scope const(wchar_t*) s2);
    ///
    inout(wchar_t)* wcsstr(return scope inout(wchar_t)* s1, scope const(wchar_t*) s2);
}
///
wchar_t* wcstok(return scope wchar_t* s1, scope const(wchar_t*) s2, wchar_t** ptr);

pure
{
    ///
    inout(wchar_t)* wmemchr(return scope inout wchar_t* s, wchar_t c, size_t n);
    ///
    size_t wcslen(scope const(wchar_t*) s);
    ///
    size_t wcsnlen(scope const(wchar_t*) s, size_t n);
}
///
wchar_t* wcsdup(const(wchar_t*) s);
///
pure wchar_t* wmemset(return scope wchar_t* s, wchar_t c, size_t n);
///
FILE* open_wmemstream(wchar_t** bufp, size_t* sizep);
///
size_t wcsftime(wchar_t* s, size_t maxsize, scope const(wchar_t*) format, scope const(tm*) timeptr);

@trusted
{
    ///
    wint_t btowc(int c);
    ///
    int wctob(wint_t c);
}
///
int mbsinit(scope const(mbstate_t*) ps);
///
size_t mbrlen(scope const(char*) s, size_t n, mbstate_t* ps);
///
size_t mbrtowc(wchar_t* pwc, scope const(char*) s, size_t n, mbstate_t* ps);
///
size_t wcrtomb(char* s, wchar_t wc, mbstate_t* ps);
///
size_t mbsrtowcs(wchar_t* dst, scope const(char**) src, size_t len, mbstate_t* ps);
///
size_t mbsnrtowcs(wchar_t* dst, scope const(char**) src, size_t nwc, size_t len, mbstate_t* ps);
///
size_t wcsrtombs(char* dst, scope const(wchar_t**) src, size_t len, mbstate_t* ps);
///
size_t wcsnrtombs(char* dst, scope const(wchar_t**) src, size_t nwc, size_t len, mbstate_t* ps);
