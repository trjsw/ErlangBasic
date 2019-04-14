-module(testIf).
-export([testIf/1, testCase/1]).

testIf(N) ->
    if
        N>5 ->
            io:format("N is greater than 5.~n");
        N>10 ->
            io:format("N is greater than 10. ~n");
        true ->
            io:format("N is smaller than 5~n")
    end.

testCase(N) ->
    case N of
        5 ->
            io:format("N equal to 5.~n");
        10 ->
            io:format("N equal to 10. ~n");
        _ ->
            io:format("N equal to nobody. ~n")
    end.