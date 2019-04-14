-module(tryWhen).
-export([loop/1]).

-define(is_valid(X), (X >= 1 andalso X =< 10)).

loop(10) ->
    io:format(" ~w~n",[10]);

loop(N) when ?is_valid(N) ->
    io:format(" ~w",[N]),
    loop(N+1).

