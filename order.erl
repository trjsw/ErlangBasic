-module(order).
-export([list_length/1, revert/1, reverse_list/1, list_max/1, max_min/1]).

list_length([]) ->
    0;
list_length([First | TheRest]) ->
    1+list_length(TheRest).

revert([])->
    "";
revert([First|TheRest])->
    [revert(TheRest), First].

reverse_list(Original_list) ->
    reverse_list(Original_list, []).

reverse_list([Head | Rest], Result_list) ->
    reverse_list(Rest, [Head | Result_list]);
reverse_list ([], Result_list) ->
    Result_list.

list_max( [Head|Rest] ) ->
    list_max(Rest, Head).

list_max([],Result) ->
    Result;
list_max( [Head | Rest], Current_list_max_value) when Head > Current_list_max_value  ->
    list_max(Rest, Head);
list_max([Head|Rest], Current_list_max_value) ->
    list_max(Rest, Current_list_max_value).

max_min([Head|Rest]) ->
    max_min(Rest, {Head, Head}).

max_min([], {Max_value, Min_value}) ->
    {Max_value, Min_value};
max_min([Head|Rest], {Max_value,Min_value}) ->
    if
        Head > Max_value -> max_min(Rest, {Head, Min_value});
        Head < Min_value -> max_min(Rest,{Max_value, Head});
        true-> max_min (Rest,{Max_value, Min_value})
    end.




