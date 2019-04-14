-module(convert).
-export([convert/3, convertL/1]).

convert(X,cm,inch)->
    X/2.54;

convert(X,inch, cm)->
    X*2.54.

convertL({cm,X})->
    {inch, X/2.54}.
