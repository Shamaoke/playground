
# Learn CPP Hello, world! #

## Compilation ##

## GCC ##

````
gcc \
  -DDEBUG \
  -std=c++23 \
  -ggdb \
  -O0 \
  -lstdc++ \
  -o main-debug \
     ../main.cpp
````

## Clang ##

`clang++ -std=c++23 -g -O0 -o helloworld main.cpp`

`clang -std=c++23 -g -O0 -lstdc++ -o getpath ../main.cpp`

`clang -DDEBUG -std=c++23 -ggdb -O0 -lstdc++ -o getpath ../main.cpp`

`clang -DRELEASE -std=c++23 -O2 -lstdc++ -o getpath ../main.cpp`

## Ninja ##

Ninja

