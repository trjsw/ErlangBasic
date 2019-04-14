
-module(testMacro).
-export([version/0,printMacro/0, printMacro/1]).

-ifdef(VERSION).
version() -> ?VERSION.
-else.
version() -> "".
-endif.

-define(pringMacro(X), io:format("The macro ~p value is: ~p~n", [X, ??X])).


printMacro() ->
    io:format("The module name is : ~p.~n",[?MODULE]).

printMacro(X) ->
    ?pringMacro(X).