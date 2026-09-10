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
Standards:  IEEE Std 1003.1™-2024(POSIX.1-2024)
Source:     stdc/search.d

意外と知られていないが、POSIXには算法を扱う関数群があることに注目すべきである。そのうち、ここではhash検索、二分木、二重連結構造が実装されている。

POSIX XSIに準拠している実装で使用できる。
*/
module stdc.search;

public import stdc.sys.types: size_t;

extern (C):
nothrow:
@nogc:
@live:

version(D_Ddoc)
///
struct ENTRY
{
    ///
    char* key;
    ///
    void* data;
}
else public import stdc.cheader.search;

///
alias posix_tnode = void;

///
enum ACTION
{
    ///
    FIND,
    ///
    ENTER
};

///
enum VISIT
{
    ///
    preorder,
    ///
    postorder,
    ///
    endorder,
    ///
    leaf
};

/// hash search table
int hcreate(size_t nel);
///
void hdestroy();
///
ENTRY* hsearch(ENTRY item, ACTION action);

/// doubly-linked lists
void insque(return scope void* element, return scope void* pred);
///
void remque(return scope void* element);

/// binary search tree
void* lfind(const(void*) key, const(void*) base, size_t* nelp, size_t width, int function(const(void*), const(void*)) compar);
///
void* lsearch(const(void*) key, void* base, size_t* nelp, size_t width, int function(const(void*), const(void*)) compar);
///
void* tdelete(const(void*) key, posix_tnode** rootp, int function(const(void*), const(void*)) compar);
///
posix_tnode* tfind(const(void*) key, const(posix_tnode*)* rootp, int function(const(void*), const(void*)) compar);
///
posix_tnode* tsearch(const(void*), posix_tnode**, int function(const(void*), const(void*)) compar);
///
void twalk(const(posix_tnode*) root, void function(const(posix_tnode*) , VISIT, int) action);