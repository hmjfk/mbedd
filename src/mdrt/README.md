# mdrt: Druntime for Mbed system
> この概要は今後の方針について言及したものであり、実際に利用可能ではない。

このmoduleは、組み込み機器向けのDruntimeである。基本的に、各種標準に準拠させることを最優先にしているため、D言語固有の機能だけが実装されている。
- 常にbetterC
- 小さな実行記録体
## Druntime取込禁止
mbedd付属のobject.dを使用した場合、Druntimeの実装に依存する全ての言語機能が制限される。
これにより、従来のphobosとdruntimeは一部を除き使用不可能となる。原因は最低限必要な`size_t`などの型が不足するためであり、version識別子 WithDruntimeを定義すればある程度緩和される。詳しくは、[mdrtのREADME](src/mdrt/README.md)を参照のこと。
また、処理開始点はC結合規約でなければならない。そうしないと、編纂後のmain関数形式が`int _Dmain(string[])`になってしまうからだ。
## 任意のversion選択肢
### WithDruntime
mdrtがdruntimeを編纂するのに最低限必要な型を定義し、互換性を確保する。これにより、mebddとdruntimeのcore module, Phobosの一部と共存して使用できるようになる。
## 動的配列とC++関数の相互変換
D言語の動的配列と連想配列は`mdrt.cppinterface`で定義されている関数を使うことで、Runtime ABIに関係なく相互に呼び出すことができるようにする予定。
## 処理系のruntime関数暗黙呼び出しについて
D言語の処理系では、動的配列、文字列型、**in**, `~`演算子などが使用された場合、暗黙に`object`moduleが取り込まれてruntimeが働く。しかしmdrtでは、そのような言語の組込機能に対応する識別子を定義していないため、処理系が問題を診断する。使用者が明示的に使用する`object`moduleの識別子は、`mdrt.coredefs`など、別の場所に定義されていることに注意を要する。
### 既存のphobos及びdruntimeについて
そもそもmdrtは、`object`moduleの代替を最大の目的としているため、最低限の機能しかない。しかし、OS環境下の開発と共存させて従来のphobosといっしょに使いたいということもあるだろう。

mdrtではこうした事例に備えて、mdrtとは異なるdir内に`object.d`が存在し、かつ明示的に場所を指定することに加えて、条件付きでphobosとdruntimeを使えるようにしている。
1. 既存のdruntimeが同じdirに含まれないよう注意すること。たとえば、次のようなdir構成が望ましい。
~~~
./
|_ boost

|_ mbedd
|   |_ stdc
|   |_ stdcpp
|_ mdrt
|   |_ import
|   |   |_ core
|   |   |_ object.d
|   |_ array.d
|       ︙
|_ std
|   |_ compat.d
|   |_ package.d
|
|_ offical
    |_ core -> /usr/include/dmd/druntime/import/core/
    |_ etc -> /usr/include/dmd/phobos/
    |_ rt -> /usr/include/dmd/druntime/import/rt/
    |_ std -> /usr/include/dmd/phobos/std/
    |_ __importc_builtins.di -> /usr/include/dmd/druntime/import/__importc_builtins.di
    |_ importc.h -> /usr/include/dmd/druntime/import/importc.h 

注記：-> はsymlinkの参照先を表している。
~~~
このとき、"offical" dirは`-I`引数で取り込む場所を指定しておく。libmbed全体を使いたい場合は、ついでにそれが置かれているdirも指定しておく。
2. version識別子 WithDruntimeを定義する。

## 言語仕様の版について
mdrtはRuntimeを伴う言語機能には対応していないが、それ以外であれば最新の言語仕様に基づいている。
## 連携編集用引数
D言語の処理系が標準のdruntimeを結合してしまうことを防ぐため、C言語の処理系などで連携編集を行うとよい。この場合の引数は次のようになる。
~~~
-m64 -Xlinker  -L<static-lib-dir> -Bdynamic -lmdrt
~~~
`<static-lib-dir>`は、mdrtの静的libsが存在する場所である。通常は、/usr/lib/にあることが多いが、自分で構築した場合は、そのbuild dirに入っている可能性がある。必要に応じて、`-Wl,--gc-sections`をつけると良い。