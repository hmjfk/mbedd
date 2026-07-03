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
module stdcpp.initializer_list;
import core.attribute: weak;

version(none)
extern (C++,"std")
{
    extern(C++, struct)
    struct initializer_list(E)
    {
    private:

        ///
        size_type length;
        ///
        iterator begin_element;

    public:

        ///
        alias value_type = E;
        ///
        alias reference = const E;
        ///
        alias const_reference = const E;
        ///
        alias size_type = size_t;
        ///
        alias iterator = const(E)*;
        ///
        alias const_iterator = const(E)*;
        ///
        this(iterator ThisBegin_element, size_type ThisLength) pure nothrow @weak
        {
            begin_element = ThisBegin_element;
            length = ThisLength;
        }
        ///
        size_type size() immutable nothrow
        {
            return length;
        }
        ///
        iterator begin() immutable nothrow
        {
            return begin_element;
        }
        ///
        iterator end() immutable nothrow
        {
            return begin() + size();
        }
        ///
        const(E)* data() const nothrow;
        ///
        bool empty() const nothrow => size() == 0;
    }


}

unittest
{
    int[5] a = [1, 2, 3, 4, 5];
    initializer_list!int v(a.ptr, a.length);
}