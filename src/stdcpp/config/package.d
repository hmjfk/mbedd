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
module stdcpp.config;
public import stdc.config;
import stdcpp.support;


/**
 * Returns the target C++ version, encoded as C++ compilers do
 *
 * C++ compilers provide a `__cplusplus` macro which returns an integer
 * representing the targetted standard. This manifest provides the same
 * interface, retrieved from the compiler via a `__traits`.
 */
enum __cplusplus = __traits(getTargetInfo, "cppStd");

/// mangling rule categoly
version(CppRuntime_GNU)
    enum ItaniumCppMangle;
else version(CppRuntime_LLVM)
    enum ItaniumCppMangle;
else version(CppRuntime_DigitalMars)
    enum VSMCCppMangle;
else version(CppRuntime_Microsoft)
    enum VSMCCppMangle;

/**
libc++ ABI version
See_Also: https://libcxx.llvm.org//DesignDocs/ABIVersioning.html
Example: use LIBCPP_ABI_VERSION constant
---
extern(C++, "std")
version(Cppruntime_LLVM)
{
    extern(C++, LIBCPP_ABI_VERSION)
    {
        import mdrt.coredefs;

        noreturn terminate();
    }
}
---
Example: use stdNamespace constant
---
extern(C++, (stdNamespace))
{
    import mdrt.coredefs;

    noreturn terminate();
}
---
*/
version(CppRuntime_LLVM)
{
    version(LIBCXX_ABI_VERSION_v1)
        enum LIBCPP_ABI_VERSION = "__1";
    else version(LIBCXX_ABI_VERSION_v2)
        enum LIBCPP_ABI_VERSION = "__2";
    else version(LIBCXX_ABI_VERSION_v3)
        enum LIBCPP_ABI_VERSION = "__3";

    enum stdNamespace = Aliases!("std", LIBCPP_ABI_VERSION);
}
else
    enum stdNamespace = Alias!"std";