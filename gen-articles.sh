#!/bin/sh

ARTICLES=$(ls ./input-articles/)

for DIR in $ARTICLES; do
    TITLE=$(cat ./input-articles/$DIR/title)
    AUTHOR=$(cat ./input-articles/$DIR/author)
    DATE=$(cat ./input-articles/$DIR/date)

    mkdir -p ./articles/$DIR

    [ -d ./input-articles/$DIR/images ] && rsync -r ./input-articles/$DIR/images ./articles/$DIR

    cat ./templates/article-header.html >./articles/$DIR/article.html

    echo "<div id='title'>
			<h1>$TITLE</h1>
			<h4>$AUTHOR | $DATE</h4>
		</div>
		<hr>" >>./articles/$DIR/article.html

    markdown -f fencedcode,footnote,dlextra ./input-articles/$DIR/article.md >>./articles/$DIR/article.html

    cat ./templates/article-footer.html >>./articles/$DIR/article.html
done
