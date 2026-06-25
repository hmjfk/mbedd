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
module src.stdc.tgmath;
static import stdc.math;
static import stdc.complex;

/++
<tgmath.h>の独立実装

識別子の衝突を回避するため、core.stdc.tgmathと同時に取り込まないこと。

In D, not supported _Float*N* and _Decimal*N* types.
Of course _Float*N*/_Decimal*N* version function not implementation.
+/

// since C23
enum __STDC_VERSION_TGMATH_H__ = 202311L;

// work only
version(none)
import core.stdc.tgmath;

///
alias acos = stdc.math.acos;
///
alias acos = stdc.math.acosf;
///
alias acos = stdc.math.acosl;

// @@@DEPRECATED_2.105@@@
deprecated alias acos = stdc.complex.cacos;
deprecated alias acos = stdc.complex.cacosf;
deprecated alias acos = stdc.complex.cacosl;
///
alias acos = stdc.math.acos;
///
alias acos = stdc.math.acosf;
///
alias acos = stdc.math.acosl;

// @@@DEPRECATED_2.105@@@
deprecated alias acos = stdc.complex.cacos;
deprecated alias acos = stdc.complex.cacosf;
deprecated alias acos = stdc.complex.cacosl;

///
alias asin = stdc.math.asin;
///
alias asin = stdc.math.asinf;
///
alias asin = stdc.math.asinl;

// @@@DEPRECATED_2.105@@@
deprecated alias asin = stdc.complex.casin;
deprecated alias asin = stdc.complex.casinf;
deprecated alias asin = stdc.complex.casinl;

///
alias atan = stdc.math.atan;
///
alias atan = stdc.math.atanf;
///
alias atan = stdc.math.atanl;

// @@@DEPRECATED_2.105@@@
deprecated alias atan = stdc.complex.catan;
deprecated alias atan = stdc.complex.catanf;
deprecated alias atan = stdc.complex.catanl;

///
alias atan2 = stdc.math.atan2;
///
alias atan2 = stdc.math.atan2f;
///
alias atan2 = stdc.math.atan2l;

///
alias cos = stdc.math.cos;
///
alias cos = stdc.math.cosf;
///
alias cos = stdc.math.cosl;

// @@@DEPRECATED_2.105@@@
deprecated alias cos = stdc.complex.ccos;
deprecated alias cos = stdc.complex.ccosf;
deprecated alias cos = stdc.complex.ccosl;

///
alias sin = stdc.math.sin;
///
alias sin = stdc.math.sinf;
///
alias sin = stdc.math.sinl;

// @@@DEPRECATED_2.105@@@
deprecated alias csin = stdc.complex.csin;
deprecated alias csin = stdc.complex.csinf;
deprecated alias csin = stdc.complex.csinl;

///
alias tan = stdc.math.tan;
///
alias tan = stdc.math.tanf;
///
alias tan = stdc.math.tanl;

// @@@DEPRECATED_2.105@@@
deprecated alias tan = stdc.complex.ctan;
deprecated alias tan = stdc.complex.ctanf;
deprecated alias tan = stdc.complex.ctanl;

///
alias acospi = stdc.math.acospi;
///
alias acospi = stdc.math.acospif;
///
alias acospi = stdc.math.acospil;

///
alias asinpi = stdc.math.asinpi;
///
alias asinpi = stdc.math.asinpif;
///
alias asinpi = stdc.math.asinpil;

///
alias atanpi = stdc.math.atanpi;
///
alias atanpi = stdc.math.atanpif;
///
alias atanpi = stdc.math.atanpil;

///
alias atan2pi = stdc.math.atan2pi;
///
alias atan2pi = stdc.math.atan2pif;
///
alias atan2pi = stdc.math.atan2pil;

///
alias cospi = stdc.math.cospi;
///
alias cospi = stdc.math.cospif;
///
alias cospi = stdc.math.cospil;

///
alias sinpi = stdc.math.sinpi;
///
alias sinpi = stdc.math.sinpif;
///
alias sinpi = stdc.math.sinpil;

///
alias tanpi = stdc.math.tanpi;
///
alias tanpi = stdc.math.tanpif;
///
alias tanpi = stdc.math.tanpil;

///
alias acosh = stdc.math.acosh;
///
alias acosh = stdc.math.acoshf;
///
alias acosh = stdc.math.acoshl;

// @@@DEPRECATED_2.105@@@
deprecated alias acosh = stdc.complex.cacosh;
deprecated alias acosh = stdc.complex.cacoshf;
deprecated alias acosh = stdc.complex.cacoshl;

///
alias asinh = stdc.math.asinh;
///
alias asinh = stdc.math.asinhf;
///
alias asinh = stdc.math.asinhl;

// @@@DEPRECATED_2.105@@@
deprecated alias asinh = stdc.complex.casinh;
deprecated alias asinh = stdc.complex.casinhf;
deprecated alias asinh = stdc.complex.casinhl;

///
alias atanh = stdc.math.atanh;
///
alias atanh = stdc.math.atanhf;
///
alias atanh = stdc.math.atanhl;

// @@@DEPRECATED_2.105@@@
deprecated alias atanh = stdc.complex.catanh;
deprecated alias atanh = stdc.complex.catanhf;
deprecated alias atanh = stdc.complex.catanhl;

///
alias cosh = stdc.math.cosh;
///
alias cosh = stdc.math.coshf;
///
alias cosh = stdc.math.coshl;

// @@@DEPRECATED_2.105@@@
deprecated alias cosh = stdc.complex.ccosh;
deprecated alias cosh = stdc.complex.ccoshf;
deprecated alias cosh = stdc.complex.ccoshl;

///
alias sinh = stdc.math.sinh;
///
alias sinh = stdc.math.sinhf;
///
alias sinh = stdc.math.sinhl;

// @@@DEPRECATED_2.105@@@
deprecated alias sinh = stdc.complex.csinh;
deprecated alias sinh = stdc.complex.csinhf;
deprecated alias sinh = stdc.complex.csinhl;

///
alias tanh = stdc.math.tanh;
///
alias tanh = stdc.math.tanhf;
///
alias tanh = stdc.math.tanhl;

// @@@DEPRECATED_2.105@@@
deprecated alias tanh = stdc.complex.ctanh;
deprecated alias tanh = stdc.complex.ctanhf;
deprecated alias tanh = stdc.complex.ctanhl;

///
alias exp = stdc.math.exp;
///
alias exp = stdc.math.expf;
///
alias exp = stdc.math.expl;

// @@@DEPRECATED_2.105@@@
deprecated alias exp = stdc.complex.cexp;
deprecated alias exp = stdc.complex.cexpf;
deprecated alias exp = stdc.complex.cexpl;

///
alias exp2 = stdc.math.exp2;
///
alias exp2 = stdc.math.exp2f;
///
alias exp2 = stdc.math.exp2l;
///
alias exp2m1 = stdc.math.exp2m1;
///
alias exp2m1 = stdc.math.exp2m1f;
///
alias exp2m1 = stdc.math.exp2m1l;

///
alias expm1 = stdc.math.expm1;
///
alias expm1 = stdc.math.expm1f;
///
alias expm1 = stdc.math.expm1l;

///
alias frexp = stdc.math.frexp;
///
alias frexp = stdc.math.frexpf;
///
alias frexp = stdc.math.frexpl;

///
alias ilogb = stdc.math.ilogb;
///
alias ilogb = stdc.math.ilogbf;
///
alias ilogb = stdc.math.ilogbl;

///
alias ldexp = stdc.math.ldexp;
///
alias ldexp = stdc.math.ldexpf;
///
alias ldexp = stdc.math.ldexpl;

///
alias log = stdc.math.log;
///
alias log = stdc.math.logf;
///
alias log = stdc.math.logl;

// @@@DEPRECATED_2.105@@@
deprecated alias log = stdc.complex.clog;
deprecated alias log = stdc.complex.clogf;
deprecated alias log = stdc.complex.clogl;

///
alias log10 = stdc.math.log10;
///
alias log10 = stdc.math.log10f;
///
alias log10 = stdc.math.log10l;

///
alias log10p1 = stdc.math.log10p1;
///
alias log10p1 = stdc.math.log10p1f;
///
alias log10p1 = stdc.math.log10p1l;

///
alias log1p = stdc.math.log1p;
///
alias log1p = stdc.math.log1pf;
///
alias log1p = stdc.math.log1pl;

///
alias logp1 = stdc.math.logp1;
///
alias logp1 = stdc.math.logp1f;
///
alias logp1 = stdc.math.logp1l;

///
alias log2 = stdc.math.log2;
///
alias log2 = stdc.math.log2f;
///
alias log2 = stdc.math.log2l;

///
alias log2p1 = stdc.math.log2p1;
///
alias log2p1 = stdc.math.log2p1f;
///
alias log2p1 = stdc.math.log2p1l;

///
alias logb = stdc.math.logb;
///
alias logb = stdc.math.logbf;
///
alias logb = stdc.math.logbl;


///
alias scalbn = stdc.math.scalbn;
///
alias scalbn = stdc.math.scalbnf;
///
alias scalbn = stdc.math.scalbnl;

///
alias scalbln = stdc.math.scalbln;
///
alias scalbln = stdc.math.scalblnf;
///
alias scalbln = stdc.math.scalblnl;

///
alias cbrt = stdc.math.cbrt;
///
alias cbrt = stdc.math.cbrtf;
///
alias cbrt = stdc.math.cbrtl;

///
alias compoundn = stdc.math.compoundn;
///
alias compoundn = stdc.math.compoundnf;
///
alias compoundn = stdc.math.compoundnl;

///
alias fabs = stdc.math.fabs;
///
alias fabs = stdc.math.fabsf;
///
alias fabs = stdc.math.fabsl;

// @@@DEPRECATED_2.105@@@
deprecated alias fabs = stdc.complex.cabs;
deprecated alias fabs = stdc.complex.cabsf;
deprecated alias fabs = stdc.complex.cabsl;

///
alias hypot = stdc.math.hypot;
///
alias hypot = stdc.math.hypotf;
///
alias hypot = stdc.math.hypotl;

///
alias pow = stdc.math.pow;
///
alias pow = stdc.math.powf;
///
alias pow = stdc.math.powl;

// @@@DEPRECATED_2.105@@@
deprecated alias pow = stdc.complex.cpow;
deprecated alias pow = stdc.complex.cpowf;
deprecated alias pow = stdc.complex.cpowl;

///
alias pown = stdc.math.pown;
///
alias pown = stdc.math.pownf;
///
alias pown = stdc.math.pownl;

///
alias powr = stdc.math.powr;
///
alias powr = stdc.math.powrf;
///
alias powr = stdc.math.powrl;

///
alias rootn = stdc.math.rootn;
///
alias rootn = stdc.math.rootnf;
///
alias rootn = stdc.math.rootnl;

///
alias sqrt = stdc.math.sqrt;
///
alias sqrt = stdc.math.sqrtf;
///
alias sqrt = stdc.math.sqrtl;

// @@@DEPRECATED_2.105@@@
deprecated alias sqrt = stdc.complex.csqrt;
deprecated alias sqrt = stdc.complex.csqrtf;
deprecated alias sqrt = stdc.complex.csqrtl;

///
alias rsqrt = stdc.math.rsqrt;
///
alias rsqrt = stdc.math.rsqrtf;
///
alias rsqrt = stdc.math.rsqrtl;

///
alias erf = stdc.math.erf;
///
alias erf = stdc.math.erff;
///
alias erf = stdc.math.erfl;

///
alias erfc = stdc.math.erfc;
///
alias erfc = stdc.math.erfcf;
///
alias erfc = stdc.math.erfcl;

///
alias lgamma = stdc.math.lgamma;
///
alias lgamma = stdc.math.lgammaf;
///
alias lgamma = stdc.math.lgammal;

///
alias tgamma = stdc.math.tgamma;
///
alias tgamma = stdc.math.tgammaf;
///
alias tgamma = stdc.math.tgammal;

///
alias ceil = stdc.math.ceil;
///
alias ceil = stdc.math.ceilf;
///
alias ceil = stdc.math.ceill;

///
alias floor = stdc.math.floor;
///
alias floor = stdc.math.floorf;
///
alias floor = stdc.math.floorl;

///
alias nearbyint = stdc.math.nearbyint;
///
alias nearbyint = stdc.math.nearbyintf;
///
alias nearbyint = stdc.math.nearbyintl;

///
alias rint = stdc.math.rint;
///
alias rint = stdc.math.rintf;
///
alias rint = stdc.math.rintl;

///
alias lrint = stdc.math.lrint;
///
alias lrint = stdc.math.lrintf;
///
alias lrint = stdc.math.lrintl;

///
alias llrint = stdc.math.llrint;
///
alias llrint = stdc.math.llrintf;
///
alias llrint = stdc.math.llrintl;

///
alias round = stdc.math.round;
///
alias round = stdc.math.roundf;
///
alias round = stdc.math.roundl;

///
alias lround = stdc.math.lround;
///
alias lround = stdc.math.lroundf;
///
alias lround = stdc.math.lroundl;

///
alias llroundl = stdc.math.llround;
///
alias llroundl = stdc.math.llroundf;
///
alias llroundl = stdc.math.llroundl;

///
alias roundeven = stdc.math.roundeven;
///
alias roundeven = stdc.math.roundevenf;
///
alias roundeven = stdc.math.roundevenl;

///
alias trunc = stdc.math.trunc;
///
alias trunc = stdc.math.truncf;
///
alias trunc = stdc.math.truncl;

///
alias fromfp = stdc.math.fromfp;
///
alias fromfp = stdc.math.fromfpf;
///
alias fromfp = stdc.math.fromfpl;

///
alias ufromfp = stdc.math.ufromfp;
///
alias ufromfp = stdc.math.ufromfpf;
///
alias ufromfp = stdc.math.ufromfpl;

///
alias fromfpx = stdc.math.fromfpx;
///
alias fromfpx = stdc.math.fromfpxf;
///
alias fromfpx = stdc.math.fromfpxl;

///
alias ufromfpx = stdc.math.ufromfpx;
///
alias ufromfpx = stdc.math.ufromfpxf;
///
alias ufromfpx = stdc.math.ufromfpxl;
///
alias fmod = stdc.math.fmod;
///
alias fmod = stdc.math.fmodf;
///
alias fmod = stdc.math.fmodl;

///
alias remainder = stdc.math.remainder;
///
alias remainder = stdc.math.remainderf;
///
alias remainder = stdc.math.remainderl;

///
alias remquo = stdc.math.remquo;
///
alias remquo = stdc.math.remquof;
///
alias remquo = stdc.math.remquol;

///
alias copysign = stdc.math.copysign;
///
alias copysign = stdc.math.copysignf;
///
alias copysign = stdc.math.copysignl;

/// mbedd extension
///
alias nan = stdc.math.nan;
///
alias nan = stdc.math.nanf;
///
alias nan = stdc.math.nanl;

///
alias nextafter = stdc.math.nextafter;
///
alias nextafter = stdc.math.nextafterf;
///
alias nextafter = stdc.math.nextafterl;

///
alias nexttoward = stdc.math.nexttoward;
///
alias nexttoward = stdc.math.nexttowardf;
///
alias nexttoward = stdc.math.nexttowardl;

///
alias nextup = stdc.math.nextup;
///
alias nextup = stdc.math.nextupf;
///
alias nextup = stdc.math.nextupl;

///
alias nextdown = stdc.math.nextdown;
///
alias nextdown = stdc.math.nextdownf;
///
alias nextdown = stdc.math.nextdownl;

/// mbedd extension
///
alias canonicalize = stdc.math.canonicalize;
///
alias canonicalize = stdc.math.canonicalizef;
///
alias canonicalize = stdc.math.canonicalizel;

///
alias fdim = stdc.math.fdim;
///
alias fdim = stdc.math.fdimf;
///
alias fdim = stdc.math.fdiml;

///
alias fmax = stdc.math.fmax;
///
alias fmax = stdc.math.fmaxf;
///
alias fmax = stdc.math.fmaxl;

///
alias fmin = stdc.math.fmin;
///
alias fmin = stdc.math.fmin;
///
alias fmin = stdc.math.fminl;

///
alias fmaximum = stdc.math.fmaximum;
///
alias fmaximum = stdc.math.fmaximumf;
///
alias fmaximum = stdc.math.fmaximuml;

///
alias fminimum = stdc.math.fminimum;
///
alias fminimum = stdc.math.fminimumf;
///
alias fminimum = stdc.math.fminimuml;

///
alias fmaximum_mag = stdc.math.fmaximum_mag;
///
alias fmaximum_mag = stdc.math.fmaximum_magf;
///
alias fmaximum_mag = stdc.math.fmaximum_magl;

///
alias fminimum_mag = stdc.math.fminimum_mag;
///
alias fminimum_mag = stdc.math.fminimum_magf;
///
alias fminimum_mag = stdc.math.fminimum_magl;

///
alias fmaximum_num = stdc.math.fmaximum_num;
///
alias fmaximum_num = stdc.math.fmaximum_numf;
///
alias fmaximum_num = stdc.math.fmaximum_numl;

///
alias fminimum_num = stdc.math.fminimum_num;
///
alias fminimum_num = stdc.math.fminimum_numf;
///
alias fminimum_num = stdc.math.fminimum_numl;

///
alias fmaximum_mag_num = stdc.math.fmaximum_mag_num;
///
alias fmaximum_mag_num = stdc.math.fmaximum_mag_numf;
///
alias fmaximum_mag_num = stdc.math.fmaximum_mag_numl;

///
alias fminimum_mag_num = stdc.math.fminimum_mag_num;
///
alias fminimum_mag_num = stdc.math.fminimum_mag_numf;
///
alias fminimum_mag_num = stdc.math.fminimum_mag_numl;

///
alias fma = stdc.math.fma;
///
alias fma = stdc.math.fmaf;
///
alias fma = stdc.math.fmal;

///
alias fadd = stdc.math.fadd;
///
alias fadd = stdc.math.faddl;
///
alias fadd = stdc.math.daddl;

///
alias fsub = stdc.math.fsub;
///
alias fsub = stdc.math.fsubl;
///
alias fsub = stdc.math.dsubl;

///
alias fmul = stdc.math.fmul;
///
alias fmul = stdc.math.fmull;
///
alias fmul = stdc.math.dmull;

///
alias fdiv = stdc.math.fdiv;
///
alias fdiv = stdc.math.fdivl;
///
alias fdiv = stdc.math.ddivl;

///
alias ffma = stdc.math.ffma;
///
alias ffma = stdc.math.ffmal;
///
alias ffma = stdc.math.dfmal;

///
alias fsqrt = stdc.math.fsqrt;
///
alias fsqrt = stdc.math.fsqrtl;
///
alias fsqrt = stdc.math.dsqrtl;

// @@@DEPRECATED_2.105@@@
deprecated alias carg = stdc.complex.carg;
deprecated alias carg = stdc.complex.cargf;
deprecated alias carg = stdc.complex.cargl;
deprecated alias cimag = stdc.complex.cimag;
deprecated alias cimag = stdc.complex.cimagf;
deprecated alias cimag = stdc.complex.cimagl;
deprecated alias conj = stdc.complex.conj;
deprecated alias conj = stdc.complex.conjf;
deprecated alias conj = stdc.complex.conjl;
deprecated alias cproj = stdc.complex.cproj;
deprecated alias cproj = stdc.complex.cprojf;
deprecated alias cproj = stdc.complex.cprojl;