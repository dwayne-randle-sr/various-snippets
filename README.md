Copyright (C) 2015 Dwayne Randle 

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>

various-snippets
================

Snippets of code because I forget a lot of times

## CentOS 6
### Configuration Files
#### Modprobe 
Disable modules provided by default that are not needed or pose a security risk. 
The list is as follows:
* cramfs.conf
* dccp.conf
* freevxfs.conf
* hfs.conf
* hfsplus.conf
* jffs2.conf
* rds.conf
* sctp.conf
* squashfs.conf
* tipc.conf
* udf.conf
* usb-storage.conf

#### Yum Repositories
Adding repos that are not part of Centos and EPEL.
* couchbase.repo
* mongodb.repo
* pgdg-84-centos.repo
* pgdg-90-centos.repo

## Postgresql
### Sync Replication

## Python
### Python startup scripts (pythonstartup.py)

export PYTHONSTARTUP=~/pythonstartup.py

## Secure Shell
### Secure Shell Daemon
Added a banner to display a warning prior to users logging in.

