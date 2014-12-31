#!/bin/bash

HOST=192.168.5.61
PSQLDIR=/var/lib/pgsql/9.0
SVCNAME=postgresql-9.0

ssh $HOST "service $SVCNAME stop"

psql -c "SELECT pg_start_backup('label', true)" -U postgres

scp -r $PSQLDIR/data/ root@$HOST:$PSQLDIR/

psql -c "SELECT pg_stop_backup()" -U postgres


ssh $HOST "cp /root/*.conf $PSQLDIR/data/"
ssh $HOST "chown -R postgres:postgres $PSQLDIR/data"
ssh $HOST "find $PSQLDIR/data -type d -exec chmod 0700 {} \;"
ssh $HOST "rm -f $PSQLDIR/data/postmaster.pid"
ssh $HOST "[ -f /tmp/psql.trigger ] && rm /tmp/psql.trigger -f"
ssh $HOST "service $SVCNAME start"

# vim background=dark

