.PHONY: deploy all gen-articles clean init get-article-list build

all: build deploy

build: gen-articles gen-article-list

deploy:
	@echo "Deploying website..."
	@./scripts/deploy.sh

gen-article-list:
	@echo "Generating article list..."
	@./scripts/gen-article-list.sh

gen-articles: init
	@echo "Generating articles..."
	@./scripts/gen-articles.sh

init: clean
	@echo "Init..."
	mkdir "./html/articles"

clean:
	@echo "Cleaning"
	rm -rf "./html/articles"
