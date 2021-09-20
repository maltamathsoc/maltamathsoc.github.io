#!/bin/sh

ARTICLES=$(ls ./input-articles/)

cat ./templates/article-list-header.html >./article-list.html

for DIR in $ARTICLES; do
    TITLE=$(cat ./input-articles/$DIR/title)
    AUTHOR=$(cat ./input-articles/$DIR/author)
    DATE=$(cat ./input-articles/$DIR/date)

    echo "<div>
			<h3><a href='./articles/$DIR/article.html'>$TITLE</a></h3>
			<h4>$AUTHOR</h4>
			<h5>$DATE</h5>
		</div>" >>./article-list.html
done

cat ./templates/article-list-footer.html >>./article-list.html
