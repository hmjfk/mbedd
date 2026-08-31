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
module stdc.locale;
public import stdc.cheader.locale;
public import stdc.stddef: NULL;

version(none)
import core.stdc.locale;

version(D_Doc)
{
    ///
    struct lconv
    {
        ///
        char* decimal_point;
        ///
        char* thousands_sep;
        ///
        char* grouping;
        ///
        char* mon_decimal_point;
        ///
        char* mon_thousands_sep;
        ///
        char* mon_grouping;
        ///
        char* positive_sign;
        ///
        char* negative_sign;
        ///
        char* currency_symbol;
        ///
        char frac_digits;
        ///
        char p_cs_precedes;
        ///
        char n_cs_precedes;
        ///
        char p_sep_by_space;
        ///
        char n_sep_by_space;
        ///
        char p_sign_posn;
        ///
        char n_sign_posn;
        ///
        char* int_curr_symbol;
        ///
        char int_frac_digits;
        ///
        char int_p_cs_precedes;
        ///
        char int_n_cs_precedes;
        ///
        char int_p_sep_by_space;
        ///
        char int_n_sep_by_space;
        ///
        char int_p_sign_posn;
        ///
        char int_n_sign_posn;
    }

    enum
    {
        ///
        LC_ALL,
        ///
        LC_COLLATE,
        ///
        LC_CTYPE,
        /// POSIX Extension
        LC_MESSAGES,
        ///
        LC_MONETARY,
        ///
        LC_NUMERIC,
        ///
        LC_TIME,

        /// POSIX Extension
        LC_COLLATE_MASK,
        /// ditto
        LC_CTYPE_MASK,
        /// ditto
        LC_MESSAGES_MASK,
        /// ditto
        LC_MONETARY_MASK,
        /// ditto
        LC_NUMERIC_MASK,
        /// ditto
        LC_TIME_MASK,

        LC_ALL_MASK,
        
        LC_GLOBAL_LOCALE,
    }
}