#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=./backups

mkdir -p $BACKUP_DIR

echo "[$DATE] START backup Odoo DB" >> /var/log/backup.log

# 1. pg_dump 
docker exec apps-db-1 pg_dump -U odoo odoodb > $BACKUP_DIR/db_$DATE.sql

echo "[$DATE] PostgreSQL dump completed" >> /var/log/backup.log

# 2. filestore 
docker cp apps-odoo-1:/var/lib/odoo $BACKUP_DIR/filestore_$DATE

echo "[$DATE] Filestore copied" >> /var/log/backup.log

# 3. archive du filestore
tar -czf $BACKUP_DIR/backup_$DATE.tar.gz $BACKUP_DIR/filestore_$DATE

echo "[$DATE] Filestore archive created" >> /var/log/backup.log
