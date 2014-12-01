#!/usr/bin/env bash
# Copyright (C) 2014, Dwayne O. Randle, Sr.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CMD=/usr/bin/wget
OPTS=('--header=accept-encoding: gzip' -q)

MONTHS='(January|February|March|April|May|June|July|August|September|October|November|December)'

function fetch_archive {
    if [ -f "$(date --date "$ARCHIVE_DATE" +%Y-%B).txt.gz" ] || [ -f "$(date --date "$ARCHIVE_DATE" +%Y-%B).txt" ]
    then
        echo skipping "$(date --date "$ARCHIVE_DATE" +%Y-%B).txt.gz"
    else
        URL=${BASE_URL}$(date --date "$ARCHIVE_DATE" +%Y-%B).txt.gz
        /usr/bin/wget "${OPTS[@]}" "${URL}"
        if [ $? -ne 0 ] ; then
            exit 1
        fi
    fi
}

ARCHIVE_START=$(echo $1 | grep -oP "[[:digit:]]{4}-$MONTHS\.txt\.gz$")
RETVAL=$?
if [ $RETVAL -ne 0 ] ; then
    echo "Usage: $0 [URL]" 

    exit 1
fi

BASE_URL=$(echo $1 | grep -oP  ".*(?=[[:digit:]]{4}-$MONTHS\.txt\.gz$)")
START_YEAR=$(echo $ARCHIVE_START | grep -oP '[[:digit:]]{4}')
START_MONTH=$(echo $ARCHIVE_START | grep -oP "$MONTHS")
START_DATE="01-$START_MONTH-$START_YEAR"
END_DATE="01-"$(date +%B-%Y)
CNTR=0

ARCHIVE_DATE=$START_DATE
while [ "$ARCHIVE_DATE" != "$END_DATE" ] ; do
    fetch_archive
    CNTR=$(($CNTR + 1))
    ARCHIVE_DATE=$(date --date "$START_DATE + $CNTR month" +%d-%B-%Y)
done
fetch_archive
