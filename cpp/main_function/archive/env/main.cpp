
///
/// ::: C++ primitives | Arrays :::
///

#include <iostream>
#include <vector>
#include <algorithm>
#include <format>

// namespace my {
//
//   auto size(char** ary) -> size_t {
//
//     std::cout << "typeid(ary): " << typeid(ary).name() << '\x{a}';
//     std::cout << "typeid(*ary): " << typeid(*ary).name() << '\x{a}';
//     std::cout << "typeid(**ary): " << typeid(**ary).name() << '\x{a}';
//
//     std::cout << "sizeof(ary): " << sizeof(ary) << '\x{a}';
//     std::cout << "sizeof(*ary): " << sizeof(*ary) << '\x{a}';
//     std::cout << "sizeof(**ary): " << sizeof(**ary) << '\x{a}';
//     std::cout << "sizeof(char): " << sizeof(char) << '\x{a}';
//     std::cout << "sizeof(**ary) / sizeof(char): " << sizeof(**ary) / sizeof(char) << '\x{a}';
//
//     return sizeof(*ary) / sizeof(char);
//   }
//
//   auto iterate(char** ary) -> void {
//
//     for (int i = 0; i < size(ary); i = i + 1) {
//       std::cout << **ary << '\x{a}';
//     }
//
//     return void();
//   }
// }

auto main(int argc, char** argv, char** env) -> int {

  // char a { 'a' };
  // char b { 'b' };
  // char c { 'c' };
  // char d { 'd' };
  // char e { 'e' };
  // char t { '\x{0}' };

  // char ab[] { a, b, t };
  // char cde[] { c, d, e, t };

  // char* ab_p { &*ab };
  // char* cde_p { &*cde };

  // char* my_mem[] { ab_p, cde_p, nullptr };

  char one[] { "ok!" };
  char two[] { "ok too!" };
  char three[] { "ok free!"};

  char* one_p { &*one };
  char* two_p { &*two };
  char* three_p { &*three };

  char* my_mem[ ] { one_p, two_p, three_p, nullptr };

  char** my_env { &*my_mem };
  // char* my_env[ ] { *my_mem };

  // std::cout << typeid(*my_mem).name() << ": " << *my_mem << '\x{a}';
  // std::cout << typeid(*my_env).name() << ": " << *my_env << '\x{a}';
  // std::cout << typeid(*env).name() << ": " << *env << '\x{a}';

  // while (*my_env) std::cout << typeid(*my_env).name() << ": " << *my_env++ << "\x{a}";
  // while (*env) std::cout << typeid(*env).name() << ": " << *env++ << '\x{a}';

  // std::cout << typeid(my_mem).name() << '\x{a}';
  // std::cout << typeid(my_env).name() << '\x{a}';

  // std::cout << typeid(argc).name() << '\x{a}';
  // std::cout << typeid(argv).name() << '\x{a}';
  // std::cout << typeid(env).name() << '\x{a}';

  // std::cout << typeid(ab).name() << "\n";
  // std::cout << typeid(cde).name() << "\n";

  // std::cout << typeid(ab_p).name() << "\n";
  // std::cout << typeid(cde_p).name() << "\n";

  // std::cout << ab_p << "\n";
  // std::cout << cde_p << "\n";

  // std::cout << typeid(abcde).name() << "\n";
  // std::cout << typeid(my_env).name() << ": " << my_env << "\n";
  // std::cout << typeid(*my_env).name() << ": " << *my_env << "\n";

  // char* my_mem[][] { ab, cd };

  // char** my_env { my_mem };

  // std::cout << typeid(env).name() << "\n";
  // std::cout << typeid(my_env).name() << "\n";

  // std::cout << typeid(env[0]).name() << ": " << env[0] << "\n";
  // std::cout << typeid(my_env[0]).name() << ": " << my_env[0] << "\n";

  // while (*my_env) std::cout << *my_env++ << "\n";

  // char one[] { 'a', 'b', 'c', '\x{0}' };
  // char one[] { "abc" };
  // char two[] { 'd', 'e', 'f', '\x{0}' };

  // char* ary[] { one, two };

  // std::cout << typeid(*ary).name() << ": " << *ary << "\n";
  // std::cout << typeid(*(ary + 1)).name() << ": " << *(ary + 1) << "\n";

  // std::cout << typeid(ary[0]).name() << ": " << ary[0] << "\n";
  // std::cout << typeid(ary[1]).name() << ": " << ary[1] << "\n";

  // std::cout << typeid(ary).name() << "\n";
  // std::cout << typeid(env).name() << "\n";

  // std::cout << typeid(**ary).name() << ": " << **ary1 << "\n";

  // char ary2[4] { 'x', 'y', 'z' };

  // std::cout << ary2;

  // std::cout << *str_arr << '\x{a}';

  // char a { 'a' };
  // char b { 'b' };
  // char c { 'c' };
  // char n { '\x{0}' };

  // char* chrs[4] { &a, &b, &c, &n };

  // iterate(chrs);

  // my::iterate(env);

  // char one[256] { 'o', 'k', '!' };
  // char two[256] { 'o', 'k', ' ', 't', 'o', 'o', '!' };
  // char three[256] { 'o', 'k', ' ', 'f', 'r', 'e', 'e', '!' };

  // char* ary[3] { one, two, three };

  // char** environment { ary };

  // int i = 0;

  // while (**env != 0) {
  //   std::cout << env[++i] << '\x{a}';
  // }

  // char** e { env };

  // char* o { *e };

  // std::cout << e << '\x{a}';
  // std::cout << o << '\x{a}';

  // while (env != 0) {
  //   std::cout << env << ": " << env[**env++] << '\x{a}';
  // }

  // while (*env) std::cout << *env++ << '\x{a}';

  // while (*env != 0) std::cout << *(env++) << '\x{a}';

  // std::cout << typeid(env).name();

  // std::vector<std::string> environment { };

  // while (*env != 0) environment.push_back(*(env++));

  // std::sort(environment.begin(), environment.end());

  // auto f { [ ] (std::string& e) {
  //   std::cout << std::format("{0}\x{a}", e); }
  // };

  // std::ranges::for_each(environment, f);

  // while (*env != 0) {
  //   std::cout << *(env++) << '\x{a}';
  // }

  // for (; *env != 0; env++) {
  //   std::cout << env << ": " << *env << '\x{a}';
  // }

  // for (char **e = env; *e != 0; e++) {
  //   // char *thisEnv = *e;
  //   // printf("%s\n", thisEnv);
  //   printf("%s\n", *e);
  // }
  /// Details
  /// -------
  /// [Printing all environment variables in C / C++ - Stack Overflow](https://stackoverflow.com/questions/2085302/printing-all-environment-variables-in-c-c)

  // std::cout << typeid(environment).name();

  // std::cout << *(environment + 0); //=> `ok!`
  // std::cout << *(environment + 1); //=> `ok too!`
  // std::cout << *(environment + 2); //=> `ok free!`

  return 0;
}

