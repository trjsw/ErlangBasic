-module(trylink).
-export([start_link/1, ping/2, pong/0]).

ping(N, Pong_id) ->
    link(Pong_id),
    ping1(N, Pong_id).

ping1(0, _) ->
    exit(ping);

ping1(N, Pong_id) ->
    Pong_id ! {ping, self()},
    receive
        pong ->
            io:format("Ping received pong. ~n", [])
    end,
    ping1(N-1, Pong_id).


pong() ->
    receive
        {ping, Ping_id} ->
            io:format("Pong receive ping. ~n", []),
            Ping_id ! pong,
            pong()
    end.

start_link(Ping_Node) ->
    Pong_id = spawn(trylink, pong, []),
    spawn(Ping_Node, trylink, ping, [3, Pong_id]).
