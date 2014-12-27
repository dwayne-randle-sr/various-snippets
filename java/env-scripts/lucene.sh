#!/bin/bash

LUCENE_BASE_DIR=/opt/lucene/lucene-4.10.2/
LUCENE_CORE=core/lucene-core-4.10.2.jar
LUCENE_QUERY_PARSER=queryparser/lucene-queryparser-4.10.2.jar
LUCENE_ANALYZERS=analysis/common/lucene-analyzers-common-4.10.2.jar
LUCENE_DEMO=demo/lucene-demo-4.10.2.jar

function build_cp {
    echo $CLASSPATH | grep $1
    if [ $? -gt 0 ] ; then
        echo adding $LUCENE_BASEE_DIR$1
        if [ -z "$CLASSPATH" ]; then
            export CLASSPATH=$LUCENE_BASE_DIR$1
        else
            export CLASSPATH=$CLASSPATH:$LUCENE_BASE_DIR$1
        fi
    fi
}

for CP in $LUCENE_{CORE,QUERY_PARSER,ANALYZERS,DEMO} ; do
    build_cp $CP
done

echo final  $CLASSPATH
