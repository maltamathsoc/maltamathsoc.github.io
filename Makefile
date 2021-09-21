.PHONY: all gen-articles clean init get-article-list

all: gen-articles gen-article-list

gen-article-list:
	@echo "Generating article list..."
	$(shell ./gen-article-list.sh)

gen-articles: init
	@echo "Generating articles..."
	$(shell ./gen-articles.sh)

init: clean
	@echo "Init..."
	mkdir "./articles"

clean:
	@echo "Cleaning"
	rm -rf "./articles"
