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

%% by default the `start` function will be executed by `erl -s module` command
%% (i.e `erl -s rabbit {start}`)
-spec start() -> result().
start() -> say(),
           success.

%% vim: set textwidth=80 colorcolumn=80:
