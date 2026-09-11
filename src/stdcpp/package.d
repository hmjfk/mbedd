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
D言語用C++標準部品集(STL)
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Source:    stdcpp/package.d
Standards: ISO/IEC 14882:2029 (C++29)

mbeddは、各実装の部品集を直接呼び出せるようにすることを目的としている。
将来的には、CTFE専用実装も提供予定である。

druntimeのSTL実装は、全てD言語で移植しようとしているためか、労力が不足してほとんどのものが未実装となっている上、
移植性も低い状態となっている。そんななか、mbeddはC++側実装を積極的に活用し、ABIに無関係な部分は互換性を無視するという方針によって
よって、作業量を大幅に減らすことに成功した。この方針によってより多くのSTLを移植することができるようになった。
移植性に関しても、実装依存の部分は別の場所に定義することにより、実装の複雑さを回避した。

しかし、大きな代償もある。
両者で異なる言語仕様が大きな壁になっているのだ。特に実体の構築と破棄に関しては、言語処理系にしかできないABIや機械語生成が関わってくるため、
一つの部品集だけではどうすることもできない。最大の障壁は、構造体で既定構築子の呼び出しが禁止されていることだ。
こうして、言語仕様上の制約によって移植不能な場合も存在している。

さらに、結合時までにC++総称型を手動で具現化しておかなければならない。

# 使用方法
1. stdcpp.config.stdlibの場所を明示的に指定する。通常、src/stdcpp/config/stdlibの中に入っているので、使用する実装を選択して処理系に引数として与える。この際、dmdやldcの-mv引数相当のものを用いるべきである。必要な場合は、stdcpp.config.stdlib.additionalを上記の代わりに与えて、実装を選択してもよい。

2. C++と共存させるような使い方をしていない場合は、結合時までにD側で使用したC++総称型を具現化する。C++側で明示的具現化宣言を並べて処理系に実体を生成させるようにする。
*/
module stdcpp;
