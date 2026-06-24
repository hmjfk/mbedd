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
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
/**
druntime less dynamic & associative array type
Copyright: 2025 - Denkousi
Copyright: Copyright Digital Mars 2000 - 2011.
License:  $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+). 
License:  Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:  Denkousi
Authors:  Walter Bright, Sean Kelly
Source:   

通常、@nogcやbetterC下では処理系がDruntimeの関数に依存しているため、動的配列や連想配列は利用できない。
それでも、D言語の言語機能は魅力的なので使いたくなってしまう。そこで、mdrt.arrayはこの問題を解決すべく設計された。
mdrt.arrayでは、任意の記憶域を割り当ててから、druntimeと同様の関数を使うことができる。
*/
module mdrt.array;

@nogc:
nothrow:
@safe:
@live:

// work only
version (none)
{
    import object;
}


/// druntimeなしでも動的配列と連想配列を動かすための型
struct DArray(T, Allocater = void)
if(is(T U == U[]) ||__traits(isAssociativeArray,T))
{
}
unittest
{
     import mdrt.coredefs;

     DArray!int[] arr;
     DArray!int[string] a;
     DArray!([1,2,3]) al;
     DArray!([1:"a", 1:"2"]) aal;

}

/// 配列及び連想配列操作用関数。もともとobject.dにあったものがここに移動している。

/**
Assume that it is safe to append to this array. Appends made to this array
after calling this function may append in place, even if the array was a
slice of a larger array to begin with.

Use this only when it is certain there are no elements in use beyond the
array in the memory block.  If there are, those elements will be
overwritten by appending to this array.

Warning:
    Calling this function, and then using references to data located after the
    given array results in undefined behavior.

Returns:
    The input is returned.
*/
ref inout(T[]) assumeSafeAppend(T)(auto ref inout(T[]) arr) nothrow @system;

/**
(Property) Gets the current _capacity of a slice. The _capacity is the size
that the slice can grow to before the underlying array must be
reallocated or extended.

If an append must reallocate a slice with no possibility of extension, then
`0` is returned. This happens when the slice references a static array, or
if another slice references elements past the end of the current slice.

Note:
    The _capacity of a slice may be impacted by operations on other slices.
*/
size_t capacity(T)(T[] arr) pure nothrow @property @trusted;

/**
Reserves capacity for a slice. The capacity is the size
that the slice can grow to before the underlying array must be
reallocated or extended.

Returns:
    The new capacity of the array (which may be larger than 
    the requested capacity).
*/
size_t reserve(T)(ref T[] arr, size_t newcapacity) pure nothrow @trusted
{
     return newcapacity;
}

/**
Creates a new array of the same size and copies the contents of
the array into it.
Params:
    aa =    The dynamic or associative array.
*/
auto dup(T)(T[] a) @property
if (!is(const(T) : T));

/// ditto
T[] dup(T)(const(T)[] a) @property
if (is(const(T) : T));

/// ditto
V[K] dup(T, K, V)(T aa);

/// ditto
V[K] dup(T, K, V)(T* aa)
{
     return (*aa).dup;
}

/**
Create a dynamic array of the same size and copy the contents of
the array into it. The copy is typed as being immutable.
If this conversion is invalid the call will not compile.
Params:
    aa =    The dynamic array.
*/
immutable(T)[] idup(T)(T[] a) @property;

/// ditto
immutable(T)[] idup(T)(const(T)[] a) @property;

/// ditto
immutable(T)[] idup(T:void)(const(T)[] a) @property
{
     return a.dup;
}
/**
Returns a $(REF_ALTTEXT forward range, isForwardRange, std,range,primitives)
which will iterate over the keys of the associative array. The keys are
returned by reference.

If structural changes are made to the array (removing or adding keys), all
ranges previously obtained through this function are invalidated. The
following example program will dereference a null pointer:

---
import std.stdio : writeln;
import mdrt.array;

auto dict = ["k1": 1, "k2": 2];
auto keyRange = dict.byKey;
dict.clear;
printf(keyRange.front);    // Segmentation fault
---

Params:
    aa =     The associative array.
Returns:
    A forward range referencing the keys of the associative array.
*/
auto byKey(T, K, V)(T aa) pure nothrow @nogc @safe;

/// ditto
auto byKey(T, K, V)(T* aa) pure nothrow @nogc
{
     return (*aa).byKey();
}

/**
Returns a $(REF_ALTTEXT forward range, isForwardRange, std,range,primitives)
which will iterate over the key-value pairs of the associative array. The
returned pairs are represented by an opaque type with `.key` and `.value`
properties for accessing references to the key and value of the pair,
respectively.

If structural changes are made to the array (removing or adding keys), all
ranges previously obtained through this function are invalidated. The
following example program will dereference a null pointer:

---
import std.stdio : writeln;
import mdrt.array;

auto dict = ["k1": 1, "k2": 2];
auto kvRange = dict.byKeyValue;
dict.clear;
writeln(kvRange.front.key, ": ", kvRange.front.value);    // Segmentation fault
---

Note that this is a low-level interface to iterating over the associative
array and is not compatible with the
$(LINK2 $(ROOT_DIR)phobos/std_typecons.html#.Tuple,`Tuple`) type in Phobos.
For compatibility with `Tuple`, use
$(LINK2 $(ROOT_DIR)phobos/std_array.html#.byPair,std.array.byPair) instead.

Params:
     aa =     The associative array.
Returns:
     A forward range referencing the pairs of the associative array.
*/
auto byKeyValue(T, K, V)(T aa) pure nothrow @nogc @safe;

/// ditto
auto byKeyValue(T, K, V)(T* aa) pure nothrow @nogc
{
    return (*aa).byKeyValue();
}

/**
Returns a $(REF_ALTTEXT forward range, isForwardRange, std,range,primitives)
which will iterate over the values of the associative array. The values are
returned by reference.

If structural changes are made to the array (removing or adding keys), all
ranges previously obtained through this function are invalidated. The
following example program will dereference a null pointer:

---
import std.stdio : writeln;
import mdrt.array;

auto dict = ["k1": 1, "k2": 2];
auto valueRange = dict.byValue;
dict.clear;
writeln(valueRange.front);    // Segmentation fault
---

Params:
     aa =     The associative array.
Returns:
     A forward range referencing the values of the associative array.
*/
auto byValue(T, K, V)(T aa) pure nothrow @nogc @safe;

/// ditto
auto byValue(T, K, V)(T* aa) pure nothrow @nogc
{
    return (*aa).byValue();
}

/**
Removes all remaining keys and values from an associative array.
Params:
     aa =     The associative array.
*/
void clear(Value, Key)(Value[Key] aa) @trusted;

/// ditto
void clear(Value, Key)(Value[Key]* aa) @trusted;

/**
If `key` is in `aa`, returns corresponding value; otherwise it evaluates and
returns `defaultValue`.
Params:
     aa =     The associative array.
     key =    The key.
     defaultValue = The default value.
Returns:
     The value.
*/
inout(V) get(K, V)(inout(V[K]) aa, K key, lazy inout(V) defaultValue)
{
     auto p = key in aa;
     return p ? *p : defaultValue;
}

/// ditto
inout(V) get(K, V)(inout(V[K])* aa, K key, lazy inout(V) defaultValue)
{
    return (*aa).get(key, defaultValue);
}

/**
Returns a newly allocated dynamic array containing a copy of the keys from
the associative array.
Params:
     aa =     The associative array.
Returns:
     A dynamic array containing a copy of the keys.
*/
@property auto keys(Value, Key)(inout Value[Key] aa);

/// ditto
@property auto keys(T : Value[Key], Value, Key)(T* aa);

/**
Reorganizes the associative array in place so that lookups are more
efficient.
Params:
     aa =     The associative array.
Returns:
     The rehashed associative array.
*/
Value[Key] rehash(Value, Key)(Value[Key] aa);

/// ditto
Value[Key] rehash(T : Value[Key], Value, Key)(T* aa);

/// ditto
Value[Key] rehash(T : shared(Value[Key]), Value, Key)(auto ref T aa);

/// ditto
Value[Key] rehash(T : shared(Value[Key]), Value, Key)(T* aa);

/**
If `key` is in `aa`, returns corresponding value; otherwise it evaluates
`value`, adds it to the associative array and returns it.
Params:
     aa =     The associative array.
     key =    The key.
     value =  The required value.
Returns:
     The value.
*/
ref V require(K, V)(ref V[K] aa, K key, lazy V value = V.init);

/**
Calls `create` if `key` doesn't exist in the associative array,
otherwise calls `update`.
`create` returns a corresponding value for `key`.
`update` accepts a key parameter. If it returns a value, the value is
set for `key`.
Params:
     aa =     The associative array.
     key =    The key.
     create = The callable to create a value for `key`.
              Must return V.
     update = The callable to call if `key` exists.
              Takes a K argument, returns a V or void.
*/
void update(K, V, C, U)(ref V[K] aa, K key, scope C create, scope U update)
if (is(typeof(create()) : V) &&
     (is(typeof(update(aa[K.init])) : V) || is(typeof(update(aa[K.init])) == void)));

/**
Returns a newly allocated dynamic array containing a copy of the values from
the associative array.
Params:
     aa =     The associative array.
Returns:
     A dynamic array containing a copy of the values.
*/
@property auto values(Value, Key)(inout Value[Key] aa);

/// ditto
@property auto values(T : Value[Key], Value, Key)(T* aa);

/// 連想配列同士を連結する関数
