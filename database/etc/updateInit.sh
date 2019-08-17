#!/bin/bash

DIR=$(dirname "$0")

SCHEMA_FILE_NAME=schema_db-`date "+%Y-%m-%d"`.sql
SEED_FILE_NAME=seed-`date "+%Y-%m-%d"`.sql
SCHEMA_LOCATION=$DIR/../etc/DB_schema_dumps/$SCHEMA_FILE_NAME
SEED_LOCATION=$DIR/../etc/seed/$SEED_FILE_NAME


docker exec nail-studio__postgres pg_dump -d crm --schema-only > $SCHEMA_LOCATION
echo "PG dump updated"

docker exec nail-studio__postgres pg_dump -d crm --data-only > $SEED_LOCATION
echo "PG seed updated"

cat $DIR/../etc/before.sql $SCHEMA_LOCATION $SEED_LOCATION > $DIR/../initialization/init.sql
echo "init script updated"


