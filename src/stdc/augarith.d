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
/++
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html,  GCC RLE)
Source:    mbedd/stdc/augarith.d
Standards: ISO/IEC TS 18661-4:2025

In D, not supported _Float*N* and _Decimal*N* types.
Of course _Float*N*/_Decimal*N* version function not implementation. 
+/
module stdc.augarith;

extern (C):
nothrow:
@nogc:

///
enum __STDC_IEC_60559_FUNCS_AUGMENTED_ARITHMETIC__ =  202401L;


/// struct daug_t
struct daug_t
{
    ///
    double h;
    ///
    double t;
}
///
struct faug_t
{
    ///
    float h;
    ///    
    float t;
}
///
struct ldaug_t
{

    ///
    real h;
    ///
    real t;
}


/// aug_add functions
daug_t aug_add(double x, double y);
/// ditto
faug_t aug_addf(float x, float y);
/// ditto
ldaug_t aug_addl(real x, real y);

/// aug_sub functions
daug_t aug_sub(double x, double y);
/// ditto
faug_t aug_subf(float x, float y);
/// ditto
ldaug_t aug_subl(real x, real y);

/// aug_mul functions
daug_t aug_mul(double x, double y);
/// ditto
faug_t aug_mulf(float x, float y);
/// ditto
ldaug_t aug_mull(real x, real y);