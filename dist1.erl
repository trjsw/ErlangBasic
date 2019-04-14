-module(dist1).
-export([son/0, start_son/0]).

son() ->
    receive
        hi ->
            io:format("Son: hi!~n");
        {come, Dad_id} ->
            io:format("Son: I am comming!~n"),
            Dad_id ! ok,
            son()
    end.

start_son() ->
    register( son, spawn(dist1, son, [])).



