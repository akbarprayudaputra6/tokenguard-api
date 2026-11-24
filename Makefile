.PHONY: run build test test-race docker-up docker-down

run:
	go run ./cmd/api

build:
	go build -o bin/tokenguard.exe ./cmd/api

test:
	go test -v ./...

test-race:
	go test -race -v ./...

docker-up:
	docker compose up -d

docker-down:
	docker compose down