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

module mbedd.stdc.endian;

version(Posix){} else
    pragma(msg, "Warning: The current environment does not support Posix, which causes a link error. "~
                          "You need to build Gnulib separately and link again.");

public import mbedd.stdc.stdint;
import mbedd.stdc.stdbit: __STDC_ENDIAN_LITTLE__, __STDC_ENDIAN_NATIVE__;

///
enum LITTLE_ENDIAN = 1234;
///
enum BIG_ENDIAN = 4321;
///
enum PDP_ENDIAN = 3412;

version(D_Ddoc)
{
    ///
    alias BYTE_ORDER = void;
}
else
{
    static if(__STDC_ENDIAN_NATIVE__ == __STDC_ENDIAN_LITTLE__)
    {
        alias BYTE_ORDER = LITTLE_ENDIAN;
    }
    else
    {
        alias BYTE_ORDER = BIG_ENDIAN;
    }
}

///
uint16_t be16toh(uint16_t big_endian_16bits);
///
uint32_t be32toh(uint32_t big_endian_32bits);
///
uint64_t be64toh(uint64_t big_endian_64bits);

///
uint16_t htobe16(uint16_t host_16bits);
///
uint32_t htobe32(uint32_t host_32bits);
///
uint64_t htobe64(uint64_t host_64bits);

///
uint16_t htole16(uint16_t host_16bits);
///
uint32_t htole32(uint32_t host_32bits);
///
uint64_t htole64(uint64_t host_64bits);

///
uint16_t le16toh(uint16_t little_endian_16bits);
///
uint32_t le32toh(uint32_t little_endian_32bits);
///
uint64_t le64toh(uint64_t little_endian_64bits);