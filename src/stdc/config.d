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
module stdc.config;
public import mdrt.coredefs: string;

/**
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Source:    mbedd/stdc/config.d
Standards: ISO/IEC 9899:2024
*/

// Darwin系列のOSかどうか調べるversion識別子は、Appleを使用する。

///
enum nullptr = null;

/// stdc predefined macros
enum
{
    ///
    __STDC__ = 1,
    ///
    __STDC_UTF_16__ = 1,
    ///
    __STDC_UTF_32__ = 1,
    ///
    __STDC_EMBED_NOT_FOUND__ = 0,
    ///
    __STDC_EMBED_FOUND__ = 1,
    ///
    __STDC_EMBED_EMPTY__ = 2,
}
///
enum  __STDC_VERSION__ = 202411L;
///
enum _POSIX_C_SOURCE = 202405L;
///
enum _XOPEN_SOURCE = 800;

/*
TODO: 以前は独立環境であるかどうか調べるのにstatic if(__traits(compiles, Hosting))を使っていたが、
今後は、__STDC_HOSTED__に置き換える。
*/
version(D_Ddoc)
{
    ///
    enum __STDC_HOSTED__;
}
else version(FreeStanding)
{
    enum __STDC_HOSTED__ = 0;
}
else
{
    enum __STDC_HOSTED__ = 1;
}