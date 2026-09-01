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
Copyright:  2023 Justine Alexandra Roberts Tunney
Copyright: 	Copyright The D Language Foundation 2005 - 2015
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
License:    Original is $(LINK2 https://raw.githubusercontent.com/jart/jtckdint/refs/heads/master/LICENSE.txt, ISC License).
License:    Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:    Denkousi
Authors: 	Manu Evans
Source:     stdc/stdckdint.d
Source:     Original is $(PHOBOSSRC std/traits.d)
Standards:  ISO/IEC 9899:2024, ISO/IEC 14882:2026

本部品集では、移植性を確保するためにC++側の宣言を採用することとし、実装も提供している。これは、C側で組み込み関数の形態をとるためである。
*/
module stdc.stdckdint;

import stdc.stdint : intmax_t, uintmax_t;

extern (C++):
nothrow:
@nogc:
@live:

///
enum __STDC_VERSION_STDCKDINT_H__ = 202311L;


private enum bool isSigned(T) = __traits(isArithmetic, T) && !__traits(isUnsigned, T)
    && is(T : real);

///
bool ckd_add(type1, type2, type3)(return type1* result, type2 a, type3 b)
{
    static assert(__traits(isIntegral, type1) &&
            __traits(isIntegral, type2) &&
            __traits(isIntegral, type3),
            "non-integral types not allowed");
    static assert(!__traits(isSame, type1, bool) &&
            !__traits(isSame, type2, bool) &&
            !__traits(isSame, type3, bool),
            "checked booleans not supported");
    static assert(!__traits(isSame, type1, byte) &&
            !__traits(isSame, type2, byte) &&
            !__traits(isSame, type3, byte),
            "unqualified char type is ambiguous");
    uintmax_t x = a;
    uintmax_t y = b;
    uintmax_t z = x + y;
    *result = cast(type1) z;
    static if (z.sizeof > type2.sizeof && z.sizeof > type3.sizeof)
    {
        static if (z.sizeof > type1.sizeof || isSigned!type1)
        {
            return cast(intmax_t) z != cast(type1) z;
        }
        else static if (!__traits(isSame, type1, uintmax_t))
        {
            return (z != cast(type1) z ||
                    ((isSigned!type2 ||
                        isSigned!type3) &&
                        cast(intmax_t) z < 0));
        }
    }
    bool truncated = false;
    static if (type1.sizeof < intmax_t.sizeof)
    {
        truncated = z != cast(uintmax_t) cast(type1) z;
    }

    switch (isSigned!type1 << 2 |  //
                isSigned!type2 << 1 |  //
                isSigned!type3)
    {
    case 0: // unsigned = unsigned + unsigned 
        return truncated | (z < x);
    case 1: // unsigned = unsigned + signed 
        y ^= intmax_t.min;
        return truncated |
            (cast(intmax_t)((z ^ x) & (z ^ y)) < 0);
    case 2: // unsigned = signed  + unsigned 
        x ^= intmax_t.min;
        return truncated |
            (cast(intmax_t)((z ^ x) & (z ^ y)) < 0);
    case 3: // unsigned = signed  + signed 
        return truncated |
            (cast(intmax_t)(((z | x) & y) | ((z & x) & ~y)) < 0);
    case 4: // signed  = unsigned + unsigned 
        return truncated | (z < x) | (cast(intmax_t) z < 0);
    case 5: // signed  = unsigned + signed 
        y ^= intmax_t.min;
        return truncated | (x + y < y);
    case 6: // signed  = signed  + unsigned 
        x ^= intmax_t.min;
        return truncated | (x + y < x);
    case 7: // signed  = signed  + signed 
        return truncated |
            (cast(intmax_t)((z ^ x) & (z ^ y)) < 0);
    default:
        assert(false);
    }
}
///
bool ckd_sub(type1, type2, type3)(return type1* result, type2 a, type3 b)
{
    static assert(__traits(isIntegral, type1) &&
            __traits(isIntegral, type2) &&
            __traits(isIntegral, type3),
            "non-integral types not allowed");
    static assert(!__traits(isSame, type1, bool) &&
            !__traits(isSame, type2, bool) &&
            !__traits(isSame, type3, bool),
            "checked booleans not supported");
    static assert(!__traits(isSame, type1, char) &&
            !__traits(isSame, type2, char) &&
            !__traits(isSame, type3, char),
            "unqualified char type is ambiguous");

    uintmax_t x = a;
    uintmax_t y = b;
    uintmax_t z = x - y;
    *result = cast(type1) z;
    bool truncated = false;
    static if (type1.sizeof < intmax_t.sizeof)
    {
        truncated = z != cast(uintmax_t) cast(type1) z;
    }
    switch (isSigned!type1 << 2 |  //
                isSigned!type2 << 1 |  //
                isSigned!type3)
    {
    case 0: // unsigned = unsigned - unsigned 
        return truncated | (x < y);
    case 1: // unsigned = unsigned - signed 
        y ^= intmax_t.min;
        return truncated |
            (cast(intmax_t)((x ^ y) & (z ^ x)) < 0);
    case 2: // unsigned = signed  - unsigned 
        return truncated | (y > x) | (cast(intmax_t) x < 0);
    case 3: // unsigned = signed  - signed 
        return truncated |
            (cast(intmax_t)(((z & x) & y) | ((z | x) & ~y)) < 0);
    case 4: // signed  = unsigned - unsigned 
        return truncated |
            ((x < y) ^ (cast(intmax_t) z < 0));
    case 5: // signed  = unsigned - signed 
        y ^= intmax_t.min;
        return truncated | (x >= y);
    case 6: // signed  = signed  - unsigned 
        x ^= intmax_t.min;
        return truncated | (x < y);
    case 7: // signed  = signed  - signed 
        return truncated |
            (cast(intmax_t)((x ^ y) & (z ^ x)) < 0);
    default:
        assert(false);
    }
}
///
bool ckd_mul(type1, type2, type3)(return type1* result, type2 a, type3 b)
{
    static assert(__traits(isIntegral, type1) &&
            __traits(isIntegral, type2) &&
            __traits(isIntegral, type3),
            "non-integral types not allowed");
    static assert(!__traits(isSame, type1, bool) &&
            !__traits(isSame, type2, bool) &&
            !__traits(isSame, type3, bool),
            "checked booleans not supported");
    static assert(!__traits(isSame, type1, char) &&
            !__traits(isSame, type2, char) &&
            !__traits(isSame, type3, char),
            "unqualified char type is ambiguous");
    uintmax_t x = a;
    uintmax_t y = b;
    static if ((type2.sizeof * 8 - isSigned!type2) +
        (
            type3.sizeof * 8 - isSigned!type3) <=
        (type1.sizeof * 8 - isSigned!type1))
    {
        static if (sizeof(uintmax_t) > type1.sizeof || isSigned!type1)
        {
            intmax_t z = x * y;
            return z != (*result = cast(type1) z);
        }
        else static if (!__traits(isSame, type1, uintmax_t))
        {
            uintmax_t z = x * y;
            *result = cast(type1) z;
            return (z != cast(type1) z ||
                    ((isSigned!type2 ||
                        isSigned!type3) &&
                        cast(intmax_t) z < 0));
        }
    }
    switch (isSigned!type1 << 2 |  //
                isSigned!type2 << 1 |  //
                isSigned!type3)
    {
    case 0:
        { // unsigned = unsigned * unsigned 
            uintmax_t z = x * y;
            bool o = x && z / x != y;
            *result = cast(type1) z;
            return o | (type1.sizeof < z.sizeof &&
                    z != cast(uintmax_t)*result);
        }
    case 1:
        { // unsigned = unsigned * signed 
            uintmax_t z = x * y;
            bool o = x && z / x != y;
            *result = cast(type1) z;
            return (o | ((cast(intmax_t) y < 0) & !!x) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    case 2:
        { // unsigned = signed  * unsigned 
            uintmax_t z = x * y;
            bool o = x && z / x != y;
            *result = cast(type1) z;
            return (o | ((cast(intmax_t) x < 0) & !!y) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    case 3:
        { // unsigned = signed  * signed 
            bool o = false;
            if (cast(intmax_t)(x & y) < 0)
            {
                x = 0 - x;
                y = 0 - y;
            }
            else if (cast(intmax_t)(x ^ y) < 0)
            {
                o = x && y;
            }
            uintmax_t z = x * y;
            o |= x && z / x != y;
            *result = cast(type1) z;
            return o | (type1.sizeof < z.sizeof &&
                    z != cast(uintmax_t)*result);
        }
    case 4:
        { // signed  = unsigned * unsigned 
            uintmax_t z = x * y;
            bool o = x && z / x != y;
            *result = cast(type1) z;
            return (o | (cast(intmax_t) z < 0) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    case 5:
        { // signed  = unsigned * signed 
            uintmax_t t = 0 - y;
            t = cast(intmax_t) t < 0 ? y : t;
            uintmax_t p = t * x;
            bool o = t && p / t != x;
            int n = cast(intmax_t) y < 0;
            uintmax_t z = n ? 0 - p : p;
            *result = cast(type1) z;
            uintmax_t m = intmax_t.max;
            return (o | (p > m + n) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    case 6:
        { // signed  = signed  * unsigned 
            uintmax_t t = 0 - x;
            t = cast(intmax_t) t < 0 ? x : t;
            uintmax_t p = t * y;
            bool o = t && p / t != y;
            int n = cast(intmax_t) x < 0;
            uintmax_t z = n ? 0 - p : p;
            *result = cast(type1) z;
            uintmax_t m = intmax_t.max;
            return (o | (p > m + n) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    case 7:
        { // signed  = signed  * signed 
            uintmax_t z = x * y;
            *result = cast(type1) z;
            return ((((cast(intmax_t) y < 0) &&
                    (cast(intmax_t) x ==
                    intmax_t.min)) ||
                    (y && ((cast(intmax_t) z /
                    cast(intmax_t) y) !=
                    cast(intmax_t) x))) |
                    (type1.sizeof < z.sizeof &&
                        z != cast(uintmax_t)*result));
        }
    default:
        assert(false);
    }
}

extern(C):
unittest
{
    int r;

    assert(ckd_add(&r, 2147483647, 1) == true);
    assert(ckd_add(&r, 1, 1) == false);
    assert(ckd_add(&r, 0xFFFFFFFFu, 1u) == true);
    assert(ckd_add(&r, 10u, 20u) == false);
    assert(ckd_add(&r, -1073741826, -1073741826) == true);

    assert(ckd_sub(&r, -2147483648, 1) == true);
    assert(ckd_sub(&r, 5, 3) == false);
    assert(ckd_sub(&r, 0u, 1u) == false);
    assert(ckd_sub(&r, 20u, 10u) == false);
    assert(ckd_sub(&r, -1073741826, 1073741826)== true);

    assert(ckd_mul(&r, 0xFFFFFFFFu, 2u) == true);
    assert(ckd_mul(&r, 10u, 20u) == false);
    assert(ckd_mul(&r, 2000000000, 2) == true);
    assert(ckd_mul(&r, 10, 20) == false);
    assert(ckd_mul(&r, -1073741826, 2) == true);
}
version(unittest)
{
    import stdc.stdio;

    void __unittest_L322_C1();
    void main()
    {
        __unittest_L322_C1();
        puts("1 modules passed unittests.");
    }
}