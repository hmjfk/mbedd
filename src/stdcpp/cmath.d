/*
    mbedd - 組み込みシステム向けのD言語標準ライブラリとDruntime

    Copyright (C) 2025 - Denkousi
    Copyright (C) 1997-2026 Free Software Foundation, Inc.

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
Copyright:  Copyright Denkousi 2025-
Copyright:  1997-2026 Free Software Foundation, Inc.
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
License:    Original is Apache-2.0 WITH LLVM-exception
Authors:    Denkousi
Source:     Original is https://gcc.gnu.org/cgit/gcc/plain/libstdc++-v3/include/c_global/cmath
Source:     Original is https://raw.githubusercontent.com/llvm/llvm-project/refs/heads/main/libcxx/include/cmath

*/
module stdcpp.cmath;

public import stdc.math;
public import stdc.tgmath;
public import stdc.stdlib;

extern(C++, "std")
{
    /// [c.math.abs], absolute values
    /// ditto
    alias abs = stdc.stdlib.labs;
    /// ditto
    alias abs = stdc.stdlib.llabs;
    /// ditto
    alias abs = stdc.tgmath.fabs;

    /// for C2y (mbedd extension)
    alias uabs = stdc.stdlib.ulabs;
    /// ditto
    alias uabs = stdc.stdlib.ullabs;

    /// [c.math.hypot3], three-dimensional hypotenuse
    T hypot(T)(T x, T y, T z)
    if(__traits(isFloating, T))
    {
        x = fabs(x);
        y = fabs(y);
        z = fabs(z);

        if (const T a = x < y ? /* true */ (y < z ? z : y) : /* false */ (x < z ? z : x))

            return a * sqrt((x / a) * (x / a) + (y / a) * (y / a) + (z / a) * (z / a));
        else
            return T.init;
    }
    
    /// [c.math.lerp], linear interpolation
    T lerp(T)(T a, T b, T t)
    if(__traits(isFloating, T))
    {
        if ((a <= 0 && b >= 0) || (a >= 0 && b <= 0))
            return t * b + (1 - t) * a;

        if (t == 1)
            return b;

        auto const x = a + t * (b - a);
        if ((t > 1) == (b > a))
            return b < x ? x : b;
        else
            return x < b ? x : b;
    }
    
    /// [sf.cmath], mathematical special functions
    /// [sf.cmath.assoc.laguerre], associated Laguerre polynomials
    alias assoc_laguerre = stdc.math.assoc_laguerre;
    /// ditto
    alias assoc_laguerre = stdc.math.assoc_laguerref;
    /// ditto
    alias assoc_laguerre = stdc.math.assoc_laguerrel;
    
    /// [sf.cmath.assoc.legendre], associated Legendre functions
    alias assoc_legendre = stdc.math.assoc_legendre;
    /// ditto
    alias assoc_legendre = stdc.math.assoc_legendref;
    /// ditto
    alias assoc_legendre = stdc.math.assoc_legendrel;

    /// [sf.cmath.beta], beta function
    alias beta = stdc.math.beta;
    /// ditto
    alias beta = stdc.math.betaf;
    /// ditto
    alias beta = stdc.math.betal;
    
    /// [sf.cmath.comp.ellint.1], complete elliptic integral of the first kind
    alias comp_ellint_1 = stdc.math.comp_ellint_1;
    /// ditto
    alias comp_ellint_1 = stdc.math.comp_ellint_1f;
    /// ditto
    alias comp_ellint_1 = stdc.math.comp_ellint_1l;
    
    /// [sf.cmath.comp.ellint.2], complete elliptic integral of the second kind
    alias comp_ellint_2 = stdc.math.comp_ellint_2;
    /// ditto
    alias comp_ellint_2 = stdc.math.comp_ellint_2f;
    /// ditto
    alias comp_ellint_2 = stdc.math.comp_ellint_2l;

    /// [sf.cmath.comp.ellint.3], complete elliptic integral of the third kind
    alias comp_ellint_3 = stdc.math.comp_ellint_3;
    /// ditto
    alias comp_ellint_3 = stdc.math.comp_ellint_3f;
    /// ditto
    alias comp_ellint_3 = stdc.math.comp_ellint_3l;

    /// [sf.cmath.cyl.bessel.i], regular modified cylindrical Bessel functions
    alias cyl_bessel_i = stdc.math.cyl_bessel_i;
    /// ditto
    alias cyl_bessel_i = stdc.math.cyl_bessel_if;
    /// ditto
    alias cyl_bessel_i = stdc.math.cyl_bessel_il;

    /// [sf.cmath.cyl.bessel.j], cylindrical Bessel functions of the first kind
    alias cyl_bessel_j = stdc.math.cyl_bessel_j;
    /// ditto
    alias assoc_legendre = stdc.math.cyl_bessel_jf;
    /// ditto
    alias assoc_legendre = stdc.math.cyl_bessel_jl;

    /// [sf.cmath.cyl.bessel.k], irregular modified cylindrical Bessel functions
    alias cyl_bessel_k = stdc.math.cyl_bessel_k;
    /// ditto
    alias cyl_bessel_k = stdc.math.cyl_bessel_kf;
    /// ditto
    alias cyl_bessel_k = stdc.math.cyl_bessel_kl;
    
    /// [sf.cmath.cyl.neumann], cylindrical Neumann functions
    /// cylindrical Bessel functions of the second kind
    alias cyl_neumann = stdc.math.cyl_neumann;
    /// ditto
    alias cyl_neumann = stdc.math.cyl_neumannf;
    /// ditto
    alias cyl_neumann = stdc.math.cyl_neumannl;

    /// [sf.cmath.ellint.1], incomplete elliptic integral of the first kind
    alias ellint_1 = stdc.math.ellint_1;
    /// ditto
    alias ellint_1 = stdc.math.ellint_1f;
    /// ditto
    alias ellint_1 = stdc.math.ellint_1l;

    /// [sf.cmath.ellint.2], incomplete elliptic integral of the second kind
    alias ellint_2 = stdc.math.ellint_2;
    /// ditto
    alias ellint_2 = stdc.math.ellint_2f;
    /// ditto
    alias ellint_2 = stdc.math.ellint_2l;

    /// [sf.cmath.ellint.3], incomplete elliptic integral of the third kind
    alias ellint_3 = stdc.math.ellint_3;
    /// ditto
    alias ellint_3 = stdc.math.ellint_3f;
    /// ditto
    alias ellint_3 = stdc.math.ellint_3l;

    /// [sf.cmath.expint], exponential integral
    alias expint = stdc.math.expint;
    /// ditto
    alias expint = stdc.math.expintf;
    /// ditto
    alias expint = stdc.math.expintl;

    /// [sf.cmath.hermite], Hermite polynomials
    alias hermite = stdc.math.hermite;
    /// ditto
    alias hermite = stdc.math.hermitef;
    /// ditto
    alias hermite = stdc.math.hermitel;

    /// [sf.cmath.laguerre], Laguerre polynomials
    alias laguerre = stdc.math.laguerre;
    /// ditto
    alias laguerre = stdc.math.laguerref;
    /// ditto
    alias laguerre = stdc.math.laguerrel;

    /// [sf.cmath.legendre], Legendre polynomials
    alias legendre = stdc.math.legendre;
    /// ditto
    alias legendre = stdc.math.legendref;
    /// ditto
    alias legendre = stdc.math.legendrel;

    /// [sf.cmath.riemann.zeta], Riemann zeta function
    alias riemann_zeta = stdc.math.riemann_zeta;
    /// ditto
    alias riemann_zeta = stdc.math.riemann_zetaf;
    /// ditto
    alias riemann_zeta = stdc.math.riemann_zetal;

    /// [sf.cmath.sph.bessel], spherical Bessel functions of the first kind
    alias sph_bessel = stdc.math.sph_bessel;
    /// ditto
    alias sph_bessel = stdc.math.sph_besself;
    /// ditto
    alias sph_bessel = stdc.math.sph_bessell;

    /// [sf.cmath.sph.legendre], spherical associated Legendre functions
    alias sph_legendre = stdc.math.sph_legendre;
    /// ditto
    alias sph_legendre = stdc.math.sph_legendref;
    /// ditto
    alias sph_legendre = stdc.math.sph_legendrel;

    /// [sf.cmath.sph.neumann], spherical Neumann functions;
    alias sph_neumann = stdc.math.sph_neumann;
    /// ditto
    alias sph_neumann = stdc.math.sph_neumannf;
    /// ditto
    alias sph_neumann = stdc.math.sph_neumannl;
}