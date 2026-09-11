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
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
Authors:    Denkousi
Standards:  ISO/IEC 14882:2026 (C++26)
Source:     stdcpp/barrier.d
*/

module stdcpp.barrier;
import stdcpp.cstddef: ptrdiff_t;
import stdcpp.config: importStdlibR;

mixin importStdlibR;

///
extern(C++, "std")
struct barrier(CompletionFunction)
{
public:
    version(D_Ddoc)
    {
        private alias see_below = void;
        ///
        alias arrival_token = see_below;
    }
    ///
    static ptrdiff_t max() nothrow;

    version(D_Ddoc)
    ///
    this(ptrdiff_t expected, CompletionFunction f = CompletionFunction());

    ///
    ~this();

    ///
    this(const ref barrier) @disable;
    
    ///
    ref barrier opAssign(const ref barrier) @disable;

    ///
    arrival_token arrive(ptrdiff_t update = 1);

    // void wait(arrival_token&& arrival) const;

    ///
    void arrive_and_wait();
    ///
    void arrive_and_drop();

    version(D_Ddoc) {} else
    mixin detail.barrier;

private:
    version(D_Ddoc)
    CompletionFunction completion;      /// exposition only

};