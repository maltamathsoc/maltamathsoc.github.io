.PHONY: deploy all gen-articles clean init get-article-list build

all: build deploy

build: gen-articles gen-article-list

deploy:
	@echo "Deploying website..."
	@./deploy.sh

gen-article-list:
	@echo "Generating article list..."
	@./gen-article-list.sh

gen-articles: init
	@echo "Generating articles..."
	@./gen-articles.sh

init: clean
	@echo "Init..."
	mkdir "./articles"

clean:
	@echo "Cleaning"
	rm -rf "./articles"
