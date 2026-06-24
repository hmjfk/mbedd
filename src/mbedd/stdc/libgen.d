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

module src.mbedd.stdc.libgen;

extern(C):
@nogc:
@live:
nothrow:
__gshared:

version(Posix){} else
    pragma(msg, "Warning:  The current environment does not support Posix, which causes a link error. "~
                            "You need to build libc separately and link again.");

private
{
    version(CRuntime_Glibc)
    {
        enum symblname_dirname = "__xpg_basename";
    }
    else
    {
        enum symblname_dirname  = "dirname";
    }
}

///
inout(char)* basename(scope inout(char)* path) pure;
///
pragma(mangle, symblname_dirname)
inout(char)* dirname(scope inout(char)* path) pure;