release:
	docker run --rm -v $(PWD):/ttyd -v $(PWD)/.cache:/opt -w /ttyd tsl0922/musl-cross ./scripts/cross-build.sh x86_64

clean:
	rm -rf .cache
	rm -rf build
dev-build:
	docker build -t ttyd-build:latest -f Dockerfile-alpine .
run:
	docker run -p 7681:7681  ttyd-build:latest 
# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... release : Build for x86_64"
	@echo "... clean : clean build files"
	@echo "... dev-build : build a docker image for x86_64"
	@echo "... run : run the docker image"

	
.PHONY : help
