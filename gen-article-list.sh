#!/bin/sh

ARTICLES=$(ls ./input-articles/)

LENGTH=$(ls ./input-articles | wc -l)

cat ./templates/article-list-header.html >./article-list.html

COUNT=1

for DIR in $ARTICLES; do
    TITLE=$(cat ./input-articles/$DIR/title)
    AUTHOR=$(cat ./input-articles/$DIR/author)
    DATE=$(cat ./input-articles/$DIR/date)

    if [ $COUNT -lt $LENGTH ]; then
        echo "<div class='article'>
			<p class='title'><a href='./articles/$DIR/article.html'>$TITLE</a></p>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>
			</div>
		<hr>" >>./article-list.html
    else
        echo "<div class='article'>
			<p class='title'><a href='./articles/$DIR/article.html'>$TITLE</a></p>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>
		</div>" >>./article-list.html
    fi

    COUNT=$(($COUNT + 1))
done

cat ./templates/article-list-footer.html >>./article-list.html
