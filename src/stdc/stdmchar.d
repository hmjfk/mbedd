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
module stdc.stdmchar;

public import stdc.wchar_;
public import stdc.stdint;
public import stdc.uchar: char8_t, char16_t, char32_t;
public import stdc.stddef:wchar_t, size_t;

extern(C):
nothrow:
@nogc:
@live:

///
enum __STDC_VERSION_STDMCHAR_H__ = 202900L;

enum stdc_mcerr
{
    stdc_mcerr_ok = 0,
    stdc_mcerr_invalid = -1,
    stdc_mcerr_incomplete_input = -2,
    stdc_mcerr_insufficient_output = -3
}

///
stdc_mcerr stdc_mcnrtomcn(size_t* output_size,
    char** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcnrtomwcn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcnrtoc8n(size_t* output_size,
    char8_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcnrtoc16n(size_t* output_size,
    char16_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcnrtoc32n(size_t* output_size,
    char32_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcnrtomcn(size_t* output_size,
    char** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcnrtomwcn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcnrtoc8n(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcnrtoc16n(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcnrtoc32n(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8nrtomcn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8nrtomwcn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8nrtoc8n(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8nrtoc16n(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8nrtoc32n(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16nrtomcn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16nrtomwcn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16nrtoc8n(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16nrtoc16n(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16nrtoc32n(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32nrtomcn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32nrtomwcn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32nrtoc8n(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32nrtoc16n(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32nrtoc32n(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcsnrtomcsn(size_t* output_size,
    char** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcsnrtomwcsn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcsnrtoc8sn(size_t* output_size,
    char8_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcsnrtoc16sn(size_t* output_size,
    char16_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mcsnrtoc32sn(size_t* output_size,
    char32_t** output,
    size_t* input_size,
     const(char)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcsnrtomcsn(size_t* output_size,
    char** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcsnrtomwcsn(size_t* output_size,
    char** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcsnrtoc8sn(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcsnrtoc16sn(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_mwcsnrtoc32sn(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    wchar_t** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8snrtomwcsn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8snrtomcsn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8snrtoc8sn(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8snrtoc16sn(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c8snrtoc32sn(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char8_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16snrtomwcsn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16snrtomcsn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16snrtoc8sn(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16snrtoc16sn(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c16snrtoc32sn(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char16_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32snrtomcsn(size_t* output_size,
    char** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32snrtomwcsn(size_t* output_size,
    wchar_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32snrtoc8sn(size_t* output_size,
    char8_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32snrtoc16sn(size_t* output_size,
    char16_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);
///
stdc_mcerr stdc_c32snrtoc32sn(size_t* output_size,
    char32_t** output,
    size_t* input_size,
    const(char32_t)** input,
    mbstate_t* state);