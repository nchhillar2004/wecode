#!/bin/bash

echo "Starting spring boot..."
(cd core && mvn clean spring-boot:run) &

echo "Starting preact app..."
(cd app && npm run dev) &

echo "Starting go server..."
(cd go-server && go run cmd/main.go) &

wait
