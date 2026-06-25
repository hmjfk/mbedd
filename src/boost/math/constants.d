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

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module boost.math.constants;

extern (C++,"boost","math","constants")
{
    import stdcpp.config;
    static if(__STDC_HOSTED__)
    {
        ///
        T half(T, Policy)();
        ///
        T third(T, Policy)();
        ///
        T two_thirds(T, Policy)();
        ///
        T three_quarters(T, Policy)();
        ///
        T root_two(T, Policy)();
        ///
        T root_three(T, Policy)();
        ///
        T half_root_two(T, Policy)();
        ///
        T ln_two(T, Policy)();
        ///
        T ln_ten(T, Policy)();
        ///
        T ln_ln_two(T, Policy)();
        ///
        T root_ln_four(T, Policy)();
        ///
        T one_div_root_two(T, Policy)();
        ///
        T pi(T, Policy)();
        ///
        T half_pi(T, Policy)();
        ///
        T third_pi(T, Policy)();
        ///
        T quarter_pi(T, Policy)();
        ///
        T sixth_pi(T, Policy)();
        ///
        T two_pi(T, Policy)();
        ///
        T tau(T, Policy)();
        ///
        T two_thirds_pi(T, Policy)();
        ///
        T three_quarters_pi(T, Policy)();
        ///
        T four_thirds_pi(T, Policy)();
        ///
        T one_div_two_pi(T, Policy)();
        ///
        T root_pi(T, Policy)();
        ///
        T root_half_pi(T, Policy)();
        ///
        T root_two_pi(T, Policy)();
        ///
        T two_div_pi(T, Policy)();
        ///
        T one_div_root_pi(T, Policy)();
        ///
        T two_div_root_pi(T, Policy)();
        ///
        T one_div_root_two_pi(T, Policy)();
        ///
        T root_one_div_pi(T, Policy)();
        ///
        T pi_minus_three(T, Policy)();
        ///
        T four_minus_pi(T, Policy)();
        ///
        T pi_pow_e(T, Policy)();
        ///
        T pi_sqr(T, Policy)();
        ///
        T pi_sqr_div_six(T, Policy)();
        ///
        T pi_cubed(T, Policy)();
        ///
        T cbrt_pi(T, Policy)();
        ///
        T one_div_cbrt_pi(T, Policy)();
        ///
        T e(T, Policy)();
        ///
        T exp_minus_half(T, Policy)();
        ///
        T e_pow_pi(T, Policy)();
        ///
        T root_e(T, Policy)();
        ///
        T log10_e(T, Policy)();
        ///
        T one_div_log10_e(T, Policy)();
        ///
        T log2_e(T, Policy)();
        ///
        T degree(T, Policy)();
        ///
        T radian(T, Policy)();
        ///
        T sin_one(T, Policy)();
        ///
        T cos_one(T, Policy)();
        ///
        T sinh_one(T, Policy)();
        ///
        T cosh_one(T, Policy)();
        ///
        T phi(T, Policy)();
        ///
        T ln_phi(T, Policy)();
        ///
        T one_div_ln_phi(T, Policy)();
        ///
        T euler(T, Policy)();
        ///
        T one_div_euler(T, Policy)();
        ///
        T euler_sqr(T, Policy)();
        ///
        T zeta_two(T, Policy)();
        ///
        T zeta_three(T, Policy)();
        ///
        T catalan(T, Policy)();
        ///
        T glaisher(T, Policy)();
        ///
        T khinchin(T, Policy)();
        ///
        T extreme_value_skewness(T, Policy)();
        ///
        T rayleigh_skewness(T, Policy)();
        ///
        T rayleigh_kurtosis_excess(T, Policy)();
        ///
        T rayleigh_kurtosis(T, Policy)();
        ///
        T first_feigenbaum(T, Policy)();
        ///
        T plastic(T, Policy)();
        ///
        T gauss(T, Policy)();
        ///
        T dottie(T, Policy)();
        ///
        T reciprocal_fibonacci(T, Policy)();
        ///
        T laplace_limit(T, Policy)();
    }
    ///
    T half(T)();
    ///
    T third(T)();
    ///
    T two_thirds(T)();
    ///
    T three_quarters(T)();
    ///
    T root_two(T)();
    ///
    T root_three(T)();
    ///
    T half_root_two(T)();
    ///
    T ln_two(T)();
    ///
    T ln_ten(T)();
    ///
    T ln_ln_two(T)();
    ///
    T root_ln_four(T)();
    ///
    T one_div_root_two(T)();
    ///
    T pi(T)();
    ///
    T half_pi(T)();
    ///
    T third_pi(T)();
    ///
    T quarter_pi(T)();
    ///
    T sixth_pi(T)();
    ///
    T two_pi(T)();
    ///
    T tau(T)();
    ///
    T two_thirds_pi(T)();
    ///
    T three_quarters_pi(T)();
    ///
    T four_thirds_pi(T)();
    ///
    T one_div_two_pi(T)();
    ///
    T root_pi(T)();
    ///
    T root_half_pi(T)();
    ///
    T root_two_pi(T)();
    ///
    T two_div_pi(T)();
    ///
    T one_div_root_pi(T)();
    ///
    T two_div_root_pi(T)();
    ///
    T one_div_root_two_pi(T)();
    ///
    T root_one_div_pi(T)();
    ///
    T pi_minus_three(T)();
    ///
    T four_minus_pi(T)();
    ///
    T pi_pow_e(T)();
    ///
    T pi_sqr(T)();
    ///
    T pi_sqr_div_six(T)();
    ///
    T pi_cubed(T)();
    ///
    T cbrt_pi(T)();
    ///
    T one_div_cbrt_pi(T)();
    ///
    T e(T)();
    ///
    T exp_minus_half(T)();
    ///
    T e_pow_pi(T)();
    ///
    T root_e(T)();
    ///
    T log10_e(T)();
    ///
    T one_div_log10_e(T)();
    ///
    T log2_e(T)();
    ///
    T degree(T)();
    ///
    T radian(T)();
    ///
    T sin_one(T)();
    ///
    T cos_one(T)();
    ///
    T sinh_one(T)();
    ///
    T cosh_one(T)();
    ///
    T phi(T)();
    ///
    T ln_phi(T)();
    ///
    T one_div_ln_phi(T)();
    ///
    T euler(T)();
    ///
    T one_div_euler(T)();
    ///
    T euler_sqr(T)();
    ///
    T zeta_two(T)();
    ///
    T zeta_three(T)();
    ///
    T catalan(T)();
    ///
    T glaisher(T)();
    ///
    T khinchin(T)();
    ///
    T extreme_value_skewness(T)();
    ///
    T rayleigh_skewness(T)();
    ///
    T rayleigh_kurtosis_excess(T)();
    ///
    T rayleigh_kurtosis(T)();
    ///
    T first_feigenbaum(T)();
    ///
    T plastic(T)();
    ///
    T gauss(T)();
    ///
    T dottie(T)();
    ///
    T reciprocal_fibonacci(T)();
    ///
    T laplace_limit(T)();
}
