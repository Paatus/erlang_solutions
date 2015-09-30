-module(fib_seq).
-author(paatus).
-export([gen_fib_sequence/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) ->
    fib(N-1) + fib(N-2).

% takes amount of numbers to generate
gen_fib_sequence(N) ->
    gen_fib(N, 0, [], []).

% Count has reached Stop, print the list
gen_fib(_Stop, _Stop, _, Acc) ->
    io:format("~p~n", [Acc]);

% if Count is 0, initiate the list
gen_fib(Stop, Count, [], Acc) ->
    L = Acc ++ [fib(Count)],
    gen_fib(Stop, Count+1, L, L);

gen_fib(Stop, Count, [H1,H2|[]], Acc) ->
    N = Acc ++ [H1+H2],
    gen_fib(Stop, Count+1, N, N);

gen_fib(Stop, Count, [_|T], Acc) ->
    gen_fib(Stop, Count, T, Acc).
