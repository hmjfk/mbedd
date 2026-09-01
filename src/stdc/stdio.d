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
Copyright: Copyright Denkousi 
License:   $(LINK2 http://www.gnu.org/licenses/gpl.html, GPL3.0+). with $(LINK2 https://www.gnu.org/licenses/gcc-exception.html, GCC RLE).
Standards: ISO/IEC 9899:2024(ISO C23), ISO/IEC 9945:2024(POSIX)
Source:    stdc/stdio.d
*/
module stdc.stdio;

version(D_Ddoc)
    struct va_list{}
else 
    public import stdc.stdarg:va_list;

public import stdc.cheader.stdio;
public import stdc.sys.types:off_t, ssize_t;
import stdc.config;

version(none)
    import core.stdc.stdio;

extern (C):
nothrow:
@nogc:
@live:

///
struct FILE;

///
pragma(printf)
int asprintf(return char** ptr, scope const(char*) format, scope const ...);

///
@trusted void clearerr(FILE* stream) pure;
///
char* ctermid(char*);
///
pragma(printf)
int dprintf(int fildes, scope const(char*) format, scope const ...);
///
int fclose(FILE* stream);
///
FILE* fdopen(int, scope const(char*));
///
@trusted
{
    pure
    {
        int feof(FILE* stream);
        ///
        int ferror(FILE* stream);
    }
    ///
    int fflush(FILE* stream);
    ///
    int fgetc(FILE* stream);
}
///
int fgetpos(FILE* stream, scope fpos_t* pos);
///
char* fgets(char*, int, FILE* stream);
///
@trusted int fileno(FILE* stream) pure;
///
void flockfile(FILE* stream);
///
FILE* fmemopen(void* buf, size_t max_size, const(char*) mode);
///
FILE* fopen(scope const(char*) pathname, scope const(char*) mode);
///
pragma(printf)
int fprintf(FILE* stream, scope const(char*) format, scope ...);
///
@trusted int fputc(int c, FILE* stream);
///
int fputs(scope const(char*) s, FILE* stream);
///
size_t fread(scope void* ptr, size_t size, size_t nitems, FILE* stream);
///
FILE* freopen(scope const(char*) pathname, scope const(char*) mode, FILE* stream);
///
pragma(scanf)
int fscanf(FILE* stream, scope const(char*) format, scope ...);
///
int fseek(FILE* stream, c_long, int);
///
int fseeko(FILE* stream, off_t, int);
///
int fsetpos(FILE* stream, scope const(fpos_t*) pos);
///
c_long ftell(FILE* stream);
///
off_t ftello(FILE* stream);
///
int ftrylockfile(FILE* stream);
///
void funlockfile(FILE* stream);
///
size_t fwrite(scope const(void*) ptr, size_t size, size_t nitems, FILE* stream);
///
int getc(FILE* stream);
///
@trusted int getchar();
///
int getc_unlocked(FILE* stream);
///
int getchar_unlocked();
///
ssize_t getdelim(char** lineptr, size_t* n, int delimiter, FILE* stream);
///
ssize_t getline(char** lineptr, size_t* n, FILE* stream);
///
scope FILE* open_memstream(char** bufp, size_t* sizep);
///
int pclose(FILE* stream);
///
void perror(const(char*) s);
///
FILE* popen(const(char*) command, const(char*) mode);
///
pragma(printf)
int printf(scope const(char*) format, scope const ...);
///
int putc(int c, FILE* stream);
///
@trusted int putchar(int c);
///
int putc_unlocked(int c, FILE* stream);
///
int putchar_unlocked(int c);
///
int puts(scope const(char*) s);
///
int remove(scope const(char*) path);
///
int rename(scope const(char*) old, scope const(char*) new_);
///
int renameat(int oldfd, scope const(char*) newfd, int, scope const(char*) new_);
///
@trusted void rewind(FILE* stream);
///
pragma(scanf)
int scanf(scope const(char*) format, scope return ...);
///
void setbuf(FILE* stream, char* buf);
///
int setvbuf(FILE* stream, char* buf, int type, size_t size);
///
pragma(printf)
int snprintf(char* s, size_t n, scope const(char*) format, scope const ...);
///
pragma(printf)
int sprintf(char* s, scope const(char*) format, scope const ...);
///
pragma(scanf)
int sscanf(const(char*) s, scope const(char*) format, scope return ...);
///
@trusted FILE* tmpfile();
///
@trusted  int ungetc(int, FILE* stream);
///
int vdprintf(int, scope const(char*) format, va_list ap);
///
int vfprintf(FILE* stream, scope const(char*) format, va_list ap);
///
int vfscanf(FILE* stream, scope const(char*) format, va_list ap);
///
int vprintf(scope const(char*) format, va_list ap);
///
int vscanf(scope const(char*) format, va_list ap);
///
int vsnprintf(char* s, size_t, scope const(char*) format, va_list ap);
///
int vsprintf(char* s, scope const(char*) format, va_list ap);
///
int vsscanf(scope const(char*) s, scope const(char*), va_list ap);