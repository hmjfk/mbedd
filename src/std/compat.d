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


// C++ portabilty module
module src.std.compat;

public import stdcpp;

public import stdc.assert_;
public import stdc.ctype;
public import stdc.errno;
public import stdc.fenv;
public import stdc.float_;
public import stdc.inttypes;
public import stdc.limits;
public import stdc.locale;
public import stdc.math;
public import stdc.signal;
public import stdc.stdarg;
public import stdc.stddef;
public import stdc.stdint;
public import stdc.stdio;
public import stdc.stdlib;
public import stdc.string;
public import stdc.time;
public import stdc.uchar;
public import stdc.wchar_;
public import stdc.wctype;