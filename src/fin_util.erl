%% @copyright 2010 Finsignia, LLC
%% @doc Utilities for the Finsignia platform.

-module(fin_util).
-export([generate_passphrase/0, generate_passphrase/1]).

generate_passphrase() ->
  generate_passphrase(8).

generate_passphrase(Length) ->
  lists:flatten(lists:foldl(fun(X, AccIn) ->
    [random:uniform(90) + 32 | AccIn] end,
    [], lists:seq(1, Length))).