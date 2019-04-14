-module(coproc).
-export([start/0, ping/2, pong/0]).

ping(0, Pong_id) ->
    Pong_id ! finished,
    io:format("Ping finished.~n");

ping(N, Pong_id) ->
    Pong_id ! {ping, self()},
    receive
        pong ->
            io:format("ping receive pong.~n", [])
    end,
    ping(N-1, Pong_id).

pong() ->
    receive
        finished ->
            io:format("pong fininshed.~n",[]);
        {ping, Ping_id} ->
            io:format ("pong received ping.~n",[]),
            Ping_id ! pong,
            pong()
    end.

start() ->
    Pong_id = spawn(coproc, pong, []),
    spawn (coproc, ping, [3, Pong_id]).

