DISTRIBUTION_ID = E3U0ZPC19HTD4P

dev:
	hugo serve -D --disableFastRender

build:
	hugo --gc --minify 

cf-invalidate:
	aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths "/*"
	
deploy: build
	hugo deploy --target production


.PHONY: dev build deploy