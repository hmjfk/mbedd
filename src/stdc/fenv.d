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
Copyright:  Copyright Denkousi 2025-
License:    $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+) with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Authors:    Denkousi
Source:     
*/
module stdc.fenv;
public import stdc.cheader.fenv;

// work only
version(none)
{
    import core.stdc.fenv;
}

extern(C):
@system:
@nogc:
nothrow:

///
enum __STDC_VERSION_FENV_H__ = 202311L;

version(D_Ddoc)
{
    private
    {
        enum see_description;
        enum unspecified;
        enum implementation_defined; 
    }

    ///
    alias fenv_t = unspecified;
    ///
    alias femode_t = unspecified;
    ///
    alias fexcept_t = unspecified;

    enum
    {
        ///
        FE_DIVBYZERO = see_description,
        ///
        FE_INEXACT = see_description,
        ///
        FE_INVALID = see_description,
        ///
        FE_OVERFLOW = see_description,
        ///
        FE_UNDERFLOW = see_description,

        ///
        FE_DFL_MODE = implementation_defined,
        
        ///
        FE_ALL_EXCEPT = see_description,
        
        ///
        FE_DOWNWARD = see_description,
        ///
        FE_TONEAREST = see_description,
        ///
        FE_TONEARESTFROMZERO = see_description,
        ///
        FE_TOWARDZERO = see_description,
        ///
        FE_UPWARD = see_description,

        /// 
        FE_DEC_DOWNWARD = see_description,
        ///
        FE_DEC_TONEAREST = see_description,
        ///
        FE_DEC_TONEARESTFROMZERO = see_description,
        ///
        FE_DEC_TOWARDZERO = see_description,
        ///
        FE_DEC_UPWARD = see_description,

        ///
        FE_DFL_ENV = implementation_defined,
    }

}
else
{
    static if(is(typeof(fe_divbyzero)))
    enum FE_DIVBYZERO = fe_divbyzero;
    static if(is(typeof(fe_inexact)))
    enum FE_INEXACT = fe_inexact;
    static if(is(typeof(fe_invalid)))
    enum FE_INVALID = fe_invalid;
    static if(is(typeof(fe_overflow)))
    enum FE_OVERFLOW = fe_overflow;
    static if(is(typeof(fe_underflow)))
    enum FE_UNDERFLOW = fe_underflow;

    enum FE_DFL_MODE = fe_dfl_mode;

    enum FE_ALL_EXCEPT = fe_all_except;

    static if(is(typeof(fe_downward)))
    enum FE_DOWNWARD = fe_downward;
    static if(is(typeof(fe_tonearest)))
    enum FE_TONEAREST = fe_tonearest;
    static if(is(typeof(fe_tonearestfromzero)))
    enum FE_TONEARESTFROMZERO = fe_tonearestfromzero;
    static if(is(typeof(fe_towardzero)))
    enum FE_TOWARDZERO = fe_towardzero;
    static if(is(typeof(fe_upward)))
    enum FE_UPWARD = fe_upward;

    static if(is(typeof(fe_dec_downward)))
    enum FE_DEC_DOWNWARD = fe_dec_downward;
    static if(is(typeof(fe_dec_tonearest)))
    enum FE_DEC_TONEAREST = fe_dec_tonearest;
    static if(is(typeof(fe_dec_tonearestfromzero)))
    enum FE_DEC_TONEARESTFROMZERO = fe_dec_tonearestfromzero;
    static if(is(typeof(fe_dec_towardzero)))
    enum FE_DEC_TOWARDZERO = fe_dec_towardzero;
    static if(is(typeof(fe_dec_upward)))
    enum FE_DEC_UPWARD = fe_dec_upward;

    enum FE_DFL_ENV = fe_dfl_env();
}

///
int feclearexcept(int excepts);
///
int fegetexceptflag(fexcept_t* flagp, int excepts);
///
int feraiseexcept(int excepts);
///
int fesetexcept(int excepts);
///
int fesetexceptflag(scope const(fexcept_t*) flagp, int excepts);
///
int fetestexceptflag(scope const(fexcept_t*) flagp, int excepts);
///
int fetestexcept(int excepts);
///
int fegetmode(femode_t* modep);
///
int fegetround();
///
int fesetmode(scope const(femode_t*) modep);
///
int fesetround(int rnd);
///
int fegetenv(fenv_t* envp);
///
int feholdexcept(fenv_t* envp);
///
int fesetenv(scope const(fenv_t*) envp);
///
int feupdateenv(scope const(fenv_t*) envp);