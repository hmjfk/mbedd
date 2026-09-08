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
module stdcpp.cstdlib;

static import stdc.tgmath;
public import stdc.stdlib;

/// This header is overload set.
///
alias abs = stdc.stdlib.abs;
///
alias abs = stdc.stdlib.labs;
///
alias abs = stdc.stdlib.llabs;
///
alias abs = stdc.tgmath.fabs;

/// for C2y (mbedd extension)
///
alias abs = stdc.stdlib.uabs;
///
alias abs = stdc.stdlib.ulabs;
///
alias abs = stdc.stdlib.ullabs;

alias div = stdc.stdlib.div;
///
alias div = stdc.stdlib.ldiv;
///
alias div = stdc.stdlib.lldiv;