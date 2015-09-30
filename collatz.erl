-module(collatz).
-author(paatus).
%-compile(export_all).
-export([collatz/1, collatz/2]).

collatz(N) when N > 0 ->
    collatz(N, false, [N], 0).

collatz(N, Debug) ->
    collatz(N, Debug, [N], 0).

collatz(1, Debug, List, Num) ->
    case Debug of
        true -> io:format("~p steps, list => ~p~n", [Num, List]);
        false -> Num
    end;

collatz(N, Debug, List, Num) ->
    case N rem 2 of
        0 -> collatz(N div 2, Debug, List ++ [N div 2], Num+1);
        1 -> collatz((N*3)+1, Debug, List ++ [(N*3)+1], Num+1)
    end.
