.PHONY: all gen-articles clean init get-article-list

all: gen-articles gen-article-list

ARTICLES := $(notdir $(wildcard ./input-articles/*))

gen-article-list:
	@echo "Generating article list..."
	$(shell ./gen-article-list.sh)

gen-articles: init
	@echo "Generating articles..."
	@for dir in ${ARTICLES}; do \
		rsync -r "./input-articles/$$dir" "./articles/" --exclude="article.md"; \
		cat "./templates/article-header.html" > "./articles/$$dir/article.html"; \
		cmark --unsafe "./input-articles/$$dir/article.md" >> "./articles/$$dir/article.html"; \
		cat "./templates/article-footer.html" >> "./articles/$$dir/article.html"; \
	done;

init: clean
	mkdir "./articles"

clean:
	rm -rf "./articles"
