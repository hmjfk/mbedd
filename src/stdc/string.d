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
module stdc.string;

public import stdc.stddef: NULL, size_t;
public import stdc.locale: locale_t;


version(none)
{
    import core.stdc.string;
    import core.sys.posix.string;
}

extern(C):
nothrow:
@nogc:
@live:

pure
{
    ///
    void* memcpy(return scope void* s1, scope const(void*) s2, size_t n);
    ///
    void* memccpy(return scope void* s1, scope const(void*) s2, int c, size_t n);
    ///
    void* memmove(return scope void* s1, return scope  const(void*) s2, size_t n);
    ///
    void* memmem(scope const(void*) haystack, size_t haystacklen, scope const(void*) needle, size_t needlelen);

    ///
    char* strcpy(return scope char* s1, scope const(char*) s2);
    ///
    char* strncpy(return scope char* s1, scope const(char*) s2, size_t n);
}
///
char* strdup(scope const(char*) s);
///
char* strndup(scope const(char*) s, size_t n);
pure
{
    ///
    char* strcat(return scope char* s1, scope const(char*) s2);
    ///
    char* strncat(return scope char* s1, scope const(char*) s2, size_t n);
    ///
    size_t strlcat(return scope char* s1, scope const(char*) s2, size_t n);
    ///
    char* stpcpy(return scope char* s1, scope const(char*) s2);
    ///
    char* stpncpy(return scope char* s1, scope const(char*) s2, size_t n);
    ///
    size_t strlcpy(return scope char* s1, scope const(char*) s2, size_t n);

    ///
    int memcmp(scope const(void*) s1, scope const(void*) s2, size_t n);
    ///
    int strcmp(scope const(char*) s1, scope  const(char*) s2);
}
///
int strcoll(scope const(char*) s1, scope const(char*) s2);
///
int strcoll_l(scope const(char*) s1, scope const(char*) s2, locale_t locale);
///
pure int strncmp(scope const(char*) s1, scope  const(char*) s2, size_t n);
///
size_t strxfrm(scope char* s1, scope const(char*) s2, size_t n);
///
size_t strxfrm_l(scope char* s1, scope const(char*) s2, size_t n, locale_t locale);
pure
{
    ///
    inout(void)* memchr(return scope inout(void)* s, int c, size_t n);
    ///
    inout(char)* strchr(return scope inout(char)* s, int c);
    ///
    size_t strcspn(scope const(char*) s1, scope const(char*) s2);
    ///
    inout(char)* strpbrk(return scope inout(char)* s1, scope const(char*) s2);
    ///
    inout(char)* strrchr(return scope inout(char)* s, int c);
    ///
    size_t strspn(scope const(char*) s1, scope const(char*) s2);
    ///
    inout(char)* strstr(return scope inout(char)* s1, scope const(char*) s2);
}
///
char* strtok(return scope char* s1, scope const(char*) s2);
///
char* strtok_r(return scope char* s1, scope const(char*) s1, char** state);
pure
{
    ///
    void* memset(return scope void* s, int c, size_t n);
    ///
    void* memset_explicit(return scope void* s, int c, size_t n);
}
///
char* strerror(int errnum);
///
char* strerror_l(int errnum, locale_t locale);
///
int strerror_r(int errnum, return scope char* strerrbuf, size_t buflen);
///
char* strsignal(int signum);
pure
{
    ///
    size_t strlen(scope const(char*) s);
    ///
    size_t strnlen(scope const(char*) s, size_t n);
}