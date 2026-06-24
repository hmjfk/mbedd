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
module mbedd.stdcpp.numbers.numbers;
import mbedd.stdcpp.concepts: floating_point;

// 桁数は34桁(C言語の_Float128型を想定)
///
enum e_v(T) = cast(T) 2.718281828459045235360287471352662;
///
enum log2e_v(T) = cast(T) 1.442695040888963407359924681001892;
///
enum log10e_v(T) = cast(T) 0.4342944819032518276511289189166051;
///
enum pi_v(T) = cast(T) 3.141592653589793238462643383279503;
///
enum inv_pi_v(T) = cast(T)(1 / pi_v!(real));
///
enum inv_sqrtpi_v(T) = cast(T) 0.5641895835477562869480794515607726;
///
enum ln2_v(T) = cast(T) 0.6931471805599453094172321214581766;
///
enum ln10_v(T) = cast(T) 2.302585092994045684017991454684364;
///
enum sqrt2_v(T) = cast(T) 1.414213562373095048801688724209698;
///
enum sqrt3_v(T) = cast(T) 1.732050807568877293527446341505872;
///
enum inv_sqrt3_v(T) = cast(T)(1 / sqrt3_v!(real));
///
enum egamma_v(T) = cast(T) 0.5772156649015328606065120900824024;
///
enum phi_v(T) = cast(T) 1.618033988749894848204586834365638;

///
template e_v(T) if (floating_point!T)
{ enum e_v = T(2.718281828459045235360287471352662); }
///
template log2e_v(T) if (floating_point!T)
{ enum log2e_v = T(1.442695040888963407359924681001892); }
///
template log10e_v(T) if (floating_point!T)
{ enum log10e_v = T(0.4342944819032518276511289189166051); }
///
template pi_v(T) if (floating_point!T)
{ enum pi_v = T(3.141592653589793238462643383279503); }
///
template inv_pi_v(T) if (floating_point!T)
{ enum inv_pi_v = T(1 / pi_v!(real)); }
///
template inv_sqrtpi_v(T) if (floating_point!T)
{ enum inv_sqrtpi_v = T(0.5641895835477562869480794515607726); }
///
template ln2_v(T) if (floating_point!T)
{ enum ln2_v = T(0.6931471805599453094172321214581766); }
///
template ln10_v(T) if (floating_point!T)
{ enum ln10_v = T(2.302585092994045684017991454684364); }
///
template sqrt2_v(T) if (floating_point!T)
{ enum sqrt2_v = T(1.414213562373095048801688724209698); }
///
template sqrt3_v(T) if (floating_point!T)
{ enum sqrt3_v = T(1.732050807568877293527446341505872); }
///
template inv_sqrt3_v(T) if (floating_point!T)
{ enum inv_sqrt3_v = T(1 / sqrt3_v!(real)); }
///
template egamma_v(T) if (floating_point!T)
{ enum egamma_v = T(0.5772156649015328606065120900824024); }
///
template phi_v(T) if (floating_point!T)
{ enum phi_v = T(1.618033988749894848204586834365638); }

///
enum double e = e_v!double;
///
enum double log2e = log2e_v!double;
///
enum double log10e = log10e_v!double;
///
enum double pi = pi_v!double;
///
enum double inv_pi = inv_pi_v!double;
///
enum double inv_sqrtpi = inv_sqrtpi_v!double;
///
enum double ln2 = ln2_v!double;
///
enum double ln10 = ln10_v!double;
///
enum double sqrt2 = sqrt2_v!double;
///
enum double sqrt3 = sqrt3_v!double;
///
enum double inv_sqrt3 = inv_sqrt3_v!double;
///
enum double egamma = egamma_v!double;
///
enum double phi = phi_v!double;


unittest
{
   ///
   pragma(msg, e,'\n', log2e, '\n', log10e,'\n', pi,'\n', inv_pi,'\n', inv_sqrtpi, '\n', ln2, '\n',ln10 ,'\n',sqrt2);
   ///
   pragma(msg, sqrt3, '\n',inv_sqrt3, '\n', egamma, phi);
}