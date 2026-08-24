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
#include <fenv.h>

enum
{
#ifdef FE_DIVBYZERO
    fe_divbyzero = FE_DIVBYZERO,
#endif
#ifdef FE_INEXACT
    fe_inexact = FE_INEXACT,
#endif
#ifdef FE_INVALID
    fe_invalid = FE_INVALID,
#endif
#ifdef FE_OVERFLOW
    fe_overflow = FE_OVERFLOW,
#endif
#ifdef FE_UNDERFLOW
    fe_underflow = FE_UNDERFLOW,
#endif

    fe_dfl_mode = FE_DFL_MODE,

    fe_all_except = FE_ALL_EXCEPT,

#ifdef FE_DOWNWARD
    fe_downward = FE_DOWNWARD,
#endif
#ifdef FE_TONEAREST
    fe_tonearest = FE_TONEAREST,
#endif
#ifdef FE_TONEARESTFROMZERO
    fe_tonearestfromzero = FE_TONEARESTFROMZERO,
#endif
#ifdef FE_TOWARDZERO
    fe_towardzero = FE_TOWARDZERO,
#endif
#ifdef FE_UPWARD
    fe_upward = FE_UPWARD,
#endif
#ifdef FE_DEC_DOWNWARD
    fe_dec_downward = FE_DEC_DOWNWARD,
#endif
#ifdef FE_DEC_TONEAREST
    fe_dec_tonearest = FE_DEC_TONEAREST,
#endif
#ifdef FE_DEC_TONEARESTFROMZERO
    fe_dec_tonearestfromzero = FE_DEC_TONEARESTFROMZERO,
#endif
#ifdef FE_DEC_TOWARDZERO
    fe_dec_towardzero = FE_DEC_TOWARDZERO,
#endif
#ifdef FE_DEC_UPWARD
    fe_dec_upward = FE_DEC_UPWARD,
#endif
};

static inline typeof(FE_DFL_ENV) fe_dfl_env()
{
    return FE_DFL_ENV;
}