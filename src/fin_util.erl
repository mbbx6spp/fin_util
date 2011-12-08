%% @copyright 2010 Finsignia, LLC
%% @doc Utilities for the Finsignia platform.

-module(fin_util).
-export([ensure_started/1, generate_passphrase/0, generate_passphrase/1]).

%% @doc ensure the given application, App, is started
%% and ignore if already started.
-spec ensure_started(App) -> ok | {error, Reason}
 when
   App :: atom(),
   Reason :: term() | string().
ensure_started(App) ->
  case application:start(App) of
    ok -> ok;
    {error, {already_started, _Error}} -> ok
  end.

generate_passphrase() ->
  generate_passphrase(8).

generate_passphrase(Length) ->
  lists:flatten(lists:foldl(fun(_, AccIn) ->
    [crypto:rand_uniform(32, 122) | AccIn] end,
    [], lists:seq(1, Length))).
