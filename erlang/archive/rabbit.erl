-module(walks).

-record(customer, {name, address, phone}).
-record(address, {region, town, street, house, flat).
-record(phone, {area_code, local_code, number}).
-record(name, {name, surname}).

% Address  = #address{region = "MO", town = "Kolomna", street = "Dobrolyubova", house = "10a", flat = "51"}.

Address  = #{ region => "MO",
              town   => "Kolomna",
              street => "Dobrolyubova",
              house  => "10a",
              flat   => "51" }.

Phone    = #phone{area_code = "7", local_code = "985", number = "1911990"}.
Name     = #name{name = "Pavel", surname = "Alekhin"}.
Customer = #customer{name = Name, address = Address, phone = Phone}.

print_contact(#customer{name = Name, address = Address, phone = Phone}) ->
  #{ region => CRegion, town  => CTown,
     street => CStreet, house => CHouse,
     flat   => CFlat } = Address.

step(string:concat(["My name is", Name]), Name) -> yet_to_be_implemented.

F = fun (a) -> fun (b) -> a + b end end.

F = fun (A, B, C, D) -> sum([A, B, C, D]) end.

-spec plan_route(Start :: point(), End :: point()).

-type point() :: {integer(), integer()}.

% -type start_point() :: point().
% -type end_point()   :: point().

plan_route(StartPoint, EndPoint) ->

-type name(Name     :: string(),
           Surngame :: string())
  :: {name, Name, Surname}.

-type address(Country :: string(),
              Region  :: string(),
              City    :: string(),
              Street  :: string(),
              House   :: string(),
              Flat    :: string())
  :: {address, Country, Region, City, Street, House, Flat}.

-type customer(Name    :: name(),
               Address :: address())
  :: {customer, Name, Address}.

