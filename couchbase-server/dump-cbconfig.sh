#!/usr/bin/env bash
/opt/couchbase/bin/erl \
-noinput -eval \
'case file:read_file("/opt/couchbase/var/lib/couchbase/config/config.dat") of {ok, B}  -> io:format("~p~n", [binary_to_term(B)]) end.' \
-run init stop
