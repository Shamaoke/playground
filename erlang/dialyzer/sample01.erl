%%
%% ::: sample 1 :::
%%

-module(sample01).

-export([main/0]).

seconds({_Y, _M, _D, H, M, S}) -> R = (H * 60 + M) * 60 + S,
                                  R.

main() -> X = erlang:time(),
          R = seconds(X),
          R.

