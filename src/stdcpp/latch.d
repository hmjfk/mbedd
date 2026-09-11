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
module stdcpp.latch;
import stdcpp.cstddef: ptrdiff_t;
import stdcpp.config: importStdlib;

mixin importStdlib;

extern(C++, "std")
struct latch
{
public:
    ///
    static ptrdiff_t max() nothrow;

    ///
    this(ptrdiff_t expected);
    ///
    ~this();

    ///
    this(const ref  latch) @disable;
    ///
    ref  latch opAssign(const ref  latch) @disable;

    ///
    void count_down(ptrdiff_t update = 1);
    ///
    bool try_wait() const nothrow;
    ///
    void wait() const;
    ///
    void arrive_and_wait(ptrdiff_t update = 1);

    
    version(D_Ddoc) {} else
    mixin detail.latch;

private:
    version(D_Ddoc)
    ptrdiff_t counter;  /// exposition only
};