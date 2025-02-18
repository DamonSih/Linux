#!/bin/bash

USER="your_mysql_user"
PWD="your_mysql_password" 
BACKUP_DIR="/path/to/backup"
DATE=$(date +"%Y-%m-%d")

# Get list of databases, excluding system databases
DB_LIST=$(mysql -u $USER -p $PWD -s -e "show databases;" 2>/dev/null | egrep -v "Database|information_schema|mysql|performance_schema|sys")

# Iterate over each database
for DB in $DB_LIST; do
    BACKUP_DB_DIR="$BACKUP_DIR/${DB}_${DATE}"
    
    # Create backup directory if it doesn't exist
    [ ! -d "$BACKUP_DB_DIR" ] && mkdir -p "$BACKUP_DB_DIR" >/dev/null 2>&1
    
    # Get list of tables for each database
    TABLE_LIST=$(mysql -u $USER -p $PWD -s -e "show tables in $DB;" 2>/dev/null)

    # Iterate over each table in the database
    for TABLE in $TABLE_LIST; do
        BACKUP_NAME="$BACKUP_DB_DIR/${TABLE}.sql"
        
        # Backup each table
        if ! mysqldump -u $USER -p $PWD $DB $TABLE > "$BACKUP_NAME" 2>/dev/null; then
            echo "$BACKUP_NAME backup unsuccessful!"  # Backup failed
        else
            echo "$BACKUP_NAME backup successful!"  # Backup successful
        fi
    done 

done
