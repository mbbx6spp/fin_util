%% @author Susan Potter <me@susanpotter.net>
%% @copyright 2010 Finsignia, LLC
%% @doc template module for use on MOS platform.

-module(mos_template).
-export([compile/2, render/3]).

compile(Path, Template) ->
  erlydtl:compile(Path, Template).

render(Path, Template, Context) ->
  compile(Path, Template),
  Template:render(Context).
