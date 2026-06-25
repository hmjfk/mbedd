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
D言語用に設計されたC言語標準部品集の安全な実装
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+). Original is $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   Denkousi
Source: 
これは、Dの言語機能を最大限活用してPOSIXを含むC言語標準部品集の関数群を
- CTFE完全対応
- 型安全
- 境界安全
- 記憶域安全
- 純粋関数化
した実装である。使用者側から見た関数形式の互換性は保たれているが、識別子の衝突防止のためにD形式の名前修飾を使用している。もちろん重厚なDruntimeは一切使用していないので軽快に動作する。
既存にない特長として、`printf`や`memset`といった関数が総称型化されていることにある。特に指示型や可変長引数を経由して元の型が消えてしまっている関数ではこの部品集の威力を発揮する。
また、本来配列操作を想定しているものは、直接配列としてを扱う。当然のようにすべての関数は**@safe**がつけられており、安全な操作が可能である。
*/
module stdc.safe;