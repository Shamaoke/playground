
namespace my {

  class Parent {
    private:
      int n { 98 };

    public:
      Parent( );

      Parent(int n);

      auto get_n( ) -> decltype(this->n);
  };

  class Child : public Parent {
    private:
      int m { 99 };

    public:
      // Child( );

      Child(int n = 77);

      auto get_m( ) -> decltype(this->m);
  };
} // namespace my
