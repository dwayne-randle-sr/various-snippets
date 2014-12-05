#!/usr/bin/env bash
function build_cp {
    echo $CLASSPATH | grep $1
    if [ $? -gt 0 ] ; then
       echo adding $LUCENE_BASEE_DIR$1
       export CLASSPATH=$CLASSPATH:$LUCENE_BASE_DIR$1
    fi
}
LUCENE_BASE_DIR=/opt/lucene/lucene-4.10.2/
LUCENE_CORE=core/lucene-core-4.10.2.jar
LUCENE_QUERY_PARSER=queryparser/lucene-queryparser-4.10.2.jar
LUCENE_ANALYZERS=analysis/common/lucene-analyzers-common-4.10.2.jar
LUCENE_DEMO=demo/lucene-demo-4.10.2.jar

build_cp $LUCENE_CORE
build_cp $LUCENE_QUERY_PARSER
build_cp $LUCENE_ANALYZERS
build_cp $LUCENE_DEMO

echo final  $CLASSPATH

