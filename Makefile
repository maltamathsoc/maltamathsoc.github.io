.PHONY: all gen-articles clean init get-article-list

all: gen-articles gen-article-list

ARTICLES := $(notdir $(wildcard ./input-articles/*))

gen-article-list:
	@echo "Generating article list..."
	$(shell ./gen-article-list.sh)

gen-articles: init
	@echo "Generating articles..."
	$(shell ./gen-articles.sh)

init: clean
	mkdir "./articles"

clean:
	rm -rf "./articles"
