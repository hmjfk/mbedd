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

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see (https://www.gnu.org/licenses/).
*/
module boost.core;

import std = stdcpp.type_traits;
import std = stdcpp.memory;


extern(C++, "boost")
{
    /// addressof
    T* addressof(T)(ref T x);
    
    /// alignof
    template BOOST_CORE_ALIGNOF(T)
    {
        enum  BOOST_CORE_ALIGNOF = T.alignof;
    }
    /// allocator_access
    ///
    template allocator_value_type(A)
    {
        alias type = A.value_type;
    }
    ///
    alias allocator_value_type_t(A) = allocator_value_type!A.type;
    ///
    template allocator_pointer(A)
    {
        static if(is(A.pointer))
            alias type = A.pointer;
        else
            alias type = allocator_value_type_t!(A)*;
    }
    ///
    alias allocator_pointer_t(A) = allocator_pointer!A.type;

    template allocator_const_pointer(A)
    {
        static if(is(A.const_pointer))
            alias type = A.const_pointer;
        else
            alias type = std.pointer_traits!(allocator_pointer_t!A).rebind!(const allocator_value_type_t!A);
    }
    ///
    alias allocator_const_pointer_t(A) = allocator_const_pointer!A.type;
    ///
    template allocator_void_pointer(A)
    {
        static if(is(A.void_pointer))
            alias type = A.void_pointer;
        else
            alias type = std.pointer_traits!(allocator_pointer_t!A).rebind!void;
    }
    ///
    alias allocator_void_pointer_t(A) = allocator_void_pointer!A.type;
    ///
    template allocator_const_void_pointer(A)
    {
        static if(is(A.const_void_pointer))
            alias type = A.const_void_pointer;
        else
            alias type = std.pointer_traits!(allocator_pointer_t!A).rebind!(const void);
    }
    ///
    alias allocator_const_void_pointer_t(A) = allocator_const_void_pointer!A.type;
    ///
    template allocator_difference_type(A)
    {
        static if(is(A.difference_type))
            alias type = A.difference_type;
        else
            alias type = std.pointer_traits!(allocator_pointer_t!A).difference_type;
    }
    ///
    alias allocator_difference_type_t(A) = allocator_difference_type!A.type;
    ///
    template allocator_size_type(A)
    {
        static if(is(A.size_type))
            alias type = A.size_type;
        else
            alias type = std.make_unsigned_t!(allocator_difference_type_t!A);
    }
    ///
    alias allocator_size_type_t(A) = allocator_size_type!A.type;
    ///
    template allocator_propagate_on_container_copy_assignment(A)
    {
        static if(is(A.propagate_on_container_copy_assignment))
            alias type = A.propagate_on_container_copy_assignment;
        else
            alias type = std.false_type;
    }
    alias allocator_propagate_on_container_copy_assignment_t(A)
        = allocator_propagate_on_container_copy_assignment!A.type;

    ///
    template allocator_propagate_on_container_move_assignment(A)
    {
        static if(is(A.propagate_on_container_move_assignment))
            alias type = A.propagate_on_container_move_assignment;
        else
            alias type = std.false_type;
    }
    ///
    alias allocator_propagate_on_container_move_assignment_t(A)
        = allocator_propagate_on_container_move_assignment!A.type;
    ///
    template allocator_propagate_on_container_swap(A)
    {
        static if(is(A.propagate_on_container_swap))
            alias type = A.propagate_on_container_swap;
        else
            alias type = std.false_type;
    }
    ///
    alias allocator_propagate_on_container_swap_t(A)
        = allocator_propagate_on_container_swap!A.type;
    ///
    template allocator_is_always_equal(A)
    {
        static if(is(A.is_always_equal))
            alias type = A.is_always_equal;
        else
            alias type = std.is_empty!A.type;
    }
    ///
    alias allocator_is_always_equal_t(A) = allocator_is_always_equal!A.type;
  
    version(none)
    {
    ///
    template allocator_rebind(A, T)
    {
        static if(is(A.rebind!T.other))
            alias type = A.rebind!T.other;
        else
            alias type = a; // TODO: この部分の実装がどうなっているか調べる。
    }
    ///
    alias allocator_is_always_equal_t(A) = allocator_rebind!A.type;
    }

}
