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
<math.h>

Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     stdc/math.d
*/
module stdc.math;

public import stdc.cheader.math;

public import stdc.config: c_long;
public import stdc.float_: NAN, INFINITY;

extern(C):
nothrow:
@nogc:
@live:

version(none)
{
    import stdcpp.numbers.numbers;
    import core.stdc.math;
}

///
enum HUGE_VAL = double.infinity;
///
enum HUGE_VALF = float.infinity;
///
enum HUGE_VALL = real.infinity;

///
enum M_E = 2.7182818284590452354;
///
enum M_El = 2.7182818284590452353602874713526625L;
///
enum M_EGAMMA = 0.57721566490153286060;
///
enum M_EGAMMAl = 0.5772156649015328606065120900824024L;
///
enum M_LOG2E = 1.4426950408889634074;
///
enum M_LOG2El = 1.442695040888963407359924681001892137L;
///
enum M_LOG10E = 0.43429448190325182765;
///
enum M_LOG10El = 0.434294481903251827651128918916605082L;
///
enum M_LN2 = 0.69314718055994530942;
///
enum M_LN2l = 0.693147180559945309417232121458176568L;
///
enum M_LN10 = 2.30258509299404568402;
///
enum M_LN10l = 2.302585092994045684017991454684364208L;
///
enum M_PHI = 1.61803398874989484820;
///
enum M_PHIl = 1.618033988749894848204586834365638L;
///
enum M_PI = 3.14159265358979323846;
///
enum M_PIl = 3.141592653589793238462643383279502884L;
///
enum M_PI_2 = 1.57079632679489661923;
///
enum M_PI_2l = 1.570796326794896619231321691639751442L;
///
enum M_PI_4 = 0.78539816339744830962;
///
enum M_PI_4l = 0.785398163397448309615660845819875721L;
///
enum M_1_PI = 0.31830988618379067154;
///           
enum M_1_PIl = 0.318309886183790671537767526745028724L;
///            
enum M_1_SQRTPI = 0.56418958354775628695;
///
enum M_1_SQRTPIl = 0.564189583547756286948079451560772586L;
///
enum M_2_PI = 0.63661977236758134308;
///
enum M_2_PIl = 0.636619772367581343075535053490057448L;
///
enum M_2_SQRTPI = 1.12837916709551257390;
///
enum M_2_SQRTPIl = 1.128379167095512573896158903121545172L;
///                
enum M_SQRT2 = 1.41421356237309504880;
///
enum M_SQRT2l = 1.414213562373095048801688724209698079L;
///
enum M_SQRT3 = 1.73205080756887729353;
///
enum M_SQRT3l = 1.732050807568877293527446341505872367L;
///
enum M_SQRT1_2 = 0.7071067811865475244008443621048490392L;
///
enum M_SQRT1_2l = 0.70710678118654752440;
///
enum M_SQRT1_3 = 0.57735026918962576451;
///
enum M_SQRT1_3l = 0.57735026918962576450914878050195745565L; 

version(D_Ddoc)
{
    private alias real_floating = real;
    ///
    int fpclassify(real_floating x);
    ///
    int iscanonical(real_floating x);
    ///
    int isfinite(real_floating x);
    ///
    int isinf(real_floating x);
    ///
    int isnan(real_floating x);
    ///
    int isnormal(real_floating x);
    ///
    int signbit(real_floating x);
    ///
    int issignaling(real_floating x);
    ///
    int issubnormal(real_floating x);
    ///
    int iszero(real_floating x);
}
///
double acos(double x);
///
float acosf(float x);
///
real acosl(real x);
///
double asin(double x);
///
float asinf(float x);
///
real asinl(real x);
///
double atan(double x);
///
float atanf(float x);
///
real atanl(real x);
///
double atan2(double y, double x);
///
float atan2f(float y, float x);
///
real atan2l(real y, real x);
///
double cos(double x);
///
float cosf(float x);
///
real cosl(real x);
///
double sin(double x);
///
float sinf(float x);
///
real sinl(real x);
///
double tan(double x);
///
float tanf(float x);
///
real tanl(real x);
///
double acospi(double x);
///
float acospif(float x);
///
real acospil(real x);
///
double asinpi(double x);
///
float asinpif(float x);
///
real asinpil(real x);
///
double atanpi(double x);
///
float atanpif(float x);
///
real atanpil(real x);
///
double atan2pi(double y, double x);
///
float atan2pif(float y, float x);
///
real atan2pil(real y, real x);
///
double cospi(double x);
///
float cospif(float x);
///
real cospil(real x);
///
double sinpi(double x);
///
float sinpif(float x);
///
real sinpil(real x);
///
double tanpi(double x);
///
float tanpif(float x);
///
real tanpil(real x);
///
double acosh(double x);
///
float acoshf(float x);
///
real acoshl(real x);
///
double asinh(double x);
///
float asinhf(float x);
///
real asinhl(real x);
///
double atanh(double x);
///
float atanhf(float x);
///
real atanhl(real x);
///
double cosh(double x);
///
float coshf(float x);
///
real coshl(real x);
///
double sinh(double x);
///
float sinhf(float x);
///
real sinhl(real x);
///
double tanh(double x);
///
float tanhf(float x);
///
real tanhl(real x);
///
double exp(double x);
///
float expf(float x);
///
real expl(real x);
///
double exp10(double x);
///
float exp10f(float x);
///
real exp10l(real x);
///
double exp10m1(double x);
///
float exp10m1f(float x);
///
real exp10m1l(real x);
///
double exp2(double x);
///
float exp2f(float x);
///
real exp2l(real x);
///
double exp2m1(double x);
///
float exp2m1f(float x);
///
real exp2m1l(real x);
///
double expm1(double x);
///
float expm1f(float x);
///
real expm1l(real x);
pure
{
    ///
    double frexp(double value, int* p);
    ///
    float frexpf(float value, int* p);
    ///
    real frexpl(real value, int* p);
}
///
int ilogb(double x);
///
int ilogbf(float x);
///
int ilogbl(real x);
///
double ldexp(double x, int p);
///
float ldexpf(float x, int p);
///
real ldexpl(real x, int p);
///
c_long llogb(double x);
///
c_long llogbf(float x);
///
c_long llogbl(real x);
///
double log(double x);
///
float logf(float x);
///
real logl(real x);
///
double log10(double x);
///
float log10f(float x);
///
real log10l(real x);
///
double log10p1(double x);
///
float log10p1f(float x);
///
real log10p1l(real x);
///
double log1p(double x);
///
float log1pf(float x);
///
real log1pl(real x);
///
double logp1(double x);
///
float logp1f(float x);
///
real logp1l(real x);
///
double log2(double x);
///
float log2f(float x);
///
real log2l(real x);
///
double log2p1(double x);
///
float log2p1f(float x);
///
real log2p1l(real x);
///
double logb(double x);
///
float logbf(float x);
///
real logbl(real x);
///
pure
{
    double modf(double value, double* iptr);
    ///
    float modff(float value, float* iptr);
    ///
    real modfl(real value, real* iptr);
}
///
double scalbn(double x, int n);
///
float scalbnf(float x, int n);
///
real scalbnl(real x, int n);
///
double scalbln(double x, c_long n);
///
float scalblnf(float x, c_long n);
///
real scalblnl(real x, c_long n);
///
double cbrt(double x);
///
float cbrtf(float x);
///
real cbrtl(real x);
///
double compoundn(double x, long n);
///
float compoundnf(float x, long n);
///
real compoundnl(real x, long n);
pure
{
    ///
    double fabs(double x);
    ///
    float fabsf(float x);
    ///
    real fabsl(real x);
}
///
double hypot(double x, double y);
///
float hypotf(float x, float y);
///
real hypotl(real x, real y);
///
double pow(double x, double y);
///
float powf(float x, float y);
///
real powl(real x, real y);
///
double pown(double x, long n);
///
float pownf(float x, long n);
///
real pownl(real x, long n);
///
double powr(double y, double x);
///
float powrf(float y, float x);
///
real powrl(real y, real x);
///
double rootn(double x, long n);
///
float rootnf(float x, long n);
///
real rootnl(real x, long n);
///
double rsqrt(double x);
///
float rsqrtf(float x);
///
real rsqrtl(real x);
///
double sqrt(double x);
///
float sqrtf(float x);
///
real sqrtl(real x);
///
double erf(double x);
///
float erff(float x);
///
real erfl(real x);
///
double erfc(double x);
///
float erfcf(float x);
///
real erfcl(real x);
///
double lgamma(double x);
///
float lgammaf(float x);
///
real lgammal(real x);
///
double tgamma(double x);
///
float tgammaf(float x);
///
real tgammal(real x);
pure
{
    ///
    double ceil(double x);
    ///
    float ceilf(float x);
    ///
    real ceill(real x);
    ///
    double floor(double x);
    ///
    float floorf(float x);
    ///
    real floorl(real x);
    ///
    double nearbyint(double x);
    ///
    float nearbyintf(float x);
    ///
    real nearbyintl(real x);
    ///
    double rint(double x);
    ///
    float rintf(float x);
    ///
    real rintl(real x);
}

///
c_long lrint(double x);
///
c_long lrintf(float x);
///
c_long lrintl(real x);
///
long llrint(double x);
///
long llrintf(float x);
///
long llrintl(real x);
pure
{
    ///
    double round(double x);
    ///
    float roundf(float x);
    ///
    real roundl(real x);
}
///
c_long lround(double x);
///
c_long lroundf(float x);
///
c_long lroundl(real x);
///
long llround(double x);
///
long llroundf(float x);
///
long llroundl(real x);
///
double roundeven(double x);
///
float roundevenf(float x);
///
real roundevenl(real x);
pure
{
    ///
    double trunc(double x);
    ///
    float truncf(float x);
    ///
    real truncl(real x);
}
///
double fromfp(double x, int rnd, uint width);
///
float fromfpf(float x, int rnd, uint width);
///
real fromfpl(real x, int rnd, uint width);
///
double ufromfp(double x, int rnd, uint width);
///
float ufromfpf(float x, int rnd, uint width);
///
real ufromfpl(real x, int rnd, uint width);
///
double fromfpx(double x, int rnd, uint width);
///
float fromfpxf(float x, int rnd, uint width);
///
real fromfpxl(real x, int rnd, uint width);
///
double ufromfpx(double x, int rnd, uint width);
///
float ufromfpxf(float x, int rnd, uint width);
///
real ufromfpxl(real x, int rnd, uint width);
///
double fmod(double x, double y);
///
float fmodf(float x, float y);
///
real fmodl(real x, real y);
///
double remainder(double x, double y);
///
float remainderf(float x, float y);
///
real remainderl(real x, real y);
///
double remquo(double x, double y, int* quo);
///
float remquof(float x, float y, int* quo);
///
real remquol(real x, real y, int* quo);
pure
{
    ///
    double copysign(double x, double y);
    ///
    float copysignf(float x, float y);
    ///
    real copysignl(real x, real y);
    ///
    double nan(const(char*) tagp);
    ///
    float nanf(const(char*) tagp);
    ///
    real nanl(const(char*) tagp);
}
///
double nextafter(double x, double y);
///
float nextafterf(float x, float y);
///
real nextafterl(real x, real y);
///
double nexttoward(double x, real y);
///
float nexttowardf(float x, real y);
///
real nexttowardl(real x, real y);
///
double nextup(double x);
///
float nextupf(float x);
///
real nextupl(real x);
///
double nextdown(double x);
///
float nextdownf(float x);
///
real nextdownl(real x);
///
int canonicalize(double* cx, const(double*) x);
///
int canonicalizef(float* cx, const(float*) x);
///
int canonicalizel(real* cx, const(real*) x);
///
double fdim(double x, double y);
///
float fdimf(float x, float y);
///
real fdiml(real x, real y);
pure
{
    ///
    double fmax(double x, double y);
    ///
    float fmaxf(float x, float y);
    ///
    real fmaxl(real x, real y);
    ///
    double fmin(double x, double y);
    ///
    float fminf(float x, float y);
    ///
    real fminl(real x, real y);
}
///
double fmaximum(double x, double y);
///
float fmaximumf(float x, float y);
///
real fmaximuml(real x, real y);
///
double fminimum(double x, double y);
///
float fminimumf(float x, float y);
///
real fminimuml(real x, real y);
///
double fmaximum_mag(double x, double y);
///
float fmaximum_magf(float x, float y);
///
real fmaximum_magl(real x, real y);
///
double fminimum_mag(double x, double y);
///
float fminimum_magf(float x, float y);
///
real fminimum_magl(real x, real y);
///
double fmaximum_num(double x, double y);
///
float fmaximum_numf(float x, float y);
///
real fmaximum_numl(real x, real y);
///
double fminimum_num(double x, double y);
///
float fminimum_numf(float x, float y);
///
real fminimum_numl(real x, real y);
///
double fmaximum_mag_num(double x, double y);
///
float fmaximum_mag_numf(float x, float y);
///
real fmaximum_mag_numl(real x, real y);
///
double fminimum_mag_num(double x, double y);
///
float fminimum_mag_numf(float x, float y);
///
real fminimum_mag_numl(real x, real y);
///
double fma(double x, double y, double z);
///
float fmaf(float x, float y, float z);
///
real fmal(real x, real y, real z);
///
float fadd(double x, double y);
///
float faddl(real x, real y);
///
double daddl(real x, real y);
///
float fsub(double x, double y);
///
float fsubl(real x, real y);
///
double dsubl(real x, real y);
///
float fmul(double x, double y);
///
float fmull(real x, real y);
///
double dmull(real x, real y);
///
float fdiv(double x, double y);
///
float fdivl(real x, real y);
///
double ddivl(real x, real y);
///
float ffma(double x, double y, double z);
///
float ffmal(real x, real y, real z);
///
double dfmal(real x, real y, real z);
///
float fsqrt(double x);
///
float fsqrtl(real x);
///
double dsqrtl(real x);
///

///
double j0(double x);
///
double j1(double x);
///
double jn(int n, double x);

///
double y0(double x);
///
double y1(double x);
///
double yn(int n, double x);

///
extern int signgam;

version(D_Ddoc)
{
    ///
    int isgreater(real_floating x, real_floating y);
    ///
    int isgreaterequal(real_floating x, real_floating y);
    ///
    int isless(real_floating x, real_floating y);
    ///
    int islessequal(real_floating x, real_floating y);
    ///
    int islessgreater(real_floating x, real_floating y);
    ///
    int isunordered(real_floating x, real_floating y);
    ///
    int iseqsig(real_floating x, real_floating y);
}

/// Standards: ISO/IEC 9899:2024 Annex H (ISO/IEC 60559 interchange and extended types)
int totalorder(const(double*) x, const(double*) y);
///
int totalorderf(const(float*) x, const(float*) y);
///
int totalorderl(const(real*) x, const(real*) y);
///
int totalordermag(const(double*) x, const(double*) y);
///
int totalordermagf(const(float*) x, const(float*) y);
///
int totalordermagl(const(real*) x, const(real*) y);
///
double getpayload(const(double*) x);
///
float getpayloadf(const(float*) x);
///
real getpayloadl(const(real*) x);
///
int setpayload(double* res, double pl);
///
int setpayloadf(float* res, float pl);
///
int setpayloadl(real* res, real pl);
///
int setpayloadsig(double* res, double pl);
///
int setpayloadsigf(float* res, float pl);
///
int setpayloadsigl(real* res, real pl);


private
{

    version(usestl)
        enum linkage = q{extern(C++, "std"):};
    else
        enum linkage = q{extern(C):};
        
}

/**
Standards: mathematical special functions for ISO/IEC 24747:2009 And for C++17 or later

Many compiler are implemented is C++17. If version "usestl" is defined, C++ implementation used.
*/
mixin(linkage ~
q{
    ///
    double  assoc_laguerre(uint n, uint m, double x);
    ///
    float   assoc_laguerref(uint n, uint m, float x);
    ///
    real    assoc_laguerrel(uint n, uint m, real x);

    ///
    double  assoc_legendre(uint l, uint m, double x);
    ///
    float   assoc_legendref(uint l, uint m, float x);
    ///
    real    assoc_legendrel(uint l, uint m, real x);

    ///
    double  beta(double x, double y);
    ///
    float   betaf(float x, float y);
    ///
    real    betal(real x, real y);

    ///
    double  comp_ellint_1(double k);
    ///
    float   comp_ellint_1f(float k);
    ///
    real    comp_ellint_1l(real k);

    ///
    double  comp_ellint_2(double k);
    ///
    float   comp_ellint_2f(float k);
    ///
    real    comp_ellint_2l(real k);

    ///
    double  comp_ellint_3(double k, double nu);
    ///
    float   comp_ellint_3f(float k, float nu);
    ///
    real    comp_ellint_3l(real k, real nu);

    ///
    double  cyl_bessel_i(double nu, double x);
    ///
    float   cyl_bessel_if(float nu, float x);
    ///
    real    cyl_bessel_il(real nu, real x);

    ///
    double  cyl_bessel_j(double nu, double x);
    ///
    float   cyl_bessel_jf(float nu, float x);
    ///
    real    cyl_bessel_jl(real nu, real x);

    ///
    double  cyl_bessel_k(double nu, double x);
    ///
    float   cyl_bessel_kf(float nu, float x);
    ///
    real    cyl_bessel_kl(real nu, real x);

    ///
    double  cyl_neumann(double nu, double x);
    ///
    float   cyl_neumannf(float nu, float x);
    ///
    real    cyl_neumannl(real nu, real x);

    ///
    double  ellint_1(double k, double phi);
    ///
    float   ellint_1f(float k, float phi);
    ///
    real    ellint_1l(real k, real phi);

    ///
    double  ellint_2(double k, double phi);
    ///
    float   ellint_2f(float k, float phi);
    ///
    real    ellint_2l(real k, real phi);

    ///
    double  ellint_3(double k, double nu, double phi);
    ///
    float   ellint_3f(float k, float nu, float phi);
    ///
    real    ellint_3l(real k, real nu, real phi);

    ///
    double  expint(double x);
    ///
    float   expintf(float x);
    ///
    real    expintl(real x);

    ///
    double  hermite(uint n, double x);
    ///
    float   hermitef(uint n, float x);
    ///
    real    hermitel(uint n, real x);

    ///
    double  laguerre(uint n, double x);
    ///
    float   laguerref(uint n, float x);
    ///
    real    laguerrel(uint n, real x);

    ///
    double  legendre(uint l, double x);
    ///
    float   legendref(uint l, float x);
    ///
    real    legendrel(uint l, real x);

    ///
    double  riemann_zeta(double x);
    ///
    float   riemann_zetaf(float x);
    ///
    real    realriemann_zetal(real x);

    ///
    double  sph_bessel(uint n, double x);
    ///
    float   sph_besself(uint n, float x);
    ///
    real    sph_bessell(uint n, real x);

    ///
    double  sph_legendre(uint l, uint m, double theta);
    ///
    float   sph_legendref(uint l, uint m, float theta);
    ///
    real    sph_legendrel(uint l, uint m, real theta);

    ///
    double  sph_neumann(uint n, double x);
    ///
    float   sph_neumannf(uint n, float x);
    ///
    real    sph_neumannl(uint n, real x);
});