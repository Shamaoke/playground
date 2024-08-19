%%
%% ::: Rabbit :::
%%

%%
%% Compile the program with `erlc rabbit.erl`.
%% Run the program with `erl -noshell -s rabbit -s init stop`.
%%

-module(rabbit).

-export([start/0]).

-type result() :: success | fail.

-spec say() -> result().
say() -> io:format("Rabbit says farewell!~n", [ ]),
         success.

-spec start() -> result().
start() -> say(),
           success.

%% vim: set textwidth=80 colorcolumn=80:
