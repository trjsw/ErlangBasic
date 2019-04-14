-module(tut1).
-export([double/1, fac/1]).

double(X) ->
    X*2.

fac(1)->
    1;
fac(N)->
    N*fac(N-1).



