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
<inttypes.h>
Copyright:  Copyright Sean Kelly 2005 - 2009.
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE).
License:    Original is $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0). 
Authors:    Sean Kelly
Authors:    Denkousi
Source:     Original is $(DRUNTIMESRC core/stdc/inttypes.d)
*/
module stdc.inttypes;
private alias immutable(char)* cstr;

///
enum __STDC_VERSION_INTTYPES_H__ = 202311L;

///
enum cstr PRId8            = "hhd";
///
enum cstr PRId16           = "hd";
///
enum cstr PRId32           = "ld";
///
enum cstr PRId64           = "lld";

///
enum cstr PRIdLEAST8       = "hhd";
///
enum cstr PRIdLEAST16      = "hd";
///
enum cstr PRIdLEAST32      = "ld";
///
enum cstr PRIdLEAST64      = "lld";

///
enum cstr PRIdFAST8        = "hhd";
///
enum cstr PRIdFAST16       = "d";
///
enum cstr PRIdFAST32       = "ld";
///
enum cstr PRIdFAST64       = "lld";

///
enum cstr PRIi8            = "hhi";
///
enum cstr PRIi16           = "hi";
///
enum cstr PRIi32           = "li";
///
enum cstr PRIi64           = "lli";

///
enum cstr PRIiLEAST8       = "hhi";
///
enum cstr PRIiLEAST16      = "hi";
///
enum cstr PRIiLEAST32      = "li";
///
enum cstr PRIiLEAST64      = "lli";

///
enum cstr PRIiFAST8        = "hhi";
///
enum cstr PRIiFAST16       = "i";
///
enum cstr PRIiFAST32       = "li";
///
enum cstr PRIiFAST64       = "lli";

///
enum cstr PRIo8            = "hho";
///
enum cstr PRIo16           = "ho";
///
enum cstr PRIo32           = "lo";
///
enum cstr PRIo64           = "llo";

///
enum cstr PRIoLEAST8       = "hho";
///
enum cstr PRIoLEAST16      = "ho";
///
enum cstr PRIoLEAST32      = "lo";
///
enum cstr PRIoLEAST64      = "llo";

///
enum cstr PRIoFAST8        = "hho";
///
enum cstr PRIoFAST16       = "o";
///
enum cstr PRIoFAST32       = "lo";
///
enum cstr PRIoFAST64       = "llo";

///
enum cstr PRIu8            = "hhu";
///
enum cstr PRIu16           = "hu";
///
enum cstr PRIu32           = "lu";
///
enum cstr PRIu64           = "llu";

///
enum cstr PRIuLEAST8       = "hhu";
///
enum cstr PRIuLEAST16      = "hu";
///
enum cstr PRIuLEAST32      = "lu";
///
enum cstr PRIuLEAST64      = "llu";

///
enum cstr PRIuFAST8        = "hhu";
///
enum cstr PRIuFAST16       = "u";
///
enum cstr PRIuFAST32       = "lu";
///
enum cstr PRIuFAST64       = "llu";

///
enum cstr PRIx8            = "hhx";
///
enum cstr PRIx16           = "hx";
///
enum cstr PRIx32           = "lx";
///
enum cstr PRIx64           = "llx";

///
enum cstr PRIxLEAST8       = "hhx";
///
enum cstr PRIxLEAST16      = "hx";
///
enum cstr PRIxLEAST32      = "lx";
///
enum cstr PRIxLEAST64      = "llx";

///
enum cstr PRIxFAST8        = "hhx";
///
enum cstr PRIxFAST16       = "x";
///
enum cstr PRIxFAST32       = "lx";
///
enum cstr PRIxFAST64       = "llx";

///
enum cstr PRIX8            = "hhX";
///
enum cstr PRIX16           = "hX";
///
enum cstr PRIX32           = "lX";
///
enum cstr PRIX64           = "llX";

///
enum cstr PRIXLEAST8       = "hhX";
///
enum cstr PRIXLEAST16      = "hX";
///
enum cstr PRIXLEAST32      = "lX";
///
enum cstr PRIXLEAST64      = "llX";

///
enum cstr PRIXFAST8        = "hhX";
///
enum cstr PRIXFAST16       = "X";
///
enum cstr PRIXFAST32       = "lX";
///
enum cstr PRIXFAST64       = "llX";

///
enum cstr SCNd8            = "hhd";
///
enum cstr SCNd16           = "hd";
///
enum cstr SCNd32           = "ld";
///
enum cstr SCNd64           = "lld";

///
enum cstr SCNdLEAST8       = "hhd";
///
enum cstr SCNdLEAST16      = "hd";
///
enum cstr SCNdLEAST32      = "ld";
///
enum cstr SCNdLEAST64      = "lld";

///
enum cstr SCNdFAST8        = "hhd";
///
enum cstr SCNdFAST16       = "d";
///
enum cstr SCNdFAST32       = "ld";
///
enum cstr SCNdFAST64       = "lld";

///
enum cstr SCNi8            = "hhd";
///
enum cstr SCNi16           = "hi";
///
enum cstr SCNi32           = "li";
///
enum cstr SCNi64           = "lli";

///
enum cstr SCNiLEAST8       = "hhd";
///
enum cstr SCNiLEAST16      = "hi";
///
enum cstr SCNiLEAST32      = "li";
///
enum cstr SCNiLEAST64      = "lli";

///
enum cstr SCNiFAST8        = "hhd";
///
enum cstr SCNiFAST16       = "i";
///
enum cstr SCNiFAST32       = "li";
///
enum cstr SCNiFAST64       = "lli";

///
enum cstr SCNo8            = "hhd";
///
enum cstr SCNo16           = "ho";
///
enum cstr SCNo32           = "lo";
///
enum cstr SCNo64           = "llo";

///
enum cstr SCNoLEAST8       = "hhd";
///
enum cstr SCNoLEAST16      = "ho";
///
enum cstr SCNoLEAST32      = "lo";
///
enum cstr SCNoLEAST64      = "llo";

///
enum cstr SCNoFAST8        = "hhd";
///
enum cstr SCNoFAST16       = "o";
///
enum cstr SCNoFAST32       = "lo";
///
enum cstr SCNoFAST64       = "llo";

///
enum cstr SCNu8            = "hhd";
///
enum cstr SCNu16           = "hu";
///
enum cstr SCNu32           = "lu";
///
enum cstr SCNu64           = "llu";

///
enum cstr SCNuLEAST8       = "hhd";
///
enum cstr SCNuLEAST16      = "hu";
///
enum cstr SCNuLEAST32      = "lu";
///
enum cstr SCNuLEAST64      = "llu";

///
enum cstr SCNuFAST8        = "hhd";
///
enum cstr SCNuFAST16       = "u";
///
enum cstr SCNuFAST32       = "lu";
///
enum cstr SCNuFAST64       = "llu";

///
enum cstr SCNx8            = "hhd";
///
enum cstr SCNx16           = "hx";
///
enum cstr SCNx32           = "lx";
///
enum cstr SCNx64           = "llx";

///
enum cstr SCNxLEAST8       = "hhd";
///
enum cstr SCNxLEAST16      = "hx";
///
enum cstr SCNxLEAST32      = "lx";
///
enum cstr SCNxLEAST64      = "llx";

///
enum cstr SCNxFAST8        = "hhd";
///
enum cstr SCNxFAST16       = "x";
///
enum cstr SCNxFAST32       = "lx";
///
enum cstr SCNxFAST64       = "llx";

version (D_LP64)
{
    ///
    enum cstr PRIdMAX      = PRId64;
    ///
    enum cstr PRIiMAX      = PRIi64;
    ///
    enum cstr PRIoMAX      = PRIo64;
    ///
    enum cstr PRIuMAX      = PRIu64;
    ///
    enum cstr PRIxMAX      = PRIx64;
    ///
    enum cstr PRIXMAX      = PRIX64;

    ///
    enum cstr SCNdMAX      = SCNd64;
    ///
    enum cstr SCNiMAX      = SCNi64;
    ///
    enum cstr SCNoMAX      = SCNo64;
    ///
    enum cstr SCNuMAX      = SCNu64;
    ///
    enum cstr SCNxMAX      = SCNx64;

    ///
    enum cstr PRIdPTR      = PRId64;
    ///
    enum cstr PRIiPTR      = PRIi64;
    ///
    enum cstr PRIoPTR      = PRIo64;
    ///
    enum cstr PRIuPTR      = PRIu64;
    ///
    enum cstr PRIxPTR      = PRIx64;
    ///
    enum cstr PRIXPTR      = PRIX64;

    ///
    enum cstr SCNdPTR      = SCNd64;
    ///
    enum cstr SCNiPTR      = SCNi64;
    ///
    enum cstr SCNoPTR      = SCNo64;
    ///
    enum cstr SCNuPTR      = SCNu64;
    ///
    enum cstr SCNxPTR      = SCNx64;
}
else
{
    ///
    enum cstr PRIdMAX      = PRId32;
    ///
    enum cstr PRIiMAX      = PRIi32;
    ///
    enum cstr PRIoMAX      = PRIo32;
    ///
    enum cstr PRIuMAX      = PRIu32;
    ///
    enum cstr PRIxMAX      = PRIx32;
    ///
    enum cstr PRIXMAX      = PRIX32;

    ///
    enum cstr SCNdMAX      = SCNd32;
    ///
    enum cstr SCNiMAX      = SCNi32;
    ///
    enum cstr SCNoMAX      = SCNo32;
    ///
    enum cstr SCNuMAX      = SCNu32;
    ///
    enum cstr SCNxMAX      = SCNx32;

    ///
    enum cstr PRIdPTR      = PRId32;
    ///
    enum cstr PRIiPTR      = PRIi32;
    ///
    enum cstr PRIoPTR      = PRIo32;
    ///
    enum cstr PRIuPTR      = PRIu32;
    ///
    enum cstr PRIxPTR      = PRIx32;
    ///
    enum cstr PRIXPTR      = PRIX32;

    ///
    enum cstr SCNdPTR      = SCNd32;
    ///
    enum cstr SCNiPTR      = SCNi32;
    ///
    enum cstr SCNoPTR      = SCNo32;
    ///
    enum cstr SCNuPTR      = SCNu32;
    ///
    enum cstr SCNxPTR      = SCNx32;
}

version(D_Ddoc)
{
    import stdc.cheader.stdint: intmax_t, uintmax_t;
    import stdc.wchar_: wchar_t;

nothrow:
extern(C):
@nogc:
@live:
    ///
    intmax_t  imaxabs(intmax_t j);
    /// since C2y
    uintmax_t  umaxabs(uintmax_t j);
    /// 
    imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom);
    ///
    intmax_t  strtoimax(const scope char* nptr, char** endptr, int base);
    ///
    uintmax_t strtoumax(const scope char* nptr, char** endptr, int base);
    ///
    intmax_t  wcstoimax(const scope wchar_t* nptr, wchar_t** endptr, int base);
    ///
    uintmax_t wcstoumax(const scope wchar_t* nptr, wchar_t** endptr, int base);
}
else
    public import stdc.cheader.inttypes;