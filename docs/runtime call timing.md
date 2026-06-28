### runtimeはいつ呼ばれるのか
この試験片は、-betterCを有効にすること。
~~~D
extern (C)
void main()
{
    // 宣言だけは不要。
    int[] a, b;　// ABI上は、struct (T){ T v; T* ptr; }と等価。
    string str = "string";
    int[char] aa; // ABI上は、void*と等価。

    // runtimeが必要な操作。これは文字列も同様。
    debug(runtime_dA)
    {
        a = [0];
        a = b ~ [];
        a ~= b;
        a < b; // 比較。静的配列や連想配列でも同様。
        a[] = b[]; // LDCのみ。gdcはcore.stdc.string.memcpyを呼ぶ。
        a[] = b[] + 0; // gdcはcore.stdc.string.memcpyを呼ぶ。
        a.length = 30;
    }
    debug(runtime_aA)
    {
        aa = [32: 'a', 43: 'f', 23: 'z'];
        aa['\0'] = 3;
        a[0] = aa['\0'];
        auto p = '\0' in aa;
    }

    // runtime不要
    auto v = a.init;
    size_t l =  a.length;

    a[0] = 0;
    b = a;
    a == b; // 等値比較は不要
    a = a[1..3];
    b = a[1..3];
    a[0..2] = b[2..4]; // gdcはcore.stdc.string.memcpyを呼ぶ。
    a[] = 0; // gdcはcore.stdc.string.memsetを呼ぶ可能性あり。

}
/*
Property関数用識別子一覧。実際はobject名前空間にてruntimeの関数を暗黙に宣言しているに過ぎない。
配列：assumeSafeAppend capacity dup idup reserve
連想配列：byKey byKeyValue byValue clear dup get keys rehash require update values
*/
~~~
上記以外は、以下のmoduleにて詳しい説明やunittestによる例がある。
- https://dlang.org/spec/function.html#nogc-functions
- https://dlang.org/spec/expression.html#array-literal-heap
- object
- core.exception
- core.interpolation
- core.lifetime
- core.memory
- core.intarnal.array
- core.internal.cast_
- core.internal.dassert
- core.internal.entrypoint
- core.internal.newaa
- core.internal.switch_
- rt.aApply
- rt.aApplyR
