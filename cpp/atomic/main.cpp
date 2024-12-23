
#include <atomic>
#include <string>

auto main( ) -> int {

  std::atomic<std::string> str1_a { "ok!" };

  /// std::atomic<std::string> str2_a = str1_a;
  ///
  /// ````
  /// In file included from main.cpp:2:
  /// /usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/14.2.1/../../../../include/c++/14.2.1/atomic:218:21:
  /// error: static assertion failed due to requirement
  ///   '__is_trivially_copyable(std::basic_string<char, std::char_traits<char>, std::allocator<char>>)':
  ///     std::atomic requires a trivially copyable type
  ///
  ///   218 |       static_assert(__is_trivially_copyable(_Tp),
  ///       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  /// main.cpp:7:28: note: in instantiation of template class 'std::atomic<std::basic_string<char>>' requested here
  ///
  ///     7 |   std::atomic<std::string> str1_a { "ok!" };
  ///       |                            ^
  ///
  /// 1 error generated.
  /// ````
  ///

  return 0;
}

