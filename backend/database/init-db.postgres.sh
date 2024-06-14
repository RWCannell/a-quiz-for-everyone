#!/usr/bin/env bash

echo "Start postgres docker container"
docker run --rm --name pg-a-quiz-for-everyone -e POSTGRES_PASSWORD=quiz -d -p 5401:5432 -v postgres_quiz:/var/lib/postgresql/data postgres:14
echo "Database starting..."
sleep 15
echo "Create quiz Database"
docker exec -it pg-a-quiz-for-everyone bash -c 'PGPASSWORD=quiz psql -U postgres -c "create database quiz"'
echo "Create quiz_schema Schema"
docker exec -it pg-a-quiz-for-everyone bash -c 'PGPASSWORD=quiz psql -U postgres -d quiz -c "create schema quiz_schema"'