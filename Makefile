.PHONY: build clean deploy

build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello services/hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world services/world/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/test services/test/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
