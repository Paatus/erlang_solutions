-module(collatz).
-author(paatus).
%-compile(export_all).
-export([collatz/1, collatz/2]).

% requires a positive integer, runs without printing the list for debugging
collatz(N) when N > 0 ->
    collatz(N, false, [N], 0).

% added boolean attribute for debugging purpose
collatz(N, Debug) ->
    collatz(N, Debug, [N], 0).

% the number has reached 1, print amount of steps, and also the list if debug is enabled
collatz(1, Debug, List, Num) ->
    case Debug of
        true -> io:format("~p steps, list => ~p~n", [Num, List]);
        false -> Num
    end;

% main function, calls itself recursively
collatz(N, Debug, List, Num) ->
    case N rem 2 of
        0 -> collatz(N div 2, Debug, List ++ [N div 2], Num+1);
        1 -> collatz((N*3)+1, Debug, List ++ [(N*3)+1], Num+1)
    end.
