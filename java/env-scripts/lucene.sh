#!/bin/bash
# Copyright 2014-2015 (C) Dwayne Randle
# 

# lucene.sh - Creates the classpath for the demo version of lucene.
#

# LUCENE_BASE_DIR is the path to the actual base directory where lucene
# is installed.
LUCENE_BASE_DIR=/opt/lucene/lucene-4.10.2/

# LUCENE_ (CORE/QUERY_PARSER/ANALYZERS/DEMO) are pointers to the jar files
# for the lucene demo to run.
#
LUCENE_CORE=core/lucene-core-4.10.2.jar
LUCENE_QUERY_PARSER=queryparser/lucene-queryparser-4.10.2.jar
LUCENE_ANALYZERS=analysis/common/lucene-analyzers-common-4.10.2.jar
LUCENE_DEMO=demo/lucene-demo-4.10.2.jar

# Generic function to build the CLASSPATH.  If its empty, creates a 
# new class path.  Otherwise it will append appropriately.
#
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

# Build classpath for the environment variables listed.
#
for CP in $LUCENE_{CORE,QUERY_PARSER,ANALYZERS,DEMO} ; do
    build_cp $CP
done

# Display to the end user what we have created.
echo final  $CLASSPATH
