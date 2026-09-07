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
module stdc.stdlib;

import mdrt.coredefs: noreturn;
public import stdc.cheader.stdlib;
public import stdc.config: c_long, c_ulong;
public import stdc.threads: once_flag;

extern (C):
nothrow:
@nogc:
@live:

// work only
version(none)
{
    import core.stdc.stdlib;
    import core.sys.posix.stdlib;
}

version(D_Ddoc)
{
    enum
    {
        ///
        EXIT_SUCCESS,
        /// ditto
        EXIT_FAILURE,
    }
    ///
    enum RAND_MAX;
    ///
    enum MB_CUR_MAX;
}

///
struct div_t
{
    ///
    int quot;
    ///
    int rem;
}

///
struct ldiv_t
{
    ///
    c_long quot;
    ///
    c_long rem;
}

///
struct lldiv_t
{
    ///
    long quot;
    ///
    long rem;
}

///
void call_once(once_flag* flag, void function() func);

///
c_long a64l(scope const(char*) status);
///
char* l64a(c_long value);

///
double atof(scope const(char*) nptr);
///
int atoi(scope const(char*) nptr);
///
c_long atol(scope const(char*) nptr);
///
long atoll(scope const(char*) nptr);

///
int strfromd(char* s, size_t n, scope const(char*) format, double fp);
///
int strfromf(char* s, size_t n, scope const(char*) format, float fp);
///
int strfroml(char* s, size_t n, scope const(char*) format, real fp);
///
double strtod(scope inout const(char*) nptr, scope inout(char)** endptr);
///
float strtof(scope inout const(char*) nptr, scope inout(char)** endptr);
///
real strtold(scope inout const(char*) nptr, scope inout(char)** endptr);
///
c_long strtol(scope inout const(char*) nptr, scope inout(char)** endptr, int base);
///
long strtoll(scope inout const(char*) nptr, scope inout(char)** endptr, int base);
///
c_ulong strtoul(scope inout const(char*) nptr, scope inout(char)** endptr, int base);
///
ulong strtoull(scope inout const(char*) nptr, scope inout(char)** endptr, int base);

@trusted
{
    ///
    int rand();
    ///
    void srand(uint seed);
}
///
char* initstate(uint seed, char* state, size_t size);
///
char* setstate(scope char* state);
///
c_long random();
///
void srandom(uint seed);

///
double drand48();
///
double erand48(ref ushort[3] xsubi);
///
long jrand48(ref ushort[3] xsubi);
///
void lcong48(ref ushort[7] param);
///
long lrand48();
///
long mrand48();
///
long nrand48(ref ushort[3] xsubi);
///
ushort* seed48(ref ushort[3] seed16v);
///
void srand48(c_long seedval);

///
void* malloc(size_t size);
///
void* calloc(size_t nmemb, size_t size);
///
void* realloc(void* ptr, size_t size);
///
void* aligned_alloc(size_t alignment, size_t size);
///
void* reallocarray(void*, size_t, size_t);
///
int posix_memalign(scope void** memptr, size_t alignment, size_t size);

///
void free(void* ptr);
///
void free_sized(void* ptr, size_t size);
///
void free_aligned_sized(void* ptr, size_t alignment, size_t size);

///
noreturn abort();
///
noreturn quick_exit(int status);
///
int atexit(void function() func);
///
int at_quick_exit(void function() func);
///
noreturn exit(int status);
///
noreturn _Exit(int status);

///
char* getenv(scope const(char*) name);
///
int putenv(char* string_);
///
char* secure_getenv(const const(char*) name);
///
int setenv(const const(char*) envname, scope const(char*) envval, int overwrite);
///
int unsetenv(const const(char*) name);

///
int getsubopt(char** optionp, const char** keylistp, char** valuep);
///
int grantpt(int fildes);

///
int system(scope const(char*) command);
///
void* bsearch(const(void*) key, inout(const(void*)) base, size_t nmemb, size_t size, int function(const(void*), const(void*)) compar);
///
void qsort(void* base, size_t nmemb, size_t size, int function(const(void*), const(void*)) compar);
///
void qsort_r(void* base, size_t nmemb, size_t size, int function(const(void*), const(void*)) compar, void* arg);

@trusted pure
{
    ///
    int abs(int j);
    ///
    c_long labs(c_long j);
    ///
    long llabs(long j);
    ///
    c_ulong ulabs(c_long j);
    ///
    long llabs(long j);
    ///
    ulong ullabs(long j);
}
///
div_t div(int numer, int denom);
///
ldiv_t ldiv(c_long numer, c_long denom);
///
lldiv_t lldiv(long numer, long denom);

///
int mblen(scope const(char*) s, size_t n);
///
int mbtowc(scope wchar_t* pwc, scope const(char*) s, size_t n);
///
int wctomb(char* s, wchar_t wc);
///
size_t mbstowcs(scope wchar_t* pwcs, scope const(char*) s, size_t n);
///
size_t wcstombs(scope char* s, scope const(wchar_t*) pwcs, size_t n);
///
size_t memalignment(scope const(void*) p);


///
char* mkdtemp(char* template_);
///
int mkostemp(char* template_, int flag);
///
int mkstemp(char* template_);
///
int posix_openpt(int oflag);
///
char* ptsname(int fildes);
///
int ptsname_r(int fildes, char* name, size_t namesize);
///
char* realpath(scope const(char*) file_name, char* resolved_name);

///
void setkey(scope const(char*) key);
///
int unlockpt(int unlockpt);

@safe pure
{
    /// unix v10 extensions
    int gcd(int a, int b);
    ///
    int lcm(int a, int b);
    ///
    int max(int a, int b);
    ///
    int min(int a, int b);

    /// mbedd Extension
    void swap(ref int a, ref int b);

    version (none)
    {
        import mdrt.utility : impoted;

        @__ctfe
        int gcd(int a, int b) => impoted!"stdcpp.numeric".gcd(a, b);

        @__ctfe
        int lcm(int a, int b) => impoted!"stdcpp.numeric".lcm(a, b);

        @__ctfe
        int max(int a, int b) => impoted!"stdcpp.algorithm".max(a, b);

        @__ctfe
        int min(int a, int b) => impoted!"stdcpp.algorithm".min(a, b);

        @__ctfe
        void swap(ref int a, ref int b) => imported!"stdcpp.utility".swap(a, b);
    }
}
