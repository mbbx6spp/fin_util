ERL          ?= erl
ERLC          = erlc
EBIN_DIRS    := $(wildcard deps/*/ebin)
APP          := mod_sys_util

all:
	@rebar compile

docs:
	@rebar doc

clean:
	@rebar clean

