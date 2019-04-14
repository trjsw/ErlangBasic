-module(timeout).
-export([start_ping/1, start_pong/0, ping/2, pong/0]).

ping(0,Pong_node) ->
    io:format("Ping finished!~n", []);

ping(N, Pong_node) ->
    {pong, Pong_node} ! {ping, self()},
    receive
        pong ->
            io:format("Ping receive pong. ~n", [])
    end,
    ping(N-1, Pong_node).

pong() ->
    receive
        {ping, Ping_id} ->
            io:format("Pong receive ping. ~n", []),
            Ping_id ! pong,
            pong()
    after 5000 ->
        io:format("Pong finished. ~n ", [])
    end.

start_ping(Pong_node) ->
    spawn(timeout, ping, [3, Pong_node]). 
    
start_pong() ->
    register(pong, spawn(timeout, pong,[])).
