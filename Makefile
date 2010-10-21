ERL          ?= erl
ERLC          = erlc
EBIN_DIRS    := $(wildcard deps/*/ebin)
APP          := mod_sys_util

all: erlydtl mod_sys_util

mod_sys_util:
	@$(ERL) -make
#	@$(ERL) -pa $(EBIN_DIRS) -pa ebin -noinput +B \
#	  -eval 'case make:all() of up_to_date -> halt(0); error -> halt(1) end.'

erlydtl:
	cd deps/erlydtl && $(MAKE)

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

clean: 
	@echo "removing:"
	(cd deps/erlydtl; $(MAKE) clean)
	rm -f ebin/*.beam ebin/*.app
	rm -f erl_crash.dump $(PARSER).erl
	rm -f priv/log/*

