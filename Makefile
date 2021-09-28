.PHONY: all clean init deploy build rebuild gen-articles regen-articles get-article-list

all: rebuild build deploy

build: gen-articles gen-article-list

rebuild: regen-articles gen-article-list

deploy:
	@echo "Deploying website..."
	@./scripts/deploy.sh

gen-article-list:
	@echo "Generating article list..."
	@./scripts/gen-article-list.sh

gen-articles: init
	@echo "Generating new articles..."
	@./scripts/gen-articles.sh

regen-articles: init
	@echo "Generating old articles..."
	@./scripts/regen-articles.sh

init: clean
	@echo "Init..."
	mkdir "./html/articles"

clean:
	@echo "Cleaning"
	rm -rf "./html/articles"
