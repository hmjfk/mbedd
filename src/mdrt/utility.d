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
Copyright: Denkousi 2026 -
Copyright: Copyright Digital Mars 2000 - 2011,
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:   Original is $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
Authors:   Denkousi
Authors:   Walter Bright, Sean Kelly
*/

module mdrt.utility;
import mdrt.coredefs;
import stdc.stddef;

@nogc:
nothrow:
@safe:
@live:

template imported(string moduleName)
{
    mixin("import imported = " ~ moduleName ~ ";");
}

/**
C言語形式の実行時引数をD言語形式に変換する。それ以外の動作は決して行われない。
例えば、実行環境の初期化や引数の解析などである。

return:
    動的記憶域上に配置された実行時引数が返される。使用者は明示的に記憶域を開放する必要がある。
*/

// see also
version(none)
import rt.dmain2;

string[] toDArgs(int argc, char** argv)
{
    import stdc.stdlib: malloc;
    import stdc.string: strlen;
    
    char[][] args = (cast(char[]*) malloc(argc * (char[]).sizeof))[0 .. argc];
 
    if(argc)
        assert(args.ptr);
    scope(exit)
        free(args.ptr);
    
    foreach (size_t i; ref arg; args)
    {
        arg = argv[i][0 .. strlen(argv[i])];
    }
    return cast(string[]) args;
}
