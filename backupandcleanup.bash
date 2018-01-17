#!/bin/bash
# Bash script For MysqlDB backup and HDD space cleanup.
# Author: Vinoth Kumar Selvaraj
# E-Mail: vinothkumar.s@cloudenablers.com


# Database credentials
user="cusdelight"
password="********"
host="localhost"
db_name="*********"

# Other options
backup_path="/home/cusdelight/bkpmysql"
now=$(date +%Y_%m_%d_%H_%M_%S)

# Set default file permissions
umask 177

file_name=$db_name-$now

# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name >$backup_path/$file_name.sql

# Delete MysqlDB_backup older than 30 days
find /home/cusdelight/bkpmysql/ -type f -mtime +30 -exec rm -- {} \;

# Delete logs and AWS_Stats older than 30 days
find /home/cusdelight/tmp/awstats/ -type f -mtime +30 -exec rm -- {} \;
find /home/cusdelight/tmp/webalizer/ -type f -mtime +30 -exec rm -- {} \;
find /home/cusdelight/logs/ -type f -mtime +30 -exec rm -- {} \;
find /home/cusdelight/mail/new/ -type f -mtime +30 -exec rm -- {} \;
