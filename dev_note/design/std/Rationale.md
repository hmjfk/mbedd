## 設計の根拠
開発規約にもあるとおり、mbeddはUnix哲学に従って移植性を確保し、なおかつ忠実な自動化をしなければならない。さらには単純な実装であることも必要である。
そこで、設計判断の過程を次のように示し、開発規約への適合性を検証可能にすることが、この文書の目的である。
### 実装定義や環境依存の識別子をどうするか？
方針: 問題が生じない限り、Cの宣言列はimportCを使って取り込む。そのための名前空間が`stdc.cheader`である。

macro名はC側で展開させる。これに伴うD側の識別子定義が必要であれば同時に行う。C側で関数の多重定義を行っているmacro名は展開せずにD側で多重定義させる。
その他、D側で直接macro名を実装してしまう方法もあるが、これは最終手段である。
### 複雑な型制約などにより発生する名前修飾の移植性をどうするか？
方針: 別の翻訳単位にまたがってABI互換性を確保する必要がなければ、名前修飾を無視してD側で再実装。

呼び出し元で名前修飾の一致を要求するような使い方が想定されている識別子であれば、名前修飾の移植性を考慮する。そうでない場合は、D言語側のみで総称型の具現化は完結してしまうので、このような配慮は不要。

具体例としては、次のようなものが考えられる。

- 考慮する場合
~~~D
export nothrow __gshared:
extern(C++):
@nogc:

struct res(R)
{
    bool a;
    R r;
}

// とある標準部品集の関数。C++側に実装がある。
/**
this function is value conversion ... 
Params:
    arg = anything value
Returns:
    converted value
*/
res!T f(T)(T arg)
if(__traits(compiles, cast(int)T) && __traits(compiles, (){T a;}));


struct numarr(T)
{
    T v;
    
    typeof(v) opUnary(typeof("") op)();
    T opBinary(typeof("") op, T)(T a);
    T opOpAssign(typeof("") op, T)(T);
    bool opCmp(typeof(this));
    bool opEquals(typeof(this));
    T opAssign(T)(T);
    T OpCast(T)();
}
~~~
- 考慮しない場合
~~~D
nothrow @nogc extern(C++):

struct is_constant(alias c)
{
    enum is_constant = __traits(compiles, (){enum constant = c;});
}

struct const_plus(int a, int b)
{
    enum const_plus = a + b;
}


void bar()
{
    extern(C++)
        void a(T)(T);

	a(const_plus(1, 1));
}
~~~