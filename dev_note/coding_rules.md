# 開発時の推奨事項
## 開発作法規約
mbeddは、第一に組み込み向けである。そのため、実行記録体やRAMの容量をできるだけ節約し、軽量化することが必要となってくる。
ここでは、こうした要求を実現するためにやるべきことを規定する。ただし、部品集の仕様及びABI上の制約を妨げるものではない。

1. 適用可能な最新のD言語仕様に準拠すること。
2. C++及びC言語の言語仕様でD言語が対応できない場合を除き規格準拠を優先する。
3. 基本的な規約は、次による。
    1.  [SEI CERT C Coding Standard](https://wiki.sei.cmu.edu/confluence/spaces/c/pages/87152044/SEI+CERT+C+Coding+Standard)及び[SEI CERT C++ Coding Standard](https://cmu-sei.github.io/secure-coding-standards/sei-cert-cpp-coding-standard)を適用する。C言語版の参考訳は[JPCERT/CC](https://www.jpcert.or.jp/sc-rules/)が公開している。この規約に違反しない限り「Recommendations」規範にも従うこと。D言語の場合、言語仕様により既定で安全化されている部分の規定は適用しない。例えば、「01プリプロセッサ (PRE)」などがある。
    2. 規定の一部を変更した上で、[The D Style](https://dlang.org/dstyle.html)を適用する。これは、Phobosの追加要件も含まれる。
        1. 変更して適用する部分は次の通り。
            - Naming Conventions
                - Keywordsはそのまま適用し、ここに明示がない部分は全て削除。
                - Modules  
                    Module and package names ~~should be all lowercase , and~~ **may** only contain the characters `[a..z][0..9][_]`. This avoids problems when dealing with case-insensitive file systems.
            - Unit Tests  
                As much as practical, all functions will be exercised by unit tests using unittest blocks immediately following the function to be tested. ~~Every path of code should be executed at least once, verified by the code coverage analyzer.~~
        2. Phobosの追加要件で削除する部分は次の通り。
            - Imports  
                - Selective imports should have a space ~~before and~~ after the colon (:) like import std.range: zip
                - ~~Imports should be sorted lexicographically.~~
            - Attributes  
                - ~~should be listed in alphabetical ordering, e.g. const @nogc nothrow pure @safe (the ordering should ignore the leading @).~~
            - Whitespace  
                ~~Put a space after for, foreach, if, while, and version:~~
            - Declarations
                - ~~Invariants should use the expression-based syntax when the equivalent long-form syntax would have a single assert statement. Put a space between invariant and the opening parentheses~~:
    3.  英語による説明文書の書き方は[ASD-STE100](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf)に従う。
    4. 設計及び実装にあたっては、Unix哲学の諸原則に従うこと。作業に着手する前に、その作業と諸原則を照らし合わせて自分を問いただすべきである。
    5. LLMを含むすべての人工知能の使用については、[LLMの適正用途について](https://gist.github.com/hmjfk/d54a2308a68093863ef7462f380157ff)をよく読んだ上で、原理的に結果の参照透過性が保証できると証明された用途に限って用いること。当然、人工知能が不自由な利用許諾であったり、[SaaSS](https://www.gnu.org/philosophy/who-does-that-server-really-serve.ja.html)であったりするものは使用してはならない。
4. 命名規則は単語省略記法やcamel法でも構わないが、一つの機能群や処理のまとまりごとにできるだけ統一すること。たとえば、文字列を表示する関数群や集成体、moduleを単位にするとよい。また、3つ以上の単語を連結したsnake法は使用しないこと。文字数上限は概ね10文字程度とする。
    > [!NOTE]
    > これらの命名規則は、宗教論争になりがちなので統一感を損ねない程度で実装者の好みに任せることにした。また、頭文字を単語として用いる場合は、文字の大小を変更しないほうが見やすいことがある。参考までに、C言語の標準部品集やPOSIXでは、古くから母音省略形、短縮形の単語省略記法が用いられている。
5. 予約済み識別子は、規格上認められた場合であっても、新たに使用しないこと。名前空間や識別子定義範囲の問題が解消できない場合の最終手段として使用することはできる。
6. 特定の場合で使用する命名規則は次の通りである。これは何重にも入り組んだ環境分岐を排除し、可読性を大幅に高めるためである。
    - extern(C++)で名前空間を指定する際、処理系依存などの理由で識別子を経由して文字列を表す必要があるときは、通常`namespace_`から始めること。
    - 特に、SFINAEが型引数として名前修飾に影響する場合、その型引数名はSFINAEとする。
    - 規格上`unspecified`と宣言された箇所のうち、同じmoduleで識別子が衝突する恐れがあるときは`unspecified_`から始めること。
    - 規格上関数名が規定されていても、C側実装によってはmacroなどで名前が変更されていることがある。これを吸収するために**pragma**(**mangle**)を用いる際の手順はつぎのようにする。
        1. **version**文で変更すべき識別子名を文字列定数にする。この際用いる識別子は`symblname_`から始め、その後は対象の関数名とする。
        2. 関数宣言に**pragma**(**mangle**, symblname_*funcname*)を付加する。
7. 識別子の使用にあたっては、処理系の最適化や`@live`属性の適用を考慮し、局所性を高めること。大域変数はABIに影響がない限り、禁止する。
8. できるだけ構造化プログラミングや。関数型プログラミングにおける参照透過性と組込機能の概念（D言語でいう**pure**）を中心とすること。もし、他の考え方で書く場合は、C言語に落とし込めるような最低限の使用にどどめる。どうしても依存せざるを得ない場合は、実行記録体やRAM消費量の大きさに対する影響度合いに注意する。inline関数や**mixin template**の扱いも同様とする。
9. 部品化を促進するため、druntime及びphobosを取り込まないようにすること。C/C++側の名前修飾と一致する純粋な型宣言を取り込む場合は許可される。代表的な例として、`core.stdc` moduleがこれに該当する。そのため、runtimeを必要とする言語機能は一切使用できない。参考までに、使用できないmoduleを次に示す。
        - core.atomic
        - core.bitop
        - core.cpuid
        - core.factory
        - core.runtime
        - core.time
        - core.vararg
10. 移植性を保つため、**asm**文や名前修飾のベタ書き(hard coding)は禁止する。高級言語で表現不能な場合は、LLVM IRを使用すること。
11. GCの代わりとして、所有権`@live`や`@safe`, **scope**、`scope(exit)`など、記憶域を編纂時に管理する言語機能を積極的に活用すること。
12. 可読性を高くするように心がけること。たとえば、一箇所でしか呼び出されない関数や、逆に一つの関数や処理、宣言をまとめて書けるものを繰り返し書いているなど、いちいち回りくどい実装になっていないこと。関数を定義するかどうかの基準は、アセンブリ言語のサブルーチンがなぜ作られたという原点に戻って、同じ処理をまとめるという目的に従うものとする。内部実装は、詳細な実装の構造や仕組みを省略せずに残しておくこと。初見でこの行が何をしているかすぐに理解できるかどうかを基準とする。これに違反するdruntimeでは、環境分岐で同じ宣言や処理を何度も書いている。
13. headerの宣言順は、規格又はlibsに記載された通りとする。そのようになっていない部分が見つかった場合は適時直しておくこと。
14. 説明文書で説明すべき事項は次の通りである。ただし、内部実装の説明を説明文書に載せる必要はない。
    -  元の部品集から移植できるかどうかの可能性
    -  元の部品集からの仕様変更点
    -  mbeddは、次の事項を記載する。
        - 規格書に掲載されているheader中の注釈。
        - 規格上 `see_below`, `unspecified`, `implementation_defined`となっている識別子は、生成後の文書にそのことがわかるようにしておくこと。
        ~~~D
        version(D_Ddoc)
        {
            private alias unspecified = void; 
            ///
            alias size_t = unspecified;
        }
        version(GNU)
            alias size_t = ulong;
        ︙
        ~~~
        - 処理系定義の動作
        - 未規定の動作
        - その他、規格上文章化すべき事項
## 移植の指針
1. D言語の言語仕様上可能な限り、headerで宣言のみを作成して元のC++ sourceを残す。総称型関数の場合は、最適化を容易にするためにCTFE用の実装も用意しておくことが望ましい。必ずではない。この際、@(core.attribute.weak)属性を使用して識別子が衝突しないようにすること。
2. 元のソースがないものは、Dヘッダ側で実装する。
3. 変更がないheaderは、D標準のmoduleで定義されているものを参照する。ただし、moduleの依存関係が解決できないものはすべて再実装し、Dの公式実装が規格に対応しきれていないheaderは、それを取り込んで足りない部分を追加すること。
4. 派生型に対して用いる総称型は、ABIに影響が出ない限り、D形式の総称型でもよい。
5. 部品集内部で使用されるものを除き、C++の名前空間をDの名前空間単位と一致させること。
6. 各実装による分岐を除き、ISAの定義に依存した識別子は、すべてconfig module配下の場所に記述すること。そのpackage.dは、各環境で共通する定義だけを行い、構築装置で取込対象を選択する。


とにかくboostは記録体の数が多く、名前空間の管理も大変である。一つの記録体にまとめたくなるが、そうすると、Dの名前空間とC++の名前空間の使い勝手に相違がでてしまう上、慣習的な上限である`3000`行を超えてしまって可読性が下がる。かと言って本家通りにも管理ができない。という経緯で、記録体の分割はC++の名前空間と同じ単位とするのが最も楽であるという結論に行き着いた。

### mbedd.stdcpp名前空間とstd名前空間の対応
mbedd.stdcpp名前空間とstd名前空間は、言語仕様の問題で不可能なものを除き、対で対応するようになっている。これを実現するための方法は次の通りである。
1. std名前空間及び各実装が使用する名前空間

各moduleで**extern**(**C++** , "std")をつけ、std **module**でpublic import.

2. std配下の標準名前空間

これに該当する例としては、std.chrono, std.numbers などがある。mbedd.stdcppに、対応するheaderのfolderをつくり、その中にstd名前空間用の package.d をおく。

std配下の名前空間は、そのfolderの中に新しいsource fileとして置き、**extern**(**C++** , "std", "*namespace*")をつける。このとき、package.dでは、folder内のmoduleをpublic static importと名前空間aliasを宣言し、C++名前空間と整合性をとる。`std.ranges`名前空間のように、複数のheaderにまたがって同じ名前空間が開閉されるときは、整合性を取らずAPI説明で明確化しておくこと。

3. 入れ子になったstd配下の標準名前空間

これに該当する例としては、std.literalsがある。C++名前空間をDの名前空間にそのまま対応させる。このとき、その名前空間を宣言するC++ headerに対応するmoduleでpublic static importと名前空間aliasを宣言し、C++名前空間と整合性をとる。

それ以外は1. に同じ。

こうすることで、std名前空間とmbedd.stdcpp名前空間を等価にしつつ、`#include`と同様の使い方ができるようになる。
`module std`と`module　mbedd.stdcpp`の対応は、C++ moduleとの互換性を考慮したものである。std名前空間にphobosが取り込まれることは想定されていない。

## 今後の目標
C++側で翻訳時計算可能( **constexpr** など) なものは、D側でもできるだけCTFEが実行できるように配慮する。

## 移植方法
> [!WARNING]
> ここで説明している事項は、言語仕様上まだ完全に確立したものではないものが含まれている。そのため、未定義動作が潜在的に隠れている可能性に注意を喚起する。

この作業団は、ほぼ手動でDheaderを作成している。dppなど自動生成したものでも構わないが、処理が冗長になるなど、可読性と動作性を損ねないようにすること。
### **前処理指令の置き換え**
D言語にはマクロがないため、次のように置き換える。
1. 定数マクロを定義
    ~~~C
    #define MACRO "macro"
    ~~~
    **enum**定数にする。
    ~~~D
    enum MACRO2 = "macro";
    ~~~
2. マクロを定義しているか判定して新しいマクロを定義
    ~~~C
    #ifdef MACRO1
    #deifne MACRO2
    #endif
    ~~~
    基本的に、**static if**と**version**識別子を組み合わせれば対処できることが多い。必要に応じて定数にする。
    ~~~D
    static if(__traits(compiles, MACRO1))
    {
        enum MACRO2;
    }
    ~~~
3. マクロが定義されているか判定して予約語を付加する。
    ~~~C
    #ifdef MACRO1
    #deifne MACRO2 "keyword_A"
    #else
    #define MACRO2 "keyword_B"
    #endif
    ~~~
    **mixin**式中に文字列連結と字句文字列を使えばよい。macro名は定数にする。これなら、C言語では不可能な注釈も入れることができる。
    ~~~D
    static if(__traits(compiles, MACRO1))
    {
        enum MACRO2 = "keyword_A";
    }
    else
    {
        enum MACRO2 = "keyword_B";
    }
    ~~~
4. 関数マクロを定義
    ~~~C
    #define MACRO(A,B)     \
    do{                     \
            ...anything...  \
    }while(0) 
    ~~~
    総称型か挿入総称型にする。基本的には総称型だが、ABIに影響するため場合によっては不向きなこともある。どちらを使うべきかは対象のmacroごとに判断する。
    ~~~D
    mixin template MACRO(alias A, alias B)
    {
        while()
        {
            ...anything...
        }
    }
    ~~~
### **C++言語機能**
### 名前空間
#### 展開名前空間(**inline namespase**)
名前空間を明示する。C++言語仕様による構文糖に過ぎず、ABI上は通常の名前空間と変わらない。
#### **using**宣言
集成体の定義に現れた場合は、「**alias** *member* = *tagname*.*member*;」のようにする。
例:
次のようなC++宣言があったとき、
~~~C++
class ClassA
{
protected:
    int member;
    void Func()
};
class ClassB : ClassA
{
    using ClassA::member;
    using ClassA::Func;
};
~~~
対応するD宣言は次のようになる。
~~~D
extern(C++)
class ClassA
{
protected:
    int member;
    void Func();
};
class ClassB : ClassA
{
    alias member = ClassA.member;
    alias Func = ClassA.Func;
};
~~~
その他の使用例は、D言語仕様module aliasを参照のこと。
### **noexcept**()演算子
stdcpp.supportで実装予定。ただし、条件付き**noexcept**指定子の実装は現実的でない。
### 表現
#### 使用者定義表現
使用者にUFCSを使用させる。
D言語には、C++のような使用者定義表現がない。かんたんなものであれば、再実装してもよいが、複雑であれば、pragma(mangle)でC++ 使用者定義表現の関数を呼び出せるようにする。
次のような例では、秒を表すために、s(int sec){ return sec; } を用意し、UFCSを使って、「30.s」とすれば、C++に近い表現になる。
```D
int s(int s) => s;

void main()
{
    pragma(msg, 60.s);
}
```
ちなみに、このUFCSであれば、数値以外で使用者定義表現が使われたときに字句解析が不能になるというC++固有の問題は発生しない。
### 式
#### **const_cast**\<\> **static_cast**\<\> **reinterpret_cast**\<\> **auto**()
**cast**()に置き換える。
#### **dynamic_cast**
通常のcastに置き換える。
#### **explicit**()演算子及び**explicit**
無視する。**explicit**()演算子は、常に**true**として置き換える。
#### **sizeof** ...演算子
stdcpp.supportで実装済み。
#### ラムダ式のラムダ導入子`[]`
原則として無視してよい。場合によっては、対応が必要になる可能性があるため検討を要する。
#### 畳み込み式
#### coroutine **co_await** **co_return** **co_yield**
stdcpp.supportで実装する。
#### **reflexpr**や^^演算子
stdcpp.supportで実装する。**__traits**の`derivedMembers`、`identifier`もしくは`std.traits. EnumMembers`や`.stringof`プロパティを使えば十分に実装可能である。
### 文
#### **atomic_noexcept**
**scope**文にする。
### 宣言
#### 参照
1. 右辺値(*type* &&) 総称型とauto&&の引数に現れる場合(転送参照)は、 **ref** を使う。  
この場合、わかりにくくなるため「C++側では転送参照されている」ことを以下のように注釈で必ず示すこと。
    ~~~C
    /*
    In the header, for template functions,
    any parameter marked with ref corresponds to a forwarding reference on the C++ side.
    When explicitly instantiating, instantiate it as an lvalue reference.
    */
    ~~~
    多くの場合はこれで対処できるが、それ以外の文脈で`&&`を使用している箇所がある場合は、
    やむを得ず再実装する以外に方法がない。
    または使用者に **__rvalue** を使ってもらうか、右辺値参照を戻り値とする関数に限って**__rvalue**属性をつければ事足りるかもしれない。
2. 左辺値(*type* &) **ref** を使う
#### 関数宣言での以下の宣言
-  削除定義(= **delete**) `@distable`
-  既定定義(= **default**)　削除

既定定義はC++実装側の話であって、D言語のABI上は関係ない。しかし、C++側で明示的に実行文を生成させる必要がある。  
例えば、次のような型があったとする。
~~~C++
#include<compare>

class T
{
public:
    T();
    T(T&&);
    T(const T&);
    ~T();
    
    T& operator=(const T&);
    T& operator=(T&&);
    
    auto operator<=>(const T& other) const;
    bool operator==(const T& other) const;
};
~~~
それを同じ記録子の中でもよいので、実装を言語処理系に生成させる。
~~~C++
T::T() = default;
T::T(const T&) = default;

T& T::operator=(const T&) = default;
T& T::operator=(T&&) = default;
T::~T() = default;

auto T::operator<=>(const T& other) const = default;

bool T::operator==(const T& other) const = default;

void i()
{
    T a, b;
    bool v [[maybe_unused]] = a < b;
    v= a <= b;
    v= a > b;
    v= a >= b;
}
~~~
すでに型側で、既定定義が行われている場合は、既定定義を削除して上記のように型を定義しなおすこと。
そうしないと、特殊な所属関数が生成されない。
#### **decltype(auto)** **auto ref**
#### **concept**指定子
- 概要：総称型の型制約を真偽値で判断する型のようなものである。
- 移植法：**concept**指定子で指定された識別子からなる総称型を作成し、その中に同名識別子を宣言する。

**requires**式については、さきほどの同名識別子に型制約や式を判断する処理を入れる。
しかし、**concept**指定子を介さない匿名**requires**要件は名前修飾に直接現れてしまう。現状、この問題は言語機能の不足により解決不能である。
#### **consteval**
**immutable**型に置き換え。
#### **inline**をもつ変数宣言
**inline**を削除
#### **根拠:**
C++で変数宣言をする際の**inline**は、D言語にとって不要である。なぜなら、宣言と定義は一体化しているからである。
#### **constexpr**と**constinit**をもつ宣言
変数の場合、**immutable**か**enum**に置き換える。関数の場合、削除する。
#### **根拠:**
多くの場合、Dの処理系は自動でCTFEを実行できるか判断してくれる。
#### \[\[ maybe_unused \]\]
#### 使用者定義推定補助(User-defined deduction guides)
D言語には、CTFEがあるため推論可能であることから、この言語機能は無視する。
#### **mutable**
#### 構築子初期化列(*constructor*() : *init*)
通常のメンバに対して直接初期化すること。
#### 関数の戻り値宣言構文(-> *type*)
構文は削除して、旧形式の宣言にする。
#### 初期化子列（`{}`）
C++では、使用者定義型に対して`{}`で初期化するとinitializer_listが推論される。しかし、D言語にはないので手動でこれに書き換える必要がある。
#### 関数の多重定義
通常問題なく呼び出せる。ただし、D言語がC++と決定的で異なるのが、ADLと多重定義解決規則などの名前探索である。これは意味解析の段階で多重定義された関数のうちどれが呼び出されるかという話である。これを念頭において名前解決されるように調節する必要がある。
### 要素指向
C++型は、D言語の仕様書にも書かれている通り、値型であり、Dの構造体(**struct**)と対応する。
ここで、D言語側に様々な制約が生じるため、これを回避する方法について述べる。
特に、Dでは**class**でないとC++相当の言語機能が使うことができない。
#### 構築子と解体子
-  構築子
    - 標準構築子は、言語仕様上の制約で**class**型の場合しかを呼ぶことができない。構造体の場合、将来の言語拡張に備えて**version**(none)をつけてそれを文章化するのが現実的である。
    - それ以外は、D言語側と同じ定義でよい。
- 解体子は、D言語側と同じ定義でよい。

以下は実験結果として残されているものである。

引数なし構築子はC++に合わせて型と同じ識別子とする。これにより、言語処理系を騙して構築子を所属関数にできる。手動で呼んでやる必要がある。  
もし、何かしらの問題が起きた場合、通常の関数としてD言語側の明示的構築子と解体子で包むと解決する可能性がある。この際、構築子は`cThis`、解体子は`dThis`というという識別子にしておき、**pragma(mangle, CppmangledName_string)** で名前修飾させる。
~~~D
// 例
extern(C++,class)
struct foo
{
    // C++ Native ctor
    void foo();
    ///
    // Thin wrapper for D class
    this() nothrow
    {
        cThis();
    }
}
~~~
### 所属関数
C++の所属関数は値型である。そのため、D言語では**struct**型の中で宣言する。
C++側で所属関数と仮想関数が混在する集成型を、Dの宣言へ変換する手法は、現在確立されていない。
#### C++の所属関数とDで対応する派生型の種類早見表
C++側の所属関数の種類は、Dの型分類で対応する。
- 通常の所属関数 - **struct**
- 仮想関数 - **class**
- 純粋仮想関数 - **interface**
- (純粋)仮想関数 - 型本体か所属関数のどれかに**abstract**属性が付いた**class**

#### 仮想関数
**class**型の所属関数として定義する。
#### 純粋仮想関数
**class**型の所属関数に、**abstract**属性を付加する。
C++側で実装のない仮想関数だけが宣言されている場合、Dでは**interface**型として宣言する。

**abstract**属性付き**class**型と**abstract**属性付き関数をもつD **class**の
言語仕様及びC++ ABI上の違いはなく、基本的に型全体が純粋仮想関数になる。

ただし、基底類集体の純粋仮想関数に派生先の既定実装をつけられる機能も持っているため、それを使うと通常の仮想関数のように振る舞う。
#### 型変換演算子
C++側で **operator** *type*(); という宣言をDに直すと、次のようになる。

T opCast(T: *type*);
#### 明示的な型変換演算子の多重定義(**explicit operator** *type*())
**explicit**は無視する。

理由：D言語では、C++よりも暗黙の型変換に厳格な規則があることによる。
#### 類集体の構築子引数推論
明示的に型宣言する。
> [!NOTE]
> **理由:** D言語にはまだ存在しない機能である。
#### 単一継承
#### 多重継承
単純な継承であれば再実装も検討し、**alias this**や**mixin template**などを組み合わせる。
**alias this**の対象とされる識別子名は、`temp`とする。
> [!NOTE]
> C++規格で、「〜から継承する」とあるものは必ず継承すること。
#### 仮想継承
仮想継承とは、継承時に *virtual* が付された類集体のことである。相互運用方法は現在研究中。
#### Friend
予約語を削除する。
### 総称型
#### 総称型引数の**auto**
明示的に宣言する。
#### **理由:**
D言語にはまだ存在しない機能である。
#### **extern template**
#### 総称型を引数にとる総称型
### 型概念（C++型制約）
基本的に**is**式を使いこなせばなんとかなるはずである。
しかし、C++側で**requires**節を伴う型制約がある場合は、これが名前修飾に影響してしまう。現在対応方法を検討中。対応までの仮措置として、C++でこのような総称型を見つけた場合は、次の注釈を加えておくこと。
```C
// The C++ side uses a `requires` clause.
```
#### 単純要件 *expression* ;
**__traits**(compiles, *expression*);
#### 型要件 **typename** *identifier*;
**is**(*identifier*)
#### 複合要件 **typename** { *expression* } **noexcept**<sub>opt</sub> -> *type-constraint*<sub>opt</sub> ;
**__traits**(compiles, *expression*) ?  typeof((*expression*): *type-constraint*) : **false** ;  
**__traits**(compiles, *expression*) ;  
ただし、いまのところ**noexcept**式は表現不能なため、無視する。
### 演算子の多重定義
大域で定義されるものと多重定義できない演算子はその対象となる型のC++類集体~~をD構造体で包んでから、~~（←C++類集体自体で定義できる可能性有。現在検証中。）内でD形式の演算子関数を定義してその中でC++大域演算子関数を呼び出す。~~見つからない所属要素の対策のために **ailas this** で飛ばす。~~。このとき、大域で定義されるC++演算子関数のD側識別子名は、[古いD1形式の演算子多重定義](https://digitalmars.com/d/1.0/operatoroverloading.html)と同じにすること。これは演算子関数としての統一性を保つためである。
ただし、大域で定義される二項演算子は関数の引数がDの形式よりも一つ余分なため呼び出すことが不可能である。この場合は完全に再実装となる。
> 注記：  
> D言語で、多重定義できない演算子の一覧  
>  `.` `,` `&`（アドレス取得）`||` `&&` `new`

> [!TIP]
> 現在参考になる実装は、`mbedd.stdcpp.complex` moduleである。

#### 存在しない演算子`<=>` `new[]` `delete`,`delete[]`の呼び出し
現在対応方法を検討中。
特別な扱いとして、組込演算子`<=>`は、`mbedd.stdcpp.compare` module内で通常の関数により定義される。
## 
### その他
ここに掲げたもの以外はD言語財団の[記事](https://dlang-ja-dokutoku-b1ce36c99e10c96adf0310979a9f2e5f51a136791c046.gitlab.io/articles/)及び[D言語仕様書 C++との連携](https://dlang-ja-dokutoku-b1ce36c99e10c96adf0310979a9f2e5f51a136791c046.gitlab.io/spec/cpp_interface.html)を参照のこと。

## 参考文献
- [cpprefjp](https://cpprefjp.github.io/)
上記の記事を改変して使用。原文の集積記事はクリエイティブ・コモンズ 表示 3.0 国際 パブリック・ライセンスの下で利用が許諾されている。
- [cppreference](https://en.cppreference.com/w/)
上記の記事を改変して使用。原文の集積記事はクリエイティブ・コモンズ 表示-継承 3.0 国際 パブリック・ライセンスの下で利用が許諾されている。
- [The D Style](https://dlang.org/dstyle.html)
### 著作権について
CC BY-SA 4.0以降
