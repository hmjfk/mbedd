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
Source:     stdcpp/compare.d
*/

module stdcpp.compare;
import stdcpp.config:importStdlib;

mixin importStdlib;

@live
@nogc
extern(C++, "std")
{
    /// [cmp.categories], comparison category types
    enum ord { equal = 0, equivalent = equal, less = -1, greater = 1 };
    ///
    enum ncmp { unordered = -127 };

    ///
    struct partial_ordering
    {
    private:
        /// exposition only
        int value;
        bool is_ordered;
        
        /// exposition-only constructors
        this(ord v) nothrow
        {
            value = int(v);
            is_ordered = true;
        }
        ///
        this(ncmp v) nothrow
        {
            value = int(v);
            is_ordered = false;
        }

    public:
        /// valid values
        __gshared static const partial_ordering less = partial_ordering(ord.less);
        ///
        __gshared static const partial_ordering equivalent = partial_ordering(ord.equivalent);
        ///
        __gshared static const partial_ordering greater = partial_ordering(ord.greater);
        ///
        __gshared static const partial_ordering unordered = partial_ordering(ncmp.unordered);

        /// comparisons
        bool opCmp(partial_ordering v);
        ///
        bool opEquals(partial_ordering v);

    }
    ///
    struct weak_ordering
    {
    private:
        int value; /// exposition only

        /// exposition-only constructors
        this(ord v)
        { value = cast(int)v; }

    public:
        /// valid values
        __gshared static const weak_ordering less = weak_ordering(ord.less);
        ///
        __gshared static const weak_ordering equivalent = weak_ordering(ord.equivalent);
        ///
        __gshared static const weak_ordering greater = weak_ordering(ord.greater);
        
        /// conversions
        T opCast(T:partial_ordering)();
        
        /// comparisons
        bool opCmp(partial_ordering v);
        ///
        bool opEquals(partial_ordering v);
    }
    struct strong_ordering
    {
    private:
        int value;  /// exposition only
    
        /// exposition-only constructors
        this(ord v)
        { value = cast(int)v; }
    
    public:
        /// valid values
        __gshared static const strong_ordering less;
        ///
        __gshared static const strong_ordering equal;
        ///
        __gshared static const strong_ordering equivalent;
        ///
        __gshared static const strong_ordering greater;
        
        /// conversions
        T opCast(T:partial_ordering)();
        ///
        T opCast(T:weak_ordering)();
        
        /// comparisons
        bool opCmp(strong_ordering v);
        ///
        bool opEquals(strong_ordering v);
    }


    ///  named comparison functions
    bool is_eq  (partial_ordering cmp) nothrow;
    ///
    bool is_neq (partial_ordering cmp) nothrow;
    ///
    bool is_lt  (partial_ordering cmp) nothrow;
    ///
    bool is_lteq(partial_ordering cmp) nothrow;
    ///
    bool is_gt  (partial_ordering cmp) nothrow;
    ///
    bool is_gteq(partial_ordering cmp) nothrow;
    
    /// [cmp.common], common comparison category type
    template common_comparison_category(Ts...)
    {
        static foreach (i; Ts)
        {
            static if (is(Ts == partial_ordering) || is(Ts == weak_ordering) || 
                       is(Ts == strong_ordering))
            {
                alias type = void;
            }
            else
            {
                alias type = strong_ordering;
            }

        }
    }
    ///
    alias common_comparison_category_t(Ts...) = common_comparison_category!Ts.type;
    
    // [cmp.concept], concept three_way_comparable
    template three_way_comparable(T, Cat = partial_ordering)
    {
    }
    ///
    template three_way_comparable_with(T, U,  Cat = partial_ordering)
    {
    }
    /// [cmp.result], result of three-way comparison
    /* 
    **規格からの変更点**
    現在、D言語から<=>演算子の型を導出する方法が存在しないため、何も定義されない。
    */
    template compare_three_way_result(T, U = T)
    {
    }

    /// この型別名を具現化しようとすると、常に失敗することに注意を要する。
    alias compare_three_way_result_t(T, U = T) =  compare_three_way_result!(T, U).type;

    /// [comparisons.three.way], class compare_three_way 
    version(D_Ddoc)
    struct compare_three_way(T, Cat = partial_ordering)
    {
        private enum unspecified;
        ///
        auto opCall(ref T t, ref U u) const => T();
        ///
        alias is_transparent = unspecified;
    }
    version(D_Ddoc)
    {
        mixin template strong_order(){}
        mixin template weak_order(){}
        mixin template partial_order(){}
        mixin template compare_strong_order_fallback(){}
        mixin template compare_weak_order_fallback(){}
        mixin template compare_partial_order_fallback(){}
    }

    /// [cmp.alg], comparison algorithms
    mixin strong_order;
    ///
    mixin weak_order;
    ///
    mixin partial_order;
    ///
    mixin compare_strong_order_fallback;
    ///
    mixin compare_weak_order_fallback;
    ///
    mixin compare_partial_order_fallback;

    /// [compare.type], type ordering
    struct type_order(T, U)
    {
        version(D_Ddoc)
            enum TYPE_ORDER(T, U) = T();
        
        ///
        static enum strong_ordering value = TYPE_ORDER!(T, U);
        ///
        alias value_type = strong_ordering;

        ///
        T opCast(T:value_type)() => value;
        ///
        value_type opCall() => value;
    }
    ///
    enum type_order_v(T, U) = type_order!(T, U).value; 
}