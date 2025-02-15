DISTRIBUTION_ID = E3U0ZPC19HTD4P

clean:
	hugo  -cleanDestinationDir 

dev:
	hugo serve --disableFastRender

build:
	hugo --gc --minify 

cf-invalidate:
	aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths "/*"
	
deploy: build
	hugo deploy --target production


.PHONY: dev build deploy clean cf-invalidate