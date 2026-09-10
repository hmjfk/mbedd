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
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     
*/

module stdc.regex;
public import stdc.cheader.regex;
public import stdc.sys.types: size_t;

extern(C):
nothrow:
@nogc:
@live:

version(D_Ddoc)
{   
    private enum unspecified = 0;
    private enum see_description;
    
    ///
    alias regoff_t = see_description; 
    ///
    struct regex_t
    {
        ///
        size_t    re_nsub;
    }

    ///
    struct regmatch_t
    {
        ///
        regoff_t    rm_so;
        ///
        regoff_t    rm_eo;
    }

    enum
    {
        ///
        REG_EXTENDED = unspecified,
        ///
        REG_ICASE = unspecified,
        ///
        REG_MINIMAL = unspecified,
        ///
        REG_NOSUB = unspecified,
        ///
        REG_NEWLINE = unspecified,
        ///
        REG_NOTBOL = unspecified,
        ///
        REG_NOTEOL = unspecified,
        ///
        REG_NOMATCH = unspecified,
        ///
        REG_BADPAT = unspecified,
        ///
        REG_ECOLLATE = unspecified,
        ///
        REG_ECTYPE = unspecified,
        ///
        REG_EESCAPE = unspecified,
        ///
        REG_ESUBREG = unspecified,
        ///
        REG_EBRACK = unspecified,
        ///
        REG_EPAREN = unspecified,
        ///
        REG_EBRACE = unspecified,
        ///
        REG_BADBR = unspecified,
        ///
        REG_ERANGE = unspecified,
        ///
        REG_ESPACE = unspecified,
        ///
        REG_BADRPT = unspecified,
    }
}

///
int regcomp(regex_t* preg, scope const(char*) pattern, int cflags);
///
size_t regerror(int errcode, const(regex_t*) preg, char* errbuf, size_t errbuf_size);
///
int regexec(const(regex_t*) preg, scope const(char*) string, size_t nmatch, regmatch_t pmatch, int eflags);
///
void regfree(regex_t* preg);