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
/++
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Source:    mbedd/stdc/cpio.d
Standards: IEEE Std 1003.1™-2024(POSIX.1-2024)

POSIX規格では、定数値を八進数で表記すると規定されている。しかし、D2.112.0時点では八進接頭辞が存在しないため、この説明においてはC2y規格で採用された記法を用いている。
+/
//  なお、source中では十六進数で表記している。
module src.stdc.tar;

///
enum TMAGIC = "ustar";
///
enum TMAGLEN = 6;
///
enum TVERSION = "00";
///
enum TVERSLEN = 2;

enum
{
    ///
    REGTYPE = '0',
    ///
    AREGTYPE = '\0',
    ///
    LNKTYPE = '1',
    ///
    SYMTYPE = '2',
    ///
    CHRTYPE = '3',
    ///
    BLKTYPE = '4',
    ///
    DIRTYPE = '5',
    ///
    FIFOTYPE = '6',
    ///
    CONTTYPE = '7',
}

enum
{
    /// 0o4000
    TSUID = 0x800,
    /// 0o2000
    TSGID = 0x400,
    /// XSI Extension 0o1000
    TSVTX = 0x200,
    /// 0o400
    TUREAD = 0x100,
    /// 0o200
    TUWRITE = 0x80,
    /// 0o100
    TUEXEC = 0x40,
    /// 0o0040
    TGREAD = 0x20,
    /// 0o0020
    TGWRITE = 0x10,
    /// 0o0010
    TGEXEC = 0x8,
    /// 0o0004
    TOREAD = 0x4,
    /// 0o0002
    TOWRITE = 0x2,
    /// 0o0001
    TOEXEC = 0x1,
}