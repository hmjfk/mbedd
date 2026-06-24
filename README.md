# mbedd
組み込み向けのD言語標準ライブラリとDruntime
## 概要
mbeddは[dfruntime](https://github.com/denizzzka/dfruntime)の影響を受け、Sourceの可読性、移植性、規格準拠に重点をおいている。
### 特長
- TS,TRを含めD言語の処理系仕様で許される最大限のC/C++標準ライブラリを統合。ただし、言語仕様の相違によりSTLの一部で仕様変更が加えられている。
- 非OS環境と各種OS環境にも対応。組込開発やGame開発に最適。
- GCに頼らないDruntime `mdrt` 組み込みシステムで敬遠されるこのGCは概念ごと消し去っている。しかし、手動で記憶域を開放しなければならないことに注意が必要である。
- C++ boostのD言語版

標準から仕様変更した部分については、API説明も兼ねてsource中に含まれるDdocで説明している。読みたいheaderから処理系の`-D`引数を使うと、説明書が出力できる。
## 使い方
1. repoをcloneする
    ~~~
    git clone https://github.com/hmjfk/mbedd.git 
    ~~~
2. compilerにpathを通す。詳しくは、[mdrtのREADME](src/mdrt/README.md#既存のphobos及びdruntimeについて)を参照のこと。
## 実装指針
詳しくは、[coding_rules](docs/dev_note/coding_rules.md)を参照のこと。
## 利用許諾
特に断りのない限り、次の通りとする。
#### source code
詳しくは、source codeを直接参照すべきである。
1. 原則としてGNU GPL 3.0以降でその利用を許諾する。
2. mbeddは、libstdc++を改変しているため、GCC RLE v3.0以降が適用される。  
3. 一部は、Boost Softwere Licenceで許諾される。
4. mbeddなど、一部の部品集は宣言のみで実装が含まれていない場合がある。そのような部分は、著作権法上の著作物にあたらないと解釈されていることをここに通知する。
#### 文書
CC BY-SA 4.0以降(LICENCE.DOCSを参照)で利用を許諾する。
GPLに対する例外として、source中のDdocは、CC BY-SA 4.0以降によっても利用することができる。