
class Car;
class Person;

class Car {
  friend Car Person::set_price(Car&, unsigned int);

  private:
    std::string name;
    unsigned int price;

  public:
    Car(std::string name, unsigned int price) {
      this->name = name;
      this->price = price;
    }

    unsigned int get_price( ) {
      return this->price;
    }
}

class Person {
  private:
    std::string name;

  public:
    Person(std::string name) {
      this->name = name;
    }

    Car set_price(Car &car, unsigned int price) {
      car.price = price;
    }
}

