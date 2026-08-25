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
module stdc;
/**
D言語用C標準部品集
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Source:    stdc/package.d
Standards: ISO/IEC 9899:2024, IEEE Std 1003.1™-2024(POSIX.1-2024)

mbeddでは、各実装の部品集を直接呼び出せるようにすることを目的としている。
将来的には、CTFE専用実装も提供予定である。

このmoduleを取り込むと、すべての標準C部品集が利用できる。
POSIX部品集については、未対応の環境も存在するため、このmoduleによる一括取り込みには対応していない。

加えて、POSIXに未対応の環境でもPOSIXのlibc拡張が使用できるようになっている。
しかし、POSIXに規定されている関数群を結合しようとすると問題が発生する。
その場合は、環境分岐でPosixの関数を呼び出さないようにするか、Posix移植部品集の[Gnulib](https://www.gnu.org/software/gnulib)を構築して結合するとよい。

druntimeのlibc実装は、全てD言語で移植しようとしているため、移植性が低い状態となっている。
さらに、複数の翻訳単位で異なるCの処理系を使用するという間違った想定で実装されている。これにより、処理系依存の部分で齟齬が生じることにより未定義動作を生じさせる可能性が高い。
そこで、本部品集ではそのような前提を捨て、C言語の処理系をImportCのみに限定してC言語のheaderを取り込むことで、
この問題を単純に解決した。こうすることで、C言語と全く同じ環境を再現しやすくなるのだ。
このため、本部品集からlibcの関数を使うためには対応するheaderの存在が必須である。

## 対応規格
すべて最新規格に合わせるよう実装されている。規格改訂案が公表され次第、部品集も随時更新される。
したがって、規格の下位互換性はほとんど考慮されていないことに注意を要する。
#### ISO/IEC 9899:2024 (C23)
以下の拡張にも対応する予定。
- 附属書F, Gのうち、D言語側で部品集として対応可能な部分
- 附属書K
#### ISO/IEC TS 18661-4:2025
D言語側で部品集として対応可能な部分だけを実装している。
#### ISO/IEC TR 24731-2:2010
####  ISO/IEC 9945:2024, IEEE 1003.1-2024 (POSIX.1)
XSIにも対応予定
#### UNIX SUS (UNIX規格)
任意実装となっているRBACにも対応する予定。
*/
public import stdc.augarith;
public import stdc.ctype;
public import stdc.complex;
public import stdc.fenv;
public import stdc.float_;
public import stdc.inttypes;
public import stdc.locale;
public import stdc.math;
public import stdc.signal;
version(none)
public import stdc.stdarg;
public import stdc.stdatomic;
public import stdc.stdbit;
public import stdc.stddef;
public import stdc.stdckdint;
public import stdc.stdint;
public import stdc.stdio;
public import stdc.stdlib;
public import stdc.stdmchar;
public import stdc.string;
public import stdc.tgmath;
public import stdc.time;
public import stdc.uchar;
public import stdc.wchar_;
public import stdc.wctype;