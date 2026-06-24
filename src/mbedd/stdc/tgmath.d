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
module src.mbedd.stdc.tgmath;
static import mbedd.stdc.math;
static import mbedd.stdc.complex;

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
alias acos = mbedd.stdc.math.acos;
///
alias acos = mbedd.stdc.math.acosf;
///
alias acos = mbedd.stdc.math.acosl;

// @@@DEPRECATED_2.105@@@
deprecated alias acos = mbedd.stdc.complex.cacos;
deprecated alias acos = mbedd.stdc.complex.cacosf;
deprecated alias acos = mbedd.stdc.complex.cacosl;
///
alias acos = mbedd.stdc.math.acos;
///
alias acos = mbedd.stdc.math.acosf;
///
alias acos = mbedd.stdc.math.acosl;

// @@@DEPRECATED_2.105@@@
deprecated alias acos = mbedd.stdc.complex.cacos;
deprecated alias acos = mbedd.stdc.complex.cacosf;
deprecated alias acos = mbedd.stdc.complex.cacosl;

///
alias asin = mbedd.stdc.math.asin;
///
alias asin = mbedd.stdc.math.asinf;
///
alias asin = mbedd.stdc.math.asinl;

// @@@DEPRECATED_2.105@@@
deprecated alias asin = mbedd.stdc.complex.casin;
deprecated alias asin = mbedd.stdc.complex.casinf;
deprecated alias asin = mbedd.stdc.complex.casinl;

///
alias atan = mbedd.stdc.math.atan;
///
alias atan = mbedd.stdc.math.atanf;
///
alias atan = mbedd.stdc.math.atanl;

// @@@DEPRECATED_2.105@@@
deprecated alias atan = mbedd.stdc.complex.catan;
deprecated alias atan = mbedd.stdc.complex.catanf;
deprecated alias atan = mbedd.stdc.complex.catanl;

///
alias atan2 = mbedd.stdc.math.atan2;
///
alias atan2 = mbedd.stdc.math.atan2f;
///
alias atan2 = mbedd.stdc.math.atan2l;

///
alias cos = mbedd.stdc.math.cos;
///
alias cos = mbedd.stdc.math.cosf;
///
alias cos = mbedd.stdc.math.cosl;

// @@@DEPRECATED_2.105@@@
deprecated alias cos = mbedd.stdc.complex.ccos;
deprecated alias cos = mbedd.stdc.complex.ccosf;
deprecated alias cos = mbedd.stdc.complex.ccosl;

///
alias sin = mbedd.stdc.math.sin;
///
alias sin = mbedd.stdc.math.sinf;
///
alias sin = mbedd.stdc.math.sinl;

// @@@DEPRECATED_2.105@@@
deprecated alias csin = mbedd.stdc.complex.csin;
deprecated alias csin = mbedd.stdc.complex.csinf;
deprecated alias csin = mbedd.stdc.complex.csinl;

///
alias tan = mbedd.stdc.math.tan;
///
alias tan = mbedd.stdc.math.tanf;
///
alias tan = mbedd.stdc.math.tanl;

// @@@DEPRECATED_2.105@@@
deprecated alias tan = mbedd.stdc.complex.ctan;
deprecated alias tan = mbedd.stdc.complex.ctanf;
deprecated alias tan = mbedd.stdc.complex.ctanl;

///
alias acospi = mbedd.stdc.math.acospi;
///
alias acospi = mbedd.stdc.math.acospif;
///
alias acospi = mbedd.stdc.math.acospil;

///
alias asinpi = mbedd.stdc.math.asinpi;
///
alias asinpi = mbedd.stdc.math.asinpif;
///
alias asinpi = mbedd.stdc.math.asinpil;

///
alias atanpi = mbedd.stdc.math.atanpi;
///
alias atanpi = mbedd.stdc.math.atanpif;
///
alias atanpi = mbedd.stdc.math.atanpil;

///
alias atan2pi = mbedd.stdc.math.atan2pi;
///
alias atan2pi = mbedd.stdc.math.atan2pif;
///
alias atan2pi = mbedd.stdc.math.atan2pil;

///
alias cospi = mbedd.stdc.math.cospi;
///
alias cospi = mbedd.stdc.math.cospif;
///
alias cospi = mbedd.stdc.math.cospil;

///
alias sinpi = mbedd.stdc.math.sinpi;
///
alias sinpi = mbedd.stdc.math.sinpif;
///
alias sinpi = mbedd.stdc.math.sinpil;

///
alias tanpi = mbedd.stdc.math.tanpi;
///
alias tanpi = mbedd.stdc.math.tanpif;
///
alias tanpi = mbedd.stdc.math.tanpil;

///
alias acosh = mbedd.stdc.math.acosh;
///
alias acosh = mbedd.stdc.math.acoshf;
///
alias acosh = mbedd.stdc.math.acoshl;

// @@@DEPRECATED_2.105@@@
deprecated alias acosh = mbedd.stdc.complex.cacosh;
deprecated alias acosh = mbedd.stdc.complex.cacoshf;
deprecated alias acosh = mbedd.stdc.complex.cacoshl;

///
alias asinh = mbedd.stdc.math.asinh;
///
alias asinh = mbedd.stdc.math.asinhf;
///
alias asinh = mbedd.stdc.math.asinhl;

// @@@DEPRECATED_2.105@@@
deprecated alias asinh = mbedd.stdc.complex.casinh;
deprecated alias asinh = mbedd.stdc.complex.casinhf;
deprecated alias asinh = mbedd.stdc.complex.casinhl;

///
alias atanh = mbedd.stdc.math.atanh;
///
alias atanh = mbedd.stdc.math.atanhf;
///
alias atanh = mbedd.stdc.math.atanhl;

// @@@DEPRECATED_2.105@@@
deprecated alias atanh = mbedd.stdc.complex.catanh;
deprecated alias atanh = mbedd.stdc.complex.catanhf;
deprecated alias atanh = mbedd.stdc.complex.catanhl;

///
alias cosh = mbedd.stdc.math.cosh;
///
alias cosh = mbedd.stdc.math.coshf;
///
alias cosh = mbedd.stdc.math.coshl;

// @@@DEPRECATED_2.105@@@
deprecated alias cosh = mbedd.stdc.complex.ccosh;
deprecated alias cosh = mbedd.stdc.complex.ccoshf;
deprecated alias cosh = mbedd.stdc.complex.ccoshl;

///
alias sinh = mbedd.stdc.math.sinh;
///
alias sinh = mbedd.stdc.math.sinhf;
///
alias sinh = mbedd.stdc.math.sinhl;

// @@@DEPRECATED_2.105@@@
deprecated alias sinh = mbedd.stdc.complex.csinh;
deprecated alias sinh = mbedd.stdc.complex.csinhf;
deprecated alias sinh = mbedd.stdc.complex.csinhl;

///
alias tanh = mbedd.stdc.math.tanh;
///
alias tanh = mbedd.stdc.math.tanhf;
///
alias tanh = mbedd.stdc.math.tanhl;

// @@@DEPRECATED_2.105@@@
deprecated alias tanh = mbedd.stdc.complex.ctanh;
deprecated alias tanh = mbedd.stdc.complex.ctanhf;
deprecated alias tanh = mbedd.stdc.complex.ctanhl;

///
alias exp = mbedd.stdc.math.exp;
///
alias exp = mbedd.stdc.math.expf;
///
alias exp = mbedd.stdc.math.expl;

// @@@DEPRECATED_2.105@@@
deprecated alias exp = mbedd.stdc.complex.cexp;
deprecated alias exp = mbedd.stdc.complex.cexpf;
deprecated alias exp = mbedd.stdc.complex.cexpl;

///
alias exp2 = mbedd.stdc.math.exp2;
///
alias exp2 = mbedd.stdc.math.exp2f;
///
alias exp2 = mbedd.stdc.math.exp2l;
///
alias exp2m1 = mbedd.stdc.math.exp2m1;
///
alias exp2m1 = mbedd.stdc.math.exp2m1f;
///
alias exp2m1 = mbedd.stdc.math.exp2m1l;

///
alias expm1 = mbedd.stdc.math.expm1;
///
alias expm1 = mbedd.stdc.math.expm1f;
///
alias expm1 = mbedd.stdc.math.expm1l;

///
alias frexp = mbedd.stdc.math.frexp;
///
alias frexp = mbedd.stdc.math.frexpf;
///
alias frexp = mbedd.stdc.math.frexpl;

///
alias ilogb = mbedd.stdc.math.ilogb;
///
alias ilogb = mbedd.stdc.math.ilogbf;
///
alias ilogb = mbedd.stdc.math.ilogbl;

///
alias ldexp = mbedd.stdc.math.ldexp;
///
alias ldexp = mbedd.stdc.math.ldexpf;
///
alias ldexp = mbedd.stdc.math.ldexpl;

///
alias log = mbedd.stdc.math.log;
///
alias log = mbedd.stdc.math.logf;
///
alias log = mbedd.stdc.math.logl;

// @@@DEPRECATED_2.105@@@
deprecated alias log = mbedd.stdc.complex.clog;
deprecated alias log = mbedd.stdc.complex.clogf;
deprecated alias log = mbedd.stdc.complex.clogl;

///
alias log10 = mbedd.stdc.math.log10;
///
alias log10 = mbedd.stdc.math.log10f;
///
alias log10 = mbedd.stdc.math.log10l;

///
alias log10p1 = mbedd.stdc.math.log10p1;
///
alias log10p1 = mbedd.stdc.math.log10p1f;
///
alias log10p1 = mbedd.stdc.math.log10p1l;

///
alias log1p = mbedd.stdc.math.log1p;
///
alias log1p = mbedd.stdc.math.log1pf;
///
alias log1p = mbedd.stdc.math.log1pl;

///
alias logp1 = mbedd.stdc.math.logp1;
///
alias logp1 = mbedd.stdc.math.logp1f;
///
alias logp1 = mbedd.stdc.math.logp1l;

///
alias log2 = mbedd.stdc.math.log2;
///
alias log2 = mbedd.stdc.math.log2f;
///
alias log2 = mbedd.stdc.math.log2l;

///
alias log2p1 = mbedd.stdc.math.log2p1;
///
alias log2p1 = mbedd.stdc.math.log2p1f;
///
alias log2p1 = mbedd.stdc.math.log2p1l;

///
alias logb = mbedd.stdc.math.logb;
///
alias logb = mbedd.stdc.math.logbf;
///
alias logb = mbedd.stdc.math.logbl;


///
alias scalbn = mbedd.stdc.math.scalbn;
///
alias scalbn = mbedd.stdc.math.scalbnf;
///
alias scalbn = mbedd.stdc.math.scalbnl;

///
alias scalbln = mbedd.stdc.math.scalbln;
///
alias scalbln = mbedd.stdc.math.scalblnf;
///
alias scalbln = mbedd.stdc.math.scalblnl;

///
alias cbrt = mbedd.stdc.math.cbrt;
///
alias cbrt = mbedd.stdc.math.cbrtf;
///
alias cbrt = mbedd.stdc.math.cbrtl;

///
alias compoundn = mbedd.stdc.math.compoundn;
///
alias compoundn = mbedd.stdc.math.compoundnf;
///
alias compoundn = mbedd.stdc.math.compoundnl;

///
alias fabs = mbedd.stdc.math.fabs;
///
alias fabs = mbedd.stdc.math.fabsf;
///
alias fabs = mbedd.stdc.math.fabsl;

// @@@DEPRECATED_2.105@@@
deprecated alias fabs = mbedd.stdc.complex.cabs;
deprecated alias fabs = mbedd.stdc.complex.cabsf;
deprecated alias fabs = mbedd.stdc.complex.cabsl;

///
alias hypot = mbedd.stdc.math.hypot;
///
alias hypot = mbedd.stdc.math.hypotf;
///
alias hypot = mbedd.stdc.math.hypotl;

///
alias pow = mbedd.stdc.math.pow;
///
alias pow = mbedd.stdc.math.powf;
///
alias pow = mbedd.stdc.math.powl;

// @@@DEPRECATED_2.105@@@
deprecated alias pow = mbedd.stdc.complex.cpow;
deprecated alias pow = mbedd.stdc.complex.cpowf;
deprecated alias pow = mbedd.stdc.complex.cpowl;

///
alias pown = mbedd.stdc.math.pown;
///
alias pown = mbedd.stdc.math.pownf;
///
alias pown = mbedd.stdc.math.pownl;

///
alias powr = mbedd.stdc.math.powr;
///
alias powr = mbedd.stdc.math.powrf;
///
alias powr = mbedd.stdc.math.powrl;

///
alias rootn = mbedd.stdc.math.rootn;
///
alias rootn = mbedd.stdc.math.rootnf;
///
alias rootn = mbedd.stdc.math.rootnl;

///
alias sqrt = mbedd.stdc.math.sqrt;
///
alias sqrt = mbedd.stdc.math.sqrtf;
///
alias sqrt = mbedd.stdc.math.sqrtl;

// @@@DEPRECATED_2.105@@@
deprecated alias sqrt = mbedd.stdc.complex.csqrt;
deprecated alias sqrt = mbedd.stdc.complex.csqrtf;
deprecated alias sqrt = mbedd.stdc.complex.csqrtl;

///
alias rsqrt = mbedd.stdc.math.rsqrt;
///
alias rsqrt = mbedd.stdc.math.rsqrtf;
///
alias rsqrt = mbedd.stdc.math.rsqrtl;

///
alias erf = mbedd.stdc.math.erf;
///
alias erf = mbedd.stdc.math.erff;
///
alias erf = mbedd.stdc.math.erfl;

///
alias erfc = mbedd.stdc.math.erfc;
///
alias erfc = mbedd.stdc.math.erfcf;
///
alias erfc = mbedd.stdc.math.erfcl;

///
alias lgamma = mbedd.stdc.math.lgamma;
///
alias lgamma = mbedd.stdc.math.lgammaf;
///
alias lgamma = mbedd.stdc.math.lgammal;

///
alias tgamma = mbedd.stdc.math.tgamma;
///
alias tgamma = mbedd.stdc.math.tgammaf;
///
alias tgamma = mbedd.stdc.math.tgammal;

///
alias ceil = mbedd.stdc.math.ceil;
///
alias ceil = mbedd.stdc.math.ceilf;
///
alias ceil = mbedd.stdc.math.ceill;

///
alias floor = mbedd.stdc.math.floor;
///
alias floor = mbedd.stdc.math.floorf;
///
alias floor = mbedd.stdc.math.floorl;

///
alias nearbyint = mbedd.stdc.math.nearbyint;
///
alias nearbyint = mbedd.stdc.math.nearbyintf;
///
alias nearbyint = mbedd.stdc.math.nearbyintl;

///
alias rint = mbedd.stdc.math.rint;
///
alias rint = mbedd.stdc.math.rintf;
///
alias rint = mbedd.stdc.math.rintl;

///
alias lrint = mbedd.stdc.math.lrint;
///
alias lrint = mbedd.stdc.math.lrintf;
///
alias lrint = mbedd.stdc.math.lrintl;

///
alias llrint = mbedd.stdc.math.llrint;
///
alias llrint = mbedd.stdc.math.llrintf;
///
alias llrint = mbedd.stdc.math.llrintl;

///
alias round = mbedd.stdc.math.round;
///
alias round = mbedd.stdc.math.roundf;
///
alias round = mbedd.stdc.math.roundl;

///
alias lround = mbedd.stdc.math.lround;
///
alias lround = mbedd.stdc.math.lroundf;
///
alias lround = mbedd.stdc.math.lroundl;

///
alias llroundl = mbedd.stdc.math.llround;
///
alias llroundl = mbedd.stdc.math.llroundf;
///
alias llroundl = mbedd.stdc.math.llroundl;

///
alias roundeven = mbedd.stdc.math.roundeven;
///
alias roundeven = mbedd.stdc.math.roundevenf;
///
alias roundeven = mbedd.stdc.math.roundevenl;

///
alias trunc = mbedd.stdc.math.trunc;
///
alias trunc = mbedd.stdc.math.truncf;
///
alias trunc = mbedd.stdc.math.truncl;

///
alias fromfp = mbedd.stdc.math.fromfp;
///
alias fromfp = mbedd.stdc.math.fromfpf;
///
alias fromfp = mbedd.stdc.math.fromfpl;

///
alias ufromfp = mbedd.stdc.math.ufromfp;
///
alias ufromfp = mbedd.stdc.math.ufromfpf;
///
alias ufromfp = mbedd.stdc.math.ufromfpl;

///
alias fromfpx = mbedd.stdc.math.fromfpx;
///
alias fromfpx = mbedd.stdc.math.fromfpxf;
///
alias fromfpx = mbedd.stdc.math.fromfpxl;

///
alias ufromfpx = mbedd.stdc.math.ufromfpx;
///
alias ufromfpx = mbedd.stdc.math.ufromfpxf;
///
alias ufromfpx = mbedd.stdc.math.ufromfpxl;
///
alias fmod = mbedd.stdc.math.fmod;
///
alias fmod = mbedd.stdc.math.fmodf;
///
alias fmod = mbedd.stdc.math.fmodl;

///
alias remainder = mbedd.stdc.math.remainder;
///
alias remainder = mbedd.stdc.math.remainderf;
///
alias remainder = mbedd.stdc.math.remainderl;

///
alias remquo = mbedd.stdc.math.remquo;
///
alias remquo = mbedd.stdc.math.remquof;
///
alias remquo = mbedd.stdc.math.remquol;

///
alias copysign = mbedd.stdc.math.copysign;
///
alias copysign = mbedd.stdc.math.copysignf;
///
alias copysign = mbedd.stdc.math.copysignl;

/// mbedd extension
///
alias nan = mbedd.stdc.math.nan;
///
alias nan = mbedd.stdc.math.nanf;
///
alias nan = mbedd.stdc.math.nanl;

///
alias nextafter = mbedd.stdc.math.nextafter;
///
alias nextafter = mbedd.stdc.math.nextafterf;
///
alias nextafter = mbedd.stdc.math.nextafterl;

///
alias nexttoward = mbedd.stdc.math.nexttoward;
///
alias nexttoward = mbedd.stdc.math.nexttowardf;
///
alias nexttoward = mbedd.stdc.math.nexttowardl;

///
alias nextup = mbedd.stdc.math.nextup;
///
alias nextup = mbedd.stdc.math.nextupf;
///
alias nextup = mbedd.stdc.math.nextupl;

///
alias nextdown = mbedd.stdc.math.nextdown;
///
alias nextdown = mbedd.stdc.math.nextdownf;
///
alias nextdown = mbedd.stdc.math.nextdownl;

/// mbedd extension
///
alias canonicalize = mbedd.stdc.math.canonicalize;
///
alias canonicalize = mbedd.stdc.math.canonicalizef;
///
alias canonicalize = mbedd.stdc.math.canonicalizel;

///
alias fdim = mbedd.stdc.math.fdim;
///
alias fdim = mbedd.stdc.math.fdimf;
///
alias fdim = mbedd.stdc.math.fdiml;

///
alias fmax = mbedd.stdc.math.fmax;
///
alias fmax = mbedd.stdc.math.fmaxf;
///
alias fmax = mbedd.stdc.math.fmaxl;

///
alias fmin = mbedd.stdc.math.fmin;
///
alias fmin = mbedd.stdc.math.fmin;
///
alias fmin = mbedd.stdc.math.fminl;

///
alias fmaximum = mbedd.stdc.math.fmaximum;
///
alias fmaximum = mbedd.stdc.math.fmaximumf;
///
alias fmaximum = mbedd.stdc.math.fmaximuml;

///
alias fminimum = mbedd.stdc.math.fminimum;
///
alias fminimum = mbedd.stdc.math.fminimumf;
///
alias fminimum = mbedd.stdc.math.fminimuml;

///
alias fmaximum_mag = mbedd.stdc.math.fmaximum_mag;
///
alias fmaximum_mag = mbedd.stdc.math.fmaximum_magf;
///
alias fmaximum_mag = mbedd.stdc.math.fmaximum_magl;

///
alias fminimum_mag = mbedd.stdc.math.fminimum_mag;
///
alias fminimum_mag = mbedd.stdc.math.fminimum_magf;
///
alias fminimum_mag = mbedd.stdc.math.fminimum_magl;

///
alias fmaximum_num = mbedd.stdc.math.fmaximum_num;
///
alias fmaximum_num = mbedd.stdc.math.fmaximum_numf;
///
alias fmaximum_num = mbedd.stdc.math.fmaximum_numl;

///
alias fminimum_num = mbedd.stdc.math.fminimum_num;
///
alias fminimum_num = mbedd.stdc.math.fminimum_numf;
///
alias fminimum_num = mbedd.stdc.math.fminimum_numl;

///
alias fmaximum_mag_num = mbedd.stdc.math.fmaximum_mag_num;
///
alias fmaximum_mag_num = mbedd.stdc.math.fmaximum_mag_numf;
///
alias fmaximum_mag_num = mbedd.stdc.math.fmaximum_mag_numl;

///
alias fminimum_mag_num = mbedd.stdc.math.fminimum_mag_num;
///
alias fminimum_mag_num = mbedd.stdc.math.fminimum_mag_numf;
///
alias fminimum_mag_num = mbedd.stdc.math.fminimum_mag_numl;

///
alias fma = mbedd.stdc.math.fma;
///
alias fma = mbedd.stdc.math.fmaf;
///
alias fma = mbedd.stdc.math.fmal;

///
alias fadd = mbedd.stdc.math.fadd;
///
alias fadd = mbedd.stdc.math.faddl;
///
alias fadd = mbedd.stdc.math.daddl;

///
alias fsub = mbedd.stdc.math.fsub;
///
alias fsub = mbedd.stdc.math.fsubl;
///
alias fsub = mbedd.stdc.math.dsubl;

///
alias fmul = mbedd.stdc.math.fmul;
///
alias fmul = mbedd.stdc.math.fmull;
///
alias fmul = mbedd.stdc.math.dmull;

///
alias fdiv = mbedd.stdc.math.fdiv;
///
alias fdiv = mbedd.stdc.math.fdivl;
///
alias fdiv = mbedd.stdc.math.ddivl;

///
alias ffma = mbedd.stdc.math.ffma;
///
alias ffma = mbedd.stdc.math.ffmal;
///
alias ffma = mbedd.stdc.math.dfmal;

///
alias fsqrt = mbedd.stdc.math.fsqrt;
///
alias fsqrt = mbedd.stdc.math.fsqrtl;
///
alias fsqrt = mbedd.stdc.math.dsqrtl;

// @@@DEPRECATED_2.105@@@
deprecated alias carg = mbedd.stdc.complex.carg;
deprecated alias carg = mbedd.stdc.complex.cargf;
deprecated alias carg = mbedd.stdc.complex.cargl;
deprecated alias cimag = mbedd.stdc.complex.cimag;
deprecated alias cimag = mbedd.stdc.complex.cimagf;
deprecated alias cimag = mbedd.stdc.complex.cimagl;
deprecated alias conj = mbedd.stdc.complex.conj;
deprecated alias conj = mbedd.stdc.complex.conjf;
deprecated alias conj = mbedd.stdc.complex.conjl;
deprecated alias cproj = mbedd.stdc.complex.cproj;
deprecated alias cproj = mbedd.stdc.complex.cprojf;
deprecated alias cproj = mbedd.stdc.complex.cprojl;