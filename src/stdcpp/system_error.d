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
module stdcpp.system_error;
import stdcpp.type_traits: false_type, true_type;

// 現時点では取り込む必要性がないので注釈付き
// public import stdcpp.compare;

extern(C++, "std")
{
    ///
    struct error_category;
    ///
    ref const(error_category) generic_category() nothrow;
    ///
    ref const(error_category) system_category() nothrow;

    ///
    struct error_code;
    ///
    struct error_condition;
    ///
    struct system_error;

    ///
    struct is_error_code_enum(T)
    {
        false_type temp;
        alias temp this;
    };

    ///
    struct is_error_condition_enum(T)
    {
        false_type temp;
        alias temp this;
    };
    
    /// freestanding
    enum errc 
    {
        address_family_not_supported,       /// EAFNOSUPPORT
        address_in_use,                     /// EADDRINUSE
        address_not_available,              /// EADDRNOTAVAIL
        already_connected,                  /// EISCONN
        argument_list_too_long,             /// E2BIG
        argument_out_of_domain,             /// EDOM
        bad_address,                        /// EFAULT
        bad_file_descriptor,                /// EBADF
        bad_message,                        /// EBADMSG
        broken_pipe,                        /// EPIPE
        connection_aborted,                 /// ECONNABORTED
        connection_already_in_progress,     /// EALREADY
        connection_refused,                 /// ECONNREFUSED
        connection_reset,                   /// ECONNRESET
        cross_device_link,                  /// EXDEV
        destination_address_required,       /// EDESTADDRREQ
        device_or_resource_busy,            /// EBUSY
        directory_not_empty,                /// ENOTEMPTY
        executable_format_error,            /// ENOEXEC
        file_exists,                        /// EEXIST
        file_too_large,                     /// EFBIG
        filename_too_long,                  /// ENAMETOOLONG
        function_not_supported,             /// ENOSYS
        host_unreachable,                   /// EHOSTUNREACH
        identifier_removed,                 /// EIDRM
        illegal_byte_sequence,              /// EILSEQ
        inappropriate_io_control_operation, /// ENOTTY
        interrupted,                        /// EINTR
        invalid_argument,                   /// EINVAL
        invalid_seek,                       /// ESPIPE
        io_error,                           /// EIO
        is_a_directory,                     /// EISDIR
        message_size,                       /// EMSGSIZE
        network_down,                       /// ENETDOWN
        network_reset,                      /// ENETRESET
        network_unreachable,                /// ENETUNREACH
        no_buffer_space,                    /// ENOBUFS
        no_child_process,                   /// ECHILD
        no_link,                            /// ENOLINK
        no_lock_available,                  /// ENOLCK
        no_message,                         /// ENOMSG
        no_protocol_option,                 /// ENOPROTOOPT
        no_space_on_device,                 /// ENOSPC
        no_such_device_or_address,          /// ENXIO
        no_such_device,                     /// ENODEV
        no_such_file_or_directory,          /// ENOENT
        no_such_process,                    /// ESRCH
        not_a_directory,                    /// ENOTDIR
        not_a_socket,                       /// ENOTSOCK
        not_connected,                      /// ENOTCONN
        not_enough_memory,                  /// ENOMEM
        not_supported,                      /// ENOTSUP
        operation_canceled,                 /// ECANCELED
        operation_in_progress,              /// EINPROGRESS
        operation_not_permitted,            /// EPERM
        operation_not_supported,            /// EOPNOTSUPP
        operation_would_block,              /// EWOULDBLOCK
        owner_dead,                         /// EOWNERDEAD
        permission_denied,                  /// EACCES
        protocol_error,                     /// EPROTO
        protocol_not_supported,             /// EPROTONOSUPPORT
        read_only_file_system,              /// EROFS
        resource_deadlock_would_occur,      /// EDEADLK
        resource_unavailable_try_again,     /// EAGAIN
        result_out_of_range,                /// ERANGE
        state_not_recoverable,              /// ENOTRECOVERABLE
        text_file_busy,                     /// ETXTBSY
        timed_out,                          /// ETIMEDOUT
        too_many_files_open_in_system,      /// ENFILE
        too_many_files_open,                /// EMFILE
        too_many_links,                     /// EMLINK
        too_many_symbolic_link_levels,      /// ELOOP
        value_too_large,                    /// EOVERFLOW
        wrong_protocol_type,                /// EPROTOTYPE
    };
    
    ///
    struct is_error_condition_enum(T: errc)
    {
        true_type temp;
        alias temp this;
    }

    /// [syserr.errcode.nonmembers], non-member functions
    version(none)
    error_code make_error_code(errc e) nothrow;
/*
  template<class charT, class traits>
    basic_ostream<charT, traits>&
      operator<<(basic_ostream<charT, traits>& os, const error_code& ec);
*/
    /// [syserr.errcondition.nonmembers], non-member functions
    version(none)
    error_condition make_error_condition(errc e) nothrow;

    /// [syserr.compare], comparison operator functions
/*
  bool operator==(const error_code& lhs, const error_code& rhs) noexcept;
  bool operator==(const error_code& lhs, const error_condition& rhs) noexcept;
  bool operator==(const error_condition& lhs, const error_condition& rhs) noexcept;
  strong_ordering operator<=>(const error_code& lhs, const error_code& rhs) noexcept;
  strong_ordering operator<=>(const error_condition& lhs, const error_condition& rhs) noexcept;
*/

    /// hash support
    struct hash(T);
    struct hash(T:error_code);
    struct hash(T:error_condition);

    /// [syserr], system error support
    enum bool is_error_code_enum_v(T) = is_error_code_enum!T.value;
    ///
    enum bool is_error_condition_enum_v(T) = is_error_condition_enum!T.value;

    /// [syserr.fmt], formatter
    struct formatter(error_code, charT);
}