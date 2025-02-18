!/bin/bash
USER="your_mysql_user"
PWD="your_mysql_password"
DB_NAME="your_database_name"
BACKUP_DIR="/path/to/backup"
DATE=$(date +"%Y-%m-%d")

# Get list of databases, excluding system databases
DB_LIST=$(mysql -u $USER -p $PWD -s -e "show databases;" 2>/dev/null | egrep -v "Database|information_schema|mysql|performance_schema|sys")

# Loop through each database and back it up
for DB in $DB_LIST; do
    BACKUP_NAME="${BACKUP_DIR}/${DB}_${DATE}.sql"
    
    if ! mysqldump -u $USER -p $PWD -B $DB > "$BACKUP_NAME" 2>/dev/null; then
        echo "$BACKUP_NAME backup is unsuccessful!"
    else
        echo "$BACKUP_NAME backup is successful!"
    fi
done
