
dev:
	hugo serve -D --disableFastRender

build:
	hugo --gc --minify 
	
deploy: build
	hugo deploy --target production


.PHONY: dev build deploy