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
Copyright: 	Copyright The D Language Foundation 2005 - 2015
Copyright:  Microsoft Corporation.
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
License:    Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:    Denkousi
Authors: 	Manu Evans, $(HTTP digitalmars.com, Walter Bright), Tomasz Stachowiak (`isExpressions`), $(HTTP erdani.org, Andrei Alexandrescu),
            Shin Fujishiro, $(HTTP octarineparrot.com, Robert Clipsham), $(HTTP klickverbot.at, David Nadlinger), Kenji Hara, Shoichi Kato
Source:     Original is $(PHOBOSSRC std/meta.d) and $(PHOBOSSRC std/traits.d)

注意点として、D言語固有の型でこれらの総称型が具現化された場合、false_typeから派生することに注意すべきである。
さらに、C++規格では**volatile**や参照に関する一連の総称型をこのheaderで規定しているが、
D言語側からすると、これらは型の一部ではなく意味をなさないため実装されていない。互換性のために識別子だけが定義されている。
*/
module stdcpp.type_traits;

import stdc.uchar;
import stdcpp.cstddef : wchar_t, nullptr_t;
import std = stdcpp.utility;
import stdcpp.support;

version (none)
{
    // for Editer refarence.
    import core.stdcpp.type_traits;
}

/// all freestanding
extern (C++, "std")
{
    /// [meta.help], helper class
    extern(D)
    struct integral_constant(T, T v)
    {
    public:
        ///
        static enum T value = v;
        ///
        alias value_type = T;
        ///
        alias type =  integral_constant!(T, v);
        
        ///
        value_type opCast(value_type)() const nothrow
        {
            return this.value;
        }
        ///
        value_type opCall()() const nothrow
        {
            return this.value;
        }
    }
    ///
    alias bool_constant(bool B) = integral_constant!(bool, B);
    ///
    alias true_type = bool_constant!true;
    ///
    alias false_type = bool_constant!false;

    /// [meta.unary.cat], primary type categories
    ///
    struct is_void(T)
    {
        bool_constant!(is(T == void)) temp;

        alias temp this;
    }

    ///
    struct is_null_pointer(T)
    {
        bool_constant!(is(T == nullptr_t)) temp;

        alias temp this;
    }

    ///
    struct is_integral(T)
    {
        bool_constant!(__traits(isIntegral, T)) temp;

        alias temp this;
    }

    ///
    struct is_floating_point(T)
    {
        bool_constant!(__traits(isFloating, T)) temp;

        alias temp this;
    }

    ///
    struct is_array(T)
    {
        bool_constant!(is_bounded_array_v!T || is_unbounded_array!T) temp;

        alias temp this;
    }


    ///
    struct is_pointer(T)
    {
		static if(is(T U: U*))
            private enum res = true;
		else 
            private enum res = false;

        bool_constant!res temp;
        alias temp this;
    }

    /**
    # 規格からの変更点
    D言語における参照は型ではなく記憶域区間指定子になっているため、is_referenceの別名となっている。
    */
    alias is_lvalue_reference(alias T) = is_reference!T;

    /// ditto
    deprecated(
        "There is no rvalue reference type in D. Since D 2.111.0, it exists instead as an __rvalue expression.")
    alias is_rvalue_reference(alias T) = is_reference!T;


    /**
    # 規格からの変更点
    D言語では要素指示型が存在せず、通常の要素かのように読み書きできるため、常にfalse_typeから派生する。
    */
    deprecated("D does not have member pointer types.")
    struct is_member_object_pointer(T)
    {
        false_type temp;

        alias temp this;
    }

    /// ditto
    deprecated("D does not have member pointer types.")
    struct is_member_function_pointer(T)
    {

        false_type temp;

        alias temp this;
    }
    
    /**
    # 規格からの変更点
    D言語では、列挙型は有効範囲付き列挙型に等しいため、is_scoped_enumの別名となっている。
    */
    alias is_enum(T) = is_scoped_enum!T;

    ///
    struct is_scoped_enum(T)
    {
        bool_constant!(is(T == enum)) temp;

        alias temp this;
    }


    ///
    struct is_union(T)
    {
        bool_constant!(is(T == union)) temp;

        alias temp this;
    }

    /// 注意点として、ここでいうclass型は、D言語の構造体を指す。
    struct is_class(T)
    {
        bool_constant!(is(T == struct)) temp;

        alias temp this;
    }

    ///
    struct is_function(T)
    {
        bool_constant!(is(T == function)) temp;

        alias temp this;
    }
    /**
    # 規格からの変更点
    `std​::​meta​::​info`はD言語側から不可視の型であるため、常にfalse_typeから派生する。
    */
    deprecated("D does not have C++ std​::​meta​::​info.")
    struct is_reflection(T)
    {
        false_type temp;
        alias temp this;
    }

    /// [meta.unary.comp], composite type categories
    /// since D2.111
    struct is_reference(alias T)
    {
        bool_constant!(__traits(isRef,T)) temp;

        alias temp this;
    }

    ///
    struct is_arithmetic(T)
    {
        bool_constant!(__traits(isArithmetic, T)) temp;

        alias temp this;
    }

    ///
    struct is_fundamental(T)
    {
        bool_constant!(
            is_void_v!T ||
                is_null_pointer_v!T ||
                is_floating_point_v!T ||
                is_arithmetic_v!T
        ) temp;
        alias temp this;
    }

    ///
    struct is_object(T)
    {
        bool_constant!(
            is_scalar_v!T ||
                is_array_v!T ||
                is_class_v!T
        ) temp;
        alias temp this;
    }

    ///
    ///
    struct is_scalar(T)
    {
        bool_constant!(__traits(isScalar, T)) temp;
        alias temp this;
    }

    ///
    struct is_compound(T)
    {
        bool_constant!(
            is_array_v!T ||
                is_function_v!T ||
                is_pointer_v!T ||
                is_reference_v!T ||
                is_class_v!T ||
                is_union_v!T ||
                is_enum_v!T ||
                is_member_pointer_v!T
        ) temp;
        alias temp this;
    }

    /**
    # 規格からの変更点
    D言語では要素指示型が存在せず、通常の要素かのように読み書きできるため、常にfalse_typeから派生する。
    */
    deprecated("D does not have member pointer types.")
    struct is_member_pointer(T)
    {
        false_type temp;
        alias temp this;
    }

    /// [meta.unary.prop], type properties
    ///
    struct is_const(T)
    {
        bool_constant!(is(T == const)) temp;
        alias temp this;
    }

    /**
    # 規格からの変更点
    D言語における発揮性操作は型修飾子ではなく言語の組込関数で表すため、常にfalse_typeから派生する。
    */
    deprecated("In D, volatile is a built-in function declared in core.volatile;"~
    "consequently, it always evaluates to false.")
    struct is_volatile(T)
    {
        false_type temp;
        alias temp this;

    }

    ///
    version(none)
    struct is_trivially_copyable(T)
    {
        private
        {
            static if(is_scalar_v!T)
                enum res = true;
        
            else static if(is(T == struct) ||  is(T == union))
            {
                // 資格特殊要素の定義
                // 条件式を見やすくするために、存在しない要素はtrueで表される。
                static if(__traits(hasMember, T, "opAssign"))
                {
                    enum assign  = __traits(isDisabled, __traits(getMember, T, "opAssign"));
                }
                else
                    enum assign = true;

                static if(__traits(hasCopyConstructor, T))
                {

                }
                else
                    enum cctor = true;

                static if(__traits(hasMoveConstructor, T))
                {}
                else enum mctor = true;
                

                enum res =  cctor && mctor && assign && dtor;
            }
            else
                enum res = false;
        }

        bool_constant!res temp;
        alias temp this;
    }

    ///
    version(none)
    struct is_standard_layout(T)
    {
        private
        {
            static if(is_scalar_v!T)
                enum res = true;
            else static if(is(T == struct) ||  is(T == union))
            {
                
            }
            else
                enum res = false;
        }

        bool_constant!res temp;
        alias temp this;
    }

    ///
    struct is_empty(T)
    {
        private
        {
            static if (is(T == struct))
                enum res = T.tupleof.length == 0;
            else
                enum res = false;
        }

        bool_constant!res temp;
        alias temp this;
    }
    ///
    struct is_polymorphic(T)
    {
        bool_constant!(
        {
            static foreach(typeof("") member; [__traits(derivedMembers, T)])
            {
                static if(__traits(isVirtualMethod, __traits(getMember, T, member)))
                {
                    return true;
                }
            }
            return false;
        }()
        ) temp;
        alias temp this;
    }

    ///
    struct is_abstract(T)
    {
        bool_constant!(__traits(isAbstractClass, T)) temp;
        alias temp this;
    }

    ///
    struct is_final(T)
    {
    /*
    型から__traits(getParameterStorageClasses)から予約語finalを検索するのが望ましいが、
    初期の実装では簡略化する。
    */
        bool_constant!(__traits(isFinalClass, T) || __traits(isFinalFunction, T)) temp;
        alias temp this;
    }
    ///
    deprecated
    struct is_pod(T)
    {
        bool_constant!(__traits(isPOD, T)) temp;
        alias temp this;
    }
    ///
    version(none)
    struct is_aggregate(T)
    {
        bool_constant!(__traits(hasCopyConstructor, T) && false ) temp;
        alias temp this;
    }

    ///
    struct is_signed(T)
    {
        bool_constant!(is_arithmetic_v!T && !__traits(isUnsigned, T) && is(T : real)) temp;
        alias temp this;
    }

    ///
    struct is_unsigned(T)
    {
        bool_constant!(is_arithmetic_v!T && __traits(isUnsigned, T)) temp;
        alias temp this;
    }

    ///
    struct is_bounded_array(T)
    {
        bool_constant!(__traits(isStaticArray, T)) temp;
        alias temp this;
    }
    /**
    # 規格からの変更点
    D言語では、要素数不明配列は指示型に等しいため、is_pointerの別名となっている。
    */
    ///
    alias is_unbounded_array(alias T) = is_pointer_v!T;
    
    ///
    struct is_constructible(T, Args...)
    {
        bool_constant!(__traits(compiles, (){ T a = T(Args); })) temp;
        alias temp this;
    }

    ///
    struct is_default_constructible(T)
    {
        bool_constant!(__traits(compiles, (){T a;})) temp;
        alias temp this;
    }

    ///
    struct is_copy_constructible(T)
    {
        bool_constant!(__traits(compiles, (){ T a = T(), b = T();  a = b;}) && __traits(isCopyable, T)) temp;
        alias temp this;
    }

    ///
    struct is_move_constructible(T)
    {
        bool_constant!(__traits(compiles, (){ T a = T(), b = T();  a = __rvalue(b);})) temp;
        alias temp this;
    }

    ///
    struct is_assignable(T, U)
    {
        bool_constant!(__traits(compiles, (){T a = U();})) temp;
        alias temp this;
    }

    ///
    struct is_copy_assignable(T)
    {
        bool_constant!(__traits(compiles, (){ T a; T b = a; })) temp;
        alias temp this;
    }

    ///
    struct is_move_assignable(T)
    {
        bool_constant!(__traits(compiles, (){ T a; T b = __rvalue(a); })) temp;
        alias temp this;
    }
version(none)
{
    ///
    struct is_swappable_with(T, U)
    {
        import stdcpp.concepts;

        bool_constant!(swappable_with!T) temp;
        alias temp this;
    }

    ///
    struct is_swappable(T)
    {
        import stdcpp.concepts;

        bool_constant!(swappable!T) temp;
        alias temp this;
    }
}

    ///
    struct is_destructible(T)
    {
        bool_constant!(__traits(compiles, remove_all_extents_t!T().__dtor)) temp;
        alias temp this;
    }

version(none)
{
    ///
    struct is_trivially_constructible(T, Args...)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_default_constructible(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_default_constructible(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_copy_constructible(T)
    {
        static if (is_object_v!T || (is_function_v!T && !is_reference_v!T) || is_reference_v!T)
        {
            bool_constant!(is_trivially_copy_constructible!(T, const T).value) temp;
        }
        else
        {
            false_type temp;
        }

        alias temp this;
    }

    ///
    struct is_trivially_move_constructible(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_assignable(T, U)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_copy_assignable(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_move_assignable(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_trivially_destructible(T)
    {
        bool_constant!() temp;
        alias temp this;
    }
}
    ///
    struct is_nothrow_constructible(T, Args...)
    {
        bool_constant!(__traits(compiles, ()nothrow{T a = T(Args);})) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_default_constructible(T)
    {
        bool_constant!(__traits(compiles, ()nothrow{T a;})) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_copy_constructible(T)
    {
        bool_constant!(__traits(compiles, ()nothrow{ T a = T(), b = T();  a = b;}) && __traits(isCopyable, T)) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_move_constructible(T)
    {
        bool_constant!(__traits(compiles, ()nothrow{ T a = T(), b = T();  a = __rvalue(b);})) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_assignable(T, U)
    {
        bool_constant!(__traits(compiles, ()nothrow{T a = U();})) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_copy_assignable(T)
    {
        bool_constant!(__traits(compiles, ()nothrow{ T a; T b = a; })) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_move_assignable(T)
    {
        bool_constant!(__traits(compiles, ()nothrow{ T a; T b = __rvalue(a); })) temp;
        alias temp this;
    }
version(none)
{
    ///
    struct is_nothrow_swappable_with(T, U)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_nothrow_swappable(T)
    {
        bool_constant!() temp;
        alias temp this;
    }
}
    ///
    struct is_nothrow_destructible(T)
    {
        bool_constant!(__traits(compiles, () nothrow{remove_all_extents_t!T().__dtor;})) temp;
        alias temp this;
    }

    ///
    version(none)
    struct is_implicit_lifetime(T)
    {
        bool_constant!() temp;
        alias temp this;
    }


    ///
    struct has_virtual_destructor(T)
    {
        bool_constant!(__traits(isAbstractFunction, __traits(getMember, T, "__dtor"))) temp;
        alias temp this;
    }

version(none)
{
    ///
    struct has_unique_object_representations(T)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct reference_constructs_from_temporary(T, U)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct reference_converts_from_temporary(T, U)
    {
        bool_constant!() temp;
        alias temp this;
    }
}

    /// [meta.unary.prop.query], type property queries
    ///
    struct alignment_of(T)
    {
        integral_constant!(size_t, T.alignof) temp;
        alias temp = this;
    }

    ///
    struct rank(T)
    {
        private
        {
            static if(is(T U : U[]))
                enum v = rank!U.v + 1;
            else
                enum v = 0;
        }
        integral_constant!(size_t, v) temp;

        alias temp this;
    }

    ///
    version(none)
    struct extent(T, uint I = 0)
    if (is_array_v!T)
    {
        /*
        extentの本体実装。
        Bug: 次元数が仕様とは逆順になってしまう。
        */
        private
        template countExtent(T, uint i, indexs...)
        {
            static if(I == 0)
                enum countExtent = indexs[I + 1]; // indexsの先頭要素は常に0が入るため、除外する。 
            else
            {
                debug pragma(msg, indexs);

                // 次元数取り出し
                static if(is(T U : U[N], size_t N))
                    enum index = N;
                else
                    enum index = 0;
                
                // 次元を次に進める。現在の次元を消去。
                static if (is(T Un : Un[]))
                                                               // indexとindexsを逆にすると、次元の並びが逆順になる。
                    alias countExtent = countExtent!(Un, i - 1, index, indexs); 
                
            }
        }

        integral_constant!(size_t, countExtent!(T, I)) temp;
        alias temp this;
    }

    /// [meta.rel], type relations
    ///
    struct is_same(T, U)
    {
        bool_constant!(__traits(isSame, T, U)) temp;
        alias temp this;
    }

    ///
    struct is_base_of(Base, Derived)
    {
        bool_constant!((is(Base == class) && is(Derived == class)) || is(Base == Derived) || is(Derived == super)) temp;
        alias temp this;
    }

    ///
    struct is_convertible(From, To)
    {
        bool_constant!(is(From:To)) temp;
        alias temp this;
    }

    ///
    struct is_nothrow_convertible(From, To)
    {
        bool_constant!(__traits(compiles, 
                                        (){
                                                To f(From a) nothrow
                                                {
                                                    static if((is(From == struct) || 
                                                               is(From == union) || 
                                                               is(From == class)) && 
                                                               is(To == bool))
                                                        return !a; // bool型変換演算子関数用。D言語の場合は、暗黙の型変換が許される変換演算子関数
                                                    else
                                                        return a;
                                                }
                                            }
                                        )) temp;
        alias temp this;
    }

version(none)
{
    ///
    struct is_layout_compatible(T, U)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_pointer_interconvertible_base_of(Base, Derived)
    {
        bool_constant!() temp;
        alias temp this;
    }

    ///
    struct is_invocable(Fn, ArgTypes...)
    {
        bool_constant!() temp;
        alias temp this;

    }

    ///
    struct is_invocable_r(Fn, ArgTypes...)
    {
        bool_constant!() temp;
        alias temp this;

    }

    ///
    struct is_nothrow_invocable(Fn, ArgTypes...)
    {
        bool_constant!() temp;
        alias temp this;

    }

    ///
    struct is_nothrow_invocable_r(R, Fn, ArgTypes...)
    {
        bool_constant!() temp;
        alias temp this;

    }
}
    /// [meta.trans.cv], const-volatile modifications
    ///
    struct remove_const(T)
    {
        static if (is(T : const U, U))
        {
            alias type = U;
        }
    }
    /**
    # 規格からの変更点
    D言語における発揮性操作は型修飾子ではなく言語の組込関数で表すため、常にTを返す。
    */
    ///
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; Therefore, it does nothing.")
    struct remove_volatile(T)
    {
        alias type = T;
    }

    /**
    # 規格からの変更点
    D言語における発揮性操作は型修飾子ではなく言語の組込関数で表すため、remove_constの別名となっている。
    */
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; as a result, it only ever removes const.")
    alias remove_cv(T) = remove_const!T; 

    ///
    template add_const(T)
    {
        static if(is(T == const(T)))
        {
            alias type = T;
        }
        else
        {
            alias type = const(T);
        }
    }

    /**
    # 規格からの変更点
    remove_volatileと同様な変更がある。
    */
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; Therefore, it does nothing.")
    template add_volatile(T)
    {
        alias type = T;
    }

    /**
    # 規格からの変更点
    remove_volatileと同様な変更がある。
    */
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; consequently, it only ever adds const.")
    alias add_cv(T) = add_const!T;

    ///
    alias remove_const_t(T) = remove_const!T.type;

    ///
    /**
    # 規格からの変更点
    remove_volatileと同様な変更がある。
    */
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; Therefore, it does nothing.")
    alias remove_volatile_t(T) = remove_volatile!T.type;

    /// ditto
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; as a result, it only ever removes const.")
    alias remove_cv_t(T) = remove_cv!T.type;

    /// 
    alias add_const_t(T) = add_const!T.type;

    /**
    # 規格からの変更点
    remove_volatileと同様な変更がある。
    */
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; Therefore, it does nothing.")
    alias add_volatile_t(T) = add_volatile!T.type;

    /// ditto
    deprecated(
        "In D, volatile is a built-in function declared in core.volatile; consequently, it only ever adds const.")
    alias add_cv_t(T) = add_cv!T.type;

    /// [meta.trans.ref], reference modifications
    deprecated(
        "In D, references are not type qualifiers but storage classes; therefore, they have no effect.")
    {
        /**
        # 規格からの変更点
        D言語における参照は型ではなく記憶域区間指定子になっているため、常にTを返す。
        */
        struct remove_reference(T)
        {
            alias type = T;
        }

        /// ditto
        struct add_lvalue_reference(T)
        {
            alias type = T;
        }

        /// ditto

        struct add_rvalue_reference(T)
        {
            alias type = T;
        }

        /// D言語における参照は型ではなく記憶域区間指定子になっているため、この別名は意味を持たない。
        alias remove_reference_t(T) = remove_reference!T.type;

        /// ditto
        alias add_lvalue_reference_t(T) = add_lvalue_reference!T.type;

        /// ditto
        alias add_rvalue_reference_t(T) = add_rvalue_reference!T.type;
    }
    /// sign modifications
    template make_signed(T) 
    if(is_integral_v!T && !is(T == bool))
    {
        static if (is_signed_v!T)
        {
            alias type = T;
        }
        else static if (is_unsigned_v!T)
        {
            static if (is_const_v!T)
            {
                static if (is(T == ubyte))
                    alias type = const byte;
                static if (is(T == ushort))
                    alias type = const short;
                static if (is(T == uint))
                    alias type = const int;
                static if (is(T == ulong))
                    alias type = const long;
                static if (is(ucent) && is(T == ucent))
                    alias type = const cent;
            }
            else
            {
                static if (is(T == ubyte))
                    alias type = byte;
                static if (is(T == ushort))
                    alias type = short;
                static if (is(T == uint))
                    alias type = int;
                static if (is(T == ulong))
                    alias type = long;
                static if (is(ucent) && is(T == ucent))
                    alias type = cent;
            }
        }
    }

    ///
    template make_unsigned(T)
    if(is_integral_v!T && !is(T == bool))
    {
        static if (is_unsigned_v!T)
        {
            alias type = T;
        }
        else static if (is_signed_v!T)
        {
            static if (is_const_v!T)
            {
                static if (is(T == byte))
                    alias type = const ubyte;
                static if (is(T == short))
                    alias type = const ushort;
                static if (is(T == int))
                    alias type = const uint;
                static if (is(T == long))
                    alias type = const ulong;
                static if (is(cent) && is(T == cent))
                    alias type = const ucent;
            }
            else
            {
                static if (is(T == byte))
                    alias type = ubyte;
                static if (is(T == short))
                    alias type = ushort;
                static if (is(T == int))
                    alias type = uint;
                static if (is(T == long))
                    alias type = ulong;
                static if (is(cent) && is(T == cent))
                    alias type = ucent;
            }
        }
    }

    ///
    alias make_signed_t(T) = make_signed!T.type;
    
    ///
    alias make_unsigned_t(T) = make_unsigned!T.type;

    ///
    template remove_extent(T)
    {
        static if(is(T : U[I], U, typeof(0.sizeof) I))
            alias type = U;
        else 
            alias type = T;
    }

    ///
    template remove_all_extents(T)
    {
        static if(is_array_v!T)
            alias type = remove_all_extents_t!(remove_extent_t!T);
        else alias type = T; 
    }

    ///
    alias remove_extent_t(T) = remove_extent!T.type;

    ///
    alias remove_all_extents_t(T) = remove_all_extents!T.type;

    /// [meta.trans.ptr], pointer modifications
    ///
    template remove_pointer(T)
    {
        static if (is(T : U*, U))
        {
            alias type = U;
        }
        else
        {
            alias type = T;
        }
    }
    ///
    template add_pointer(T)
    {
        alias type = T*;
    }

    ///
    alias remove_pointer_t(T) = remove_pointer!T.type;

    ///
    alias add_pointer_t(T) = add_pointer!T.type;

    /// 指示型が指している型を取り出す。mbedd拡張
    template pointerBaseType(T)
    {
        static if(is(T U == U*))
            alias pointerBaseType = pointerBaseType!U;
        else 
            alias pointerBaseType = T;
    }

    unittest
    {
        struct str;

        static assert(is(pointerBaseType!(void**) == void));
        static assert(is(pointerBaseType!(str**) == str));
    }

    /// [meta.trans.other], other transformations
    ///
    template type_identity(T)
    {
        alias type = T;
    }

    ///
    deprecated(
        "In D, references and volatile aren't part of the type system. Therefore, only const is ever removed.")
    template remove_cvref(T)
    {
        alias type = remove_const_t!T;
    }

    ///
    template decay(T)
    {
        private alias U = /* remove_reference!*/ T;

        static if (is_bounded_array_v!U || is_function_v!T)
        {
            alias type = U*;
        }
        else
        {
            alias type = remove_const_t!U;
        }
    }

    ///
    template enable_if(bool B, T = void)
    {
        static if (B)
        {
            alias type = T;
        }
    }

    ///
    template conditional(bool B, T, F)
    {
        static if (B)
        {
            alias type = T;
        }
        else
        {
            alias type = F;
        }
    }

    ///
    extern(D)
    template common_type(T...)
    {
        static if (T.length == 1)
            alias type = typeof(T[0].init);
        else static if (is(typeof(true ? T[0].init : T[1].init) U))
            alias type = common_type_t!(U, T[2 .. $]);
    }

    ///
    deprecated("In D, references aren't type qualifiers but storage classes;"~
    "as a result, they behave the same way as std.common_type.")
    alias basic_common_reference(T, U, TQual, UQual) = common_reference!(T, U, TQual, UQual);

    /// ditto
    template common_reference(T...)
    {
        alias type = common_type_t!T;
    }

    ///
    template underlying_type(T)
    {
        static if (is(T == enum))
        {
            alias type = outer!T;

        private:
            template outer(T) // for loop
            {
                template Impl(T)
                {
                    static if (is(T U == enum))
                        alias Impl = outer!U;
                    else
                        alias Impl = T;
                }

                alias outer = ModifyTypePreservingTQ!(Impl, T);
            }
            ///
            template ModifyTypePreservingTQ(alias Modifier, T)
            {
                static if (is(T U == const U))
                    alias ModifyTypePreservingTQ = const Modifier!U;
                else
                    alias ModifyTypePreservingTQ = Modifier!T;
            }
        }
        else
            static assert(false, "T isn't enum type.");
    }
version(none)
{
    ///
    template invoke_result(Fn, ArgTypes...)
    {
    }

    ///
    template unwrap_reference(T)
    {
    }

    ///
    template unwrap_ref_decay(T)
    {
    }
}
    ///
    alias type_identity_t(T) = type_identity!T.type;

    ///
    alias remove_cvref_t(T) = remove_cvref!T.type;

    ///
    alias decay_t(T) = decay!T.type;

    ///
    alias enable_if_t(bool B, T = void) = enable_if!(B, T).type;

    ///
    alias conditional_t(bool B, T, F) = conditional!(B, T, F).type;

    ///
    alias common_type_t(T...) = common_type!T.type;

    ///
    alias common_reference_t(T...) = common_reference!T.type;

    ///
    alias underlying_type_t(T) = underlying_type!T.type;
version(none)
{
    ///
    alias invoke_result_t(Fn, ArgTypes...) = invoke_result!(Fn, ArgTypes).type;

    ///
    alias unwrap_reference_t(T) = unwrap_reference!T.type;

    ///
    alias unwrap_ref_decay_t(T) = unwrap_ref_decay!T.type;
}
    ///
    alias void_t(Tp...) = void;

    /// [meta.logical], logical operator traits
    struct conjunction(B...)
    {
        static if (B.length == 0)
        {
            true_type temp;
            alias temp this;
        }
        else
        {
            static foreach (i; B)
            {
                static if (i != B.length)
                {
                    conditional_t!(cast(bool)B[i].value, B[i], B[0]) temp;
                }
                else
                {
                    B[B.length] temp;
                }
            }

            alias temp this;
        }
    }

    ///
    struct disjunction(B...)
    {
        static if (B.length == 0)
        {
            false_type temp;
            alias temp this;
        }
        else
        {
            static foreach (i; B)
            {
                static if (i != B.length)
                {
                    conditional_t!(cast(bool)B[i].value, B[0], B[i]) temp;
                }
                else
                {
                    B[B.length] temp;
                }
            }

            alias temp this;
        }
    }

    ///
    struct negation(B)
    {
        bool_constant!(!cast(bool)B.value) temp;

        alias temp this;
    }

    /// [meta.unary.cat], primary type categories
    ///
    enum bool is_void_v(T) = is_void!T.value;

    ///
    enum bool is_null_pointer_v(T) = is_null_pointer!T.value;

    ///
    enum bool is_integral_v(T) = is_integral!T.value;

    ///
    enum bool is_floating_point_v(T) = is_floating_point!T.value;

    ///
    enum bool is_array_v(T) = is_array!T.value;

    ///
    enum bool is_pointer_v(T) = is_pointer!T.value;

    ///
    enum bool is_lvalue_reference_v(T) = is_lvalue_reference!T.value;

    ///
    enum bool is_rvalue_reference_v(T) = is_rvalue_reference!T.value;

    ///
    enum bool is_member_object_pointer_v(T) = is_member_object_pointer!T.value;

    ///
    enum bool is_member_function_pointer_v(T) = is_member_function_pointer!T.value;

    ///
    enum bool is_enum_v(T) = is_enum!T.value;

    ///
    enum bool is_union_v(T) = is_union!T.value;

    ///
    enum bool is_class_v(T) = is_class!T.value;

    ///
    enum bool is_function_v(T) = is_function!T.value;

    ///
    enum bool is_reflection_v(T) = is_reflection!T.value;

    /// [meta.unary.comp], composite type categories
    enum bool is_reference_v(T) = is_reference!T.value;

    ///
    enum bool is_arithmetic_v(T) = is_arithmetic!T.value;

    ///
    enum bool is_fundamental_v(T) = is_fundamental!T.value;

    ///
    enum bool is_object_v(T) = is_object!T.value;

    ///
    enum bool is_scalar_v(T) = is_scalar!T.value;

    ///
    enum bool is_compound_v(T) = is_compound!T.value;

    ///
    enum bool is_member_pointer_v(T) = is_member_pointer!T.value;

    /// [meta.unary.prop], type properties
    ///
    enum bool is_const_v(T) = is_const!T.value;

    ///
    deprecated("In D, volatile is a built-in function declared in core.volatile;"~
    "consequently, it always evaluates to false.")
    enum bool is_volatile_v(T) = is_volatile!T.value;
version(none)
{
    ///
    enum bool is_trivially_copyable_v(T) = is_trivially_copyable!T.value;

    ///
    enum bool is_standard_layout_v(T) = is_standard_layout!T.value;
}
    ///
    enum bool is_empty_v(T) = is_empty!T.value;

    ///
    enum bool is_polymorphic_v(T) = is_polymorphic!T.value;

    ///
    enum bool is_abstract_v(T) = is_abstract!T.value;

    ///
    enum bool is_final_v(T) = is_final!T.value;

    ///
    enum bool is_aggregate_v(T) = is_aggregate!T.value;

    ///
    enum bool is_structural_v(T) = is_structural!T.value;

    ///
    enum bool is_signed_v(T) = is_signed!T.value;

    ///
    enum bool is_unsigned_v(T) = is_unsigned!T.value;

    ///
    enum bool is_bounded_array_v(T) = is_bounded_array!T.value;

    ///
    enum bool is_unbounded_array_v(T) = is_unbounded_array!T.value;

    ///
    enum bool is_scoped_enum_v(T) = is_scoped_enum!T.value;

    ///
    enum bool is_constructible_v(T, Args...) = is_constructible!(T, Args).value;

    ///
    enum bool is_default_constructible_v(T) = is_default_constructible!T.value;

    ///
    enum bool is_copy_constructible_v(T) = is_copy_constructible!T.value;

    ///
    enum bool is_move_constructible_v(T) = is_move_constructible!T.value;

    ///
    enum bool is_assignable_v(T, U) = is_assignable!(T, U).value;

    ///
    enum bool is_copy_assignable_v(T) = is_copy_assignable!T.value;

    ///
    enum bool is_move_assignable_v(T) = is_move_assignable!T.value;
version(none)
{
    ///
    enum bool is_swappable_with_v(T, U) = is_swappable_with!(T, U).value;

    ///
    enum bool is_swappable_v(T) = is_swappable!T.value;

    ///
    enum bool is_destructible_v(T) = is_destructible!T.value;

    ///
    enum bool is_trivially_constructible_v(T, Args...) = is_trivially_constructible!(T, Args).value;

    ///
    enum bool is_trivially_default_constructible_v(T) = is_trivially_default_constructible!T
            .value;

    ///
    enum bool is_trivially_copy_constructible_v(T) = is_trivially_copy_constructible!T.value;

    ///
    enum bool is_trivially_move_constructible_v(T) = is_trivially_move_constructible!T.value;

    ///
    enum bool is_trivially_assignable_v(T, U) = is_trivially_assignable!(T, U).value;

    ///
    enum bool is_trivially_copy_assignable_v(T) = is_trivially_copy_assignable!T.value;

    ///
    enum bool is_trivially_move_assignable_v(T) = is_trivially_move_assignable!T.value;

    ///
    enum bool is_trivially_destructible_v(T) = is_trivially_destructible!T.value;
}
    ///
    enum bool is_nothrow_constructible_v(T, Args...) = is_nothrow_constructible!(T, Args).value;

    ///
    enum bool is_nothrow_default_constructible_v(T) = is_nothrow_default_constructible!T.value;

    ///
    enum bool is_nothrow_copy_constructible_v(T) = is_nothrow_copy_constructible!T.value;

    ///
    enum bool is_nothrow_move_constructible_v(T) = is_nothrow_move_constructible!T.value;

    ///
    enum bool is_nothrow_assignable_v(T, U) = is_nothrow_assignable!(T, U).value;

    ///
    enum bool is_nothrow_copy_assignable_v(T) = is_nothrow_copy_assignable!T.value;

    ///
    enum bool is_nothrow_move_assignable_v(T) = is_nothrow_move_assignable!T.value;
version(none)
{
    ///
    enum bool is_nothrow_swappable_with_v(T, U) = is_nothrow_swappable_with!(T, U).value;

    ///
    enum bool is_nothrow_swappable_v(T) = is_nothrow_swappable!T.value;
}
    ///
    enum bool is_nothrow_destructible_v(T) = is_nothrow_destructible!T.value;
    
    version(none)
    ///
    enum bool is_implicit_lifetime_v(T) = is_implicit_lifetime!T.value;

    ///
    enum bool has_virtual_destructor_v(T) = has_virtual_destructor!T.value;
version(none)
{
    ///
    enum bool has_unique_object_representations_v(T) = has_unique_object_representations!T.value;

    ///
    enum bool reference_constructs_from_temporary_v(T, U) = reference_constructs_from_temporary!(T, U).value;

    ///
    enum bool reference_converts_from_temporary_v(T, U) = reference_converts_from_temporary!(T, U).value;
}
    /// [meta.unary.prop.query], type property queries
    ///
    enum size_t alignment_of_v(T) = alignment_of!T.value;

    ///
    enum size_t rank_v(T) = rank!T.value;

    ///
    enum size_t extent_v(T, uint I = 0) = extent!(T, I).value;

    /// [meta.rel], type relations
    ///
    enum bool is_same_v(T, U) = is_same!(T, U).value;

    ///
    enum bool is_base_of_v(Base, Derived) = is_base_of!(Base, Derived).value;

    ///
    enum bool is_convertible_v(From, To) = is_convertible!(From, To).value;

    ///
    enum bool is_nothrow_convertible_v(From, To) = is_nothrow_convertible!(From, To).value;
version(none)
{
    ///
    enum bool is_layout_compatible_v(T, U) = is_layout_compatible!(T, U).value;

    ///
    enum bool is_pointer_interconvertible_base_of_v(Base, Derived) = is_pointer_interconvertible_base_of!(Base, Derived)
                .value;

    ///
    enum bool is_invocable_v(Fn, ArgTypes...) = is_invocable!(Fn, ArgTypes).value;

    ///
    enum bool is_invocable_r_v(R, Fn, ArgTypes...) = is_invocable_r!(R, Fn, ArgTypes).value;

    ///
    enum bool is_nothrow_invocable_v(Fn, ArgTypes...) = is_nothrow_invocable!(Fn, ArgTypes).value;

    ///
    enum bool is_nothrow_invocable_r_v(R, Fn, ArgTypes...) = is_nothrow_invocable_r!(R, Fn, ArgTypes).value;
}
    /// [meta.logical], logical operator traits
    ///
    enum bool conjunction_v(B...) = conjunction!B.value;

    ///
    enum bool disjunction_v(B...) = disjunction!B.value;

    ///
    enum bool negation_v(B) = negation!B.value;

    /**
    Dにはmember pointerがないため、これらは実装不可。

    ```C++
    template<class S, class M>
    constexpr bool is_pointer_interconvertible_with_class(M S::*m) noexcept;
    ```
    
    ```C++
    template<class S1, class S2, class M1, class M2>
    constexpr bool is_corresponding_member(M1 S1::*m1, M2 S2::*m2) noexcept;
    ```
    */
static if(__VERSION__ > 2114L)
{
    /// constant evaluation context
    ///
    bool is_constant_evaluated() nothrow @__ctfe => true;
    ///
    bool is_constant_evaluated() nothrow => false;
}
    ///
    bool is_within_lifetime(T)(scope const(T)* p) nothrow => __traits(compiles, *p);
} // end namespace std
