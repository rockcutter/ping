
.PHONY: build run clean compose/up compose/down compose/logs

build:
	docker build -t cppplayground .

run: build
	docker run --rm --init -p 8080:8080 cppplayground

compose/up:
	docker compose up --build -d 
	docker compose logs -f

compose/down:
	docker compose down

compose/logs:
	docker compose logs -f

deps:
	vcpkg install --triplet x64-linux

local/build:
	cmake --preset debug
	cmake --build build/debug
