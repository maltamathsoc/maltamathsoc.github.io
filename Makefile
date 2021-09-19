.PHONY: all gen-articles clean init get-article-list

all: gen-articles gen-article-list

ARTICLES := $(notdir $(wildcard ./input-articles/*))

gen-article-list:
	cat "./templates/article-list-header.html" > "article-list.html"
	for dir in ${ARTICLES}; do \
		echo "<li><a href=\"./articles/$$dir/article.html\">$$dir</a></li>" >> "article-list.html"; \
	done;
	cat "./templates/article-list-footer.html" >> "article-list.html"

gen-articles: init
	for dir in ${ARTICLES}; do \
		rsync -r -v "./input-articles/$$dir" "./articles/" --exclude="article.md"; \
		cat "./templates/article-header.html" > "./articles/$$dir/article.html"; \
		cmark "./input-articles/$$dir/article.md" >> "./articles/$$dir/article.html"; \
		cat "./templates/article-footer.html" >> "./articles/$$dir/article.html"; \
	done;

init: clean
	mkdir "./articles"

clean:
	rm -rf "./articles"
