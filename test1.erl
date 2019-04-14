-module(test1).
-export([list_max/1]).

list_max([Head|Rest]) ->
    list_max ( Rest, Head ).

list_max([],Res)->
    Res;
list_max( [Head | Rest], Current_max_value) when Head > Current_max_value  ->
    list_max(Rest, Head);
list_max([Head | Rest], Current_max_value) ->
    list_max(Rest, Current_max_value).
