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
module mbedd.stdc.cpio;

// なお、source中では十六進数で表記している。
enum
{
    /// 0o000400
    C_IRUSR = 0x100,
    /// 0o000200
    C_IWUSR = 0x80,
    /// 0o000100
    C_IXUSR = 0x40,
    /// 0o000040
    C_IRGRP = 0x20,
    /// 0o000020
    C_IWGRP = 0x10,
    /// 0o000010
    C_IXGRP = 0x8,
    /// 0o000004
    C_IROTH = 0x4,
    /// 0o000002
    C_IWOTH = 0x2,
    /// 0o000001
    C_IXOTH = 0x1,
    /// 0o004000
    C_ISUID = 0x800,
    /// 0o002000
    C_ISGID = 0x400,
    /// 0o001000
    C_ISVTX = 0x200,
    /// 0o040000
    C_ISDIR = 0x4000,
    /// 0o010000
    C_ISFIFO = 0x1000,
    /// 0o100000
    C_ISREG = 0x8000,
    /// 0o060000
    C_ISBLK = 0x6000,
    /// 0o020000
    C_ISCHR = 0x2000,
    /// 0o110000
    C_ISCTG = 0x9000,
    /// 0o120000
    C_ISLNK = 0xA000,
    /// 0o140000
    C_ISSOCK = 0xC000,
}

///
enum MAGIC = "070707";