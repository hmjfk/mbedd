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

module stdc.reduc;
public import stdc.stddef;

extern (C):
nothrow:
@nogc:
@live:

/// 
enum __STDC_IEC_60559_FUNCS_REDUCTION__ = 202401L;

version (__STDC_IEC_60559_BFP__)
{
    /// reduc_sumabs functions
    double reduc_sumabs(size_t n, const(double)* p);
    /// ditto
    float reduc_sumabsf(size_t n, const(float)* p);
    /// ditto
    real reduc_sumabsf(size_t n, const(real)* p);

    /// reduc_sumsq functions
    double reduc_sumsq(size_t n, const(double)* p);
    /// ditto
    float reduc_sumsqf(size_t n, const(float)* p);
    /// ditto
    real reduc_sumsql(size_t n, const(real)* p);

    /// reduc_sumprod functions
    double reduc_sumprod(size_t n, const(double)* p, const(double)* q);
    /// ditto
    float reduc_sumprodf(size_t n,  const(float)* p,  const(float)* q);
    /// ditto
    real reduc_sumprodl(size_t n, const(real)* p, const(real)* q);

    /// scaled_prod functions
    double scaled_prod(size_t n, const(double)* p, c_long* sfptr);
    /// ditto
    float scaled_prodf(size_t n,  const(float)* p, c_long* sfptr);
    /// ditto
    real scaled_prodl(size_t n, const(real)* p, c_long* sfptr);

    /// scaled_prodsum functions
    double scaled_prodsum(size_t n, const(double)* p, const(double)* q, c_long* sfptr);
    /// ditto
    float scaled_prodsumf(size_t n,  const(float)* p,  const(float)* q, c_long* sfptr);
    /// ditto
    real scaled_prodsuml(size_t n, const(real)* p, const(real)* q, c_long* sfptr);

    /// scaled_proddiff functions
    double scaled_proddiff(size_t n, const(double)* p, const(double)* q, c_long* sfptr);
    /// ditto
    float scaled_proddifff(size_t n,  const(float)* p,  const(float)* q, c_long* sfptr);
    /// ditto
    real scaled_proddiffl(size_t n, const(real)* p, const(real)* q, c_long* sfptr);
}
