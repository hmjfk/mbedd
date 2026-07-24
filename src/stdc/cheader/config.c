typedef long c_long;
typedef unsigned long c_ulong;

#if defined(_POSIX_C_SOURCE)
enum {posix_c_source = _POSIX_C_SOURCE};
#endif

#if defined(_XOPEN_SOURCE)
enum {xopen_source = _XOPEN_SOURCE};
#endif