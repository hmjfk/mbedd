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
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors: 	$(HTTP digitalmars.com, Walter Bright), $(HTTP klickverbot.at, David Nadlinger)
Authors:    Denkousi
Source:    Original is $(PHOBOSSRC std/meta.d)
*/

module stdcpp.utility;
public import stdcpp.initializer_list;
version(none)
public import stdcpp.type_traits;
public import stdcpp.cstddef;
import stdcpp.support;
import core.attribute: weak;

/*
The ref here corresponds to a forwarding reference on the C++ side. 
When explicitly instantiating, instantiate it as an lvalue reference.
*/

// work only
version (none)
{
	import core.stdcpp.utility;
}

extern(C++, "std")
{
	/// [utility.swap], swap
	void swap(T)(ref T a, ref T b) /*noexcept(see below)*/ ;
	/// ditto
	void swap(T, size_t N)(ref T[N] a, ref T[N] b) /*noexcept(is_nothrow_swappable_v<T>)*/ ;

	/// [utility.exchange], exchange
	T exchange(T, U = T)(ref T obj, ref U new_val) /*noexcept(see below)*/ ;

  	/// [forward], forward/move
    /// std::forwardは、言語機能の相違により実装不能である。

	/**
	---
    template<class T>
    T&& forward(remove_reference_t<T>& t) noexcept;

    template<class T>
    T&& forward(remove_reference_t<T>&& t) noexcept;

    template<class T, class U>
    auto forward_like(U&& x) noexcept -> see below;
    ---
	*/
	extern(D)
	ref T move(T)(return ref T x) __rvalue nothrow => x; /// since D111.0

	version(none)
	///
	ref conditional_t!(!is_nothrow_move_constructible_v!T && is_copy_constructible_v!T, const T, T)
	move_if_noexcept(ref T x) nothrow => move(x);

	// add_const_tの仮実装
	static if(!is(typeof(add_const_t)))
		private alias add_const_t(T) = const T;
	
	/// [utility.as.const], as_const
	@weak
	ref add_const_t!T as_const(T)(return ref T t) nothrow => t;
	///
	@disable void as_const(T)(const ref T);

	/// [declval], declval
	T declval(T)() nothrow  /// as unevaluated operand
	{
		assert(false, "The call to the declval function is ill-formed.");
		return T.init;
	}

	/// [utility.intcmp], integer comparison functions
	bool cmp_equal(T, U)(T t, U u) nothrow;
	///
	bool cmp_not_equal(T, U)(T t, U u) nothrow;
	///
	bool cmp_less(T, U)(T t, U u) nothrow;
	///
	bool cmp_greater(T, U)(T t, U u) nothrow;
	///
	bool cmp_less_equal(T, U)(T t, U u) nothrow;
	///
	bool cmp_greater_equal(T, U)(T t, U u) nothrow;

	///
	bool in_range(R, T)(T t) nothrow;

	// underlying_type_tの仮実装
	static if(!is(typeof(underlying_type_t)))
	{
		private template underlying_type_t(T)
		{
			static if(is(T U == enum))
				alias underlying_type_t = U;
		}
	}

	/// [utility.underlying], to_underlying
	underlying_type_t!T to_underlying(T)(T value) nothrow @__ctfe
	=> cast(underlying_type_t!T)value;
	underlying_type_t!T to_underlying(T)(T value) nothrow;

	/// [utility.undefined], undefined behavior
	// remove_const_tの仮実装
	static if(!is(typeof(remove_const_t)))
	private template remove_const_t(T)
	{
		static if(is(T : const U, U))
			alias remove_const_t = U;
	}
	// is_constructible_vの仮実装
	static if(!is(typeof(is_constructible_v)))
	private enum is_constructible_v(T, Args...) = __traits(compiles, (){ T a = T(Args); });

	mixin template cw_operators() /// exposition only
	{
		/// unary operators
		auto opUnary(typeof("") op)() nothrow
		{ return mixin(q{constant_wrapper!(}~op~q{this.value)()}); }

		/// ditto
		auto opIndexUnary(typeof("") op)() nothrow
		{ return mixin(q{constant_wrapper!(}~op~q{this.value)()}); }

		/// binary operators
		auto opBinary(typeof("") op, L)(L l) nothrow
		{ return mixin(q{constant_wrapper!(L.value}~op~q{this.value)()}); }

		/// ditto
		auto opBinaryRight(typeof("") op, R:constexpr_param!R)(R r) nothrow
		{ return mixin(q{constant_wrapper!(R.value}~op~q{this.value)()}); }
		
		/// pseudo-mutators
		auto opOpAssign(typeof("") op, T)(T) nothrow
		{ return mixin(q{constant_wrapper!(T.value}~op~q{this.value)()}); }

		/// comparisons
		auto opCmp(T:constexpr_param!T)(T) nothrow
		{ return T.value; }
		/// ditto
		bool opEquals(T: constexpr_param!T)(T) nothrow
		{ return this.value == T.value; }
	}

	///
	struct constant_wrapper(alias X, T = typeof(X))
	{
		mixin cw_operators;

		///
		static ref enum value = (X);
		///
		alias type = constant_wrapper;
		///
		alias value_type = typeof(X);
		

		///
		auto opAssign(R)() const nothrow
		if(constexpr_param!R)
		{ return constant_wrapper!(value = R.value)(); }

		/**
		型変換演算子の多重定義
		
		**規格からの変更点**
		
		std.constant_wrapperからの暗黙の型変換は動作しない。
		必要な場合は、明示的に型変換すること。
		
		これは、D言語の仕様に起因するものである。
		*/
		auto opCast(T: typeof(value))() const nothrow
		{ return value; }


		/**
		論理和、論理積演算子の多重定義

		実装上の都合でcw_operatorsから移動して定義している。

		**規格からの変更点**
		
		D言語の仕様により、`||`と`&&`演算子は直接多重定義することができないため、
		bool型 変換演算子を多重定義することで代替とした。

		Bug: 特定の文脈で暗黙の型変換に失敗することがある。
		*/
		bool opCast(T:bool)() nothrow
		if(!is_constructible_v!(bool, value))
		{ return cast(bool)value; }

		///
		version(none)
			static ref auto opCall(Args...)(ref Args args);
		static ref auto opIndex(Args...)(Args args)
		{
			
			static if(constexpr_param!(remove_const_t!Args) && is(constant_wrapper!(value[remove_const_t!(Args).value]) v))
				return v();

			else
				value[args];
		}
	}

	///
	extern(D)
	enum constexpr_param(T) = is(constant_wrapper!(T.value));
	///
	extern(D)
	enum cw(alias X) = constant_wrapper!X();

	/// compile-time integer sequences
	struct integer_sequence(T, I...) 
	if(is(Repeat!(I.length - 1, T) == I))
	{
		alias value_type = T;
		static size_t size() nothrow
		{
			return sizeof___(I);
		}
	}

	///
	template index_sequence(I...) if (is(I : size_t))
	{
		alias index_sequence = integer_sequence!(size_t, I);
	}
	///
	template make_integer_sequence(T, T N)
	{
		static if (N == 0)
		{
			alias make_integer_sequence = integer_sequence!T;
		}
		else
		{
			private alias intseq = Aliases!0;

			static foreach (i; 0 .. N)
				intseq = Aliases!(intseq, intseq[i] + 1);

			alias make_integer_sequence = integer_sequence!(T, intseq);
		}
	}
	///
	alias make_index_sequence(size_t N) = make_integer_sequence!(size_t, N);

	///
    alias index_sequence_for(T...) = make_index_sequence!sizeof___(T);

 	/// [intseq.binding], structured binding support
	static if(is(typeof(integral_constant)))
	{
		extern(D)
		private struct integral_constant(T, T v)
		{
		public:
			///
			static enum T value = v;
			///
			alias value_type = integral_constant!(T, v);
			///
			alias type = typeof(this);

			///
			value_type opCast(value_type)() nothrow const
			{
				return value;
			}
			///
			value_type opCall()() nothrow const
			{
				return value;
			}
		}
	}
	///
	struct tuple_size(T, Values...)
	if(is(Repeat!(Values.length - 1u, T) == Values))
	{ enum tuple_size = integral_constant!(size_t, sizeof___(Values))(); }

  	///
	struct tuple_element(size_t I, T:integer_sequence!(T, Values), Values...) 
	if(is(Repeat!(Values.length - 1u, T) == Values))
  	{ alias type = T; };

  	///
	struct tuple_element(size_t I, T: const integer_sequence!(T, Values), Values...) 
	if(is(Repeat!(Values.length - 1u, T) == Values))
  	{ alias type = T; };

	T get(size_t I, T, Values...)(integer_sequence!(T, Values)) @__ctfe
	if(I < sizeof___(Values))
	=> values[I];
	
	///
	T get(size_t I, T, Values...)(integer_sequence!(T, Values))
	if(I < sizeof___(Values));

	/// class template pair
	extern (C++,struct)
	struct pair(T1, T2)
	{
		///
		alias first_type = T1;
		///
		alias second_type = T2;

		///
		T1 first;
		///
		T2 second;

		///
		this(const ref pair);
	
		version(none)
		this();
		///
		this(const ref T1 x, const ref T2 y);
		///
		this(U1, U2)(ref pair!(U1, U2) p);
		///
		this(U1, U2)(const ref pair!(U1, U2) p);
		///
		version(none)
		this(P)(ref P p)
		if(pair_like!P);
		///
		this(Args1..., Args2...)(piecewise_construct_t, tuple!Args1 first_args, tuple!Args1 second_args);

		///
		ref pair opAssign(const ref pair p);
		///
		ref const(pair) opAssign(const ref pair p) const;
		///
		ref pair opAssign(U1, U2)(const ref pair!(U1, U2) p);
		///
		ref const(pair) opAssign(U1, U2)(const ref pair!(U1, U2) p) const;
		///
		ref pair opAssign(U1, U2)(ref pair!(U1, U2) p);
		///
		ref const(pair) opAssign(U1, U2)(ref pair!(U1, U2) p) const;
		///
		version(none)
		ref pair opAssign(P)(ref P p)
		if(pair_like!P);
		///
		version(none)
		ref const(pair) opAssign(P)(ref P p) const
		if (pair_like!P);

		///
		void swap(ref pair p) /*noexcept(see below)*/ ;
		///
		void swap(const ref pair p) const  /*noexcept(see below)*/ ;
	}
/*
  template<class T1, class T2, class U1, class U2,
           template<class> class TQual, template<class> class UQual>
    requires requires { typename pair<common_reference_t<TQual<T1>, UQual<U1>>,
                                      common_reference_t<TQual<T2>, UQual<U2>>>; }
  struct basic_common_reference<pair<T1, T2>, pair<U1, U2>, TQual, UQual> {
    using type = pair<common_reference_t<TQual<T1>, UQual<U1>>,
                      common_reference_t<TQual<T2>, UQual<U2>>>;
  };

  template<class T1, class T2, class U1, class U2>
    requires requires { typename pair<common_type_t<T1, U1>, common_type_t<T2, U2>>; }
  struct common_type<pair<T1, T2>, pair<U1, U2>> {
    using type = pair<common_type_t<T1, U1>, common_type_t<T2, U2>>;
  };
*/
	/// pair specialized algorithms
/*
  template<class T1, class T2, class U1, class U2>
    bool opAssign(const pair<T1, T2>&, const pair<U1, U2>&);
  template<class T1, class T2, class U1, class U2>
    common_comparison_category_t<synth-three-way-result<T1, U1>,
                                           synth-three-way-result<T2, U2>>
      operator<=>(const pair<T1, T2>&, const pair<U1, U2>&);
*/
	///
	void swap(T1, T2)(ref pair!(T1, T2) x, ref pair!(T1, T2) y) /*noexcept(noexcept(x.swap(y)))*/ ;
	///
	void swap(T1, T2)(const ref pair!(T1, T2) x, const ref pair!(T1, T2) y) /*noexcept(noexcept(x.swap(y)))*/;
	
	version(none)
	pair!(unwrap_ref_decay_t!T1, unwrap_ref_decay_t!T2) make_pair(ref T1, ref T2);

	/// tuple-like access to pair
	struct tuple_element(size_t I, T);
	///
	version(none)
	struct tuple_size(T1 : pair!(T1, T2), T2)
	{
		integral_constant!(size_t, 2) temp;
		alias temp this;
	}
	///
	struct tuple_element(size_t I, T1:pair!(T1, T2), T2)
	{
		static if (I == 0)
		{
			alias type = T1;
		}
		else
		{
			alias type = T2;
		}
	}

	///
	ref tuple_element_t!(I, pair!(T1, T2)) get(size_t I, T1, T2)(ref pair!(T1, T2)) nothrow;
	///
	ref const(tuple_element_t!(I, pair!(T1, T2))) get(size_t I, T1, T2)(const ref pair!(T1, T2)) nothrow;
	///
	ref T1 get(T1, T2)(ref pair!(T1, T2) p) nothrow;
	///
	const ref T1 get(T1, T2)(const ref pair!(T1, T2) p) nothrow;
	///
	ref T2 get(T2, T1)(ref pair!(T1, T2) p) nothrow;
	///
	const ref T2 get(T2, T1)(const ref pair!(T1, T2) p) nothrow;

	/// pair piecewise construction
	struct piecewise_construct_t
	{
		version(none)
		this();
	};

	enum piecewise_construct_t piecewise_construct = piecewise_construct_t();

	struct tuple(Type...); /// defined in <tuple>

	/// in-place construction
	struct in_place_t
	{
		version(none)
		this();
	};
	enum in_place_t in_place = in_place_t();

	struct in_place_type_t(T)
	{
		version(none)
		this();
	};
	enum in_place_type_t in_place_type(T) = in_place_type_t!T();

	struct in_place_index_t(size_t I)
	{
		version(none)
		this();
	};
	enum in_place_index_t in_place_index(size_t I) = in_place_index_t!I();

	/// nontype argument tag
	struct nontype_t(T, T v)
	{
		version(none)
		this();
	};
	enum nontype_t(T) = nontype!T();

	/// class monostate
	struct monostate
	{};

	/// hash support
	// 現状のD言語では、次の宣言を記述できないため、注釈になっている。
	// struct hash(Types...: variant!Types);
	struct hash(T : monostate);
}