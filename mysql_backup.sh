#!/bin/bash
USER="your_mysql_user"
PWD="your_mysql_password"
DB_NAME="your_database_name"
BACKUP_DIR="/path/to/backup"
DATE=$(date +"%Y-%m-%d")
mysqldump -u $USER -p $PWD $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql
echo "Database has been backup to $BACKUP_DIR"
