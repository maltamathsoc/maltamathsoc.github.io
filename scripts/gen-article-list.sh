#!/bin/sh

pwd

ROOT="."

IN_DIR="$ROOT/markdown/articles"
OUT_DIR="$ROOT/html/articles"
TEMPLATES="$ROOT/templates"

ARTICLES=$(ls "$IN_DIR")
LENGTH=$(ls "$IN_DIR" | wc -l)

cat "$TEMPLATES/article-list-header.html" >"$ROOT/article-list.html"

COUNT=1

for DIR in $ARTICLES; do
    DIR=$(($LENGTH - $DIR + 1))
    TITLE=$(cat "$IN_DIR/$DIR/title")
    AUTHOR=$(cat "$IN_DIR/$DIR/author")
    DATE=$(cat "$IN_DIR/$DIR/date")
    DESC="$IN_DIR/$DIR/desc.md"

    if [ $COUNT -lt $LENGTH ]; then
        echo "<div class='article'>
			<h2 class='title'><a href='$OUT_DIR/$DIR/article.html'>$TITLE</a></h2>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>" >>"$ROOT/article-list.html"

        if [ -s "$DESC" ]; then
            pandoc -f markdown -t html "$DESC" >>"$ROOT/article-list.html"
            echo "<p class='read-more'>
				<a href='$OUT_DIR/$DIR/article.html'>Read More...</a>
				</p>" >>"$ROOT/article-list.html"
        fi

        echo "</div>
			<hr>" >>"$ROOT/article-list.html"
    else
        echo "<div class='article'>
			<h2 class='title'><a href='$OUT_DIR/$DIR/article.html'>$TITLE</a></h2>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>" >>"$ROOT/article-list.html"

        if [ -s "$DESC" ]; then
            pandoc -f markdown -t html "$DESC" >>"$ROOT/article-list.html"
            echo "<p class='read-more'>
				<a href='$OUT_DIR/$DIR/article.html'>Read More...</a>
				</p>" >>"$ROOT/article-list.html"
        fi

        echo "</div>" >>"$ROOT/article-list.html"
    fi

    COUNT=$(($COUNT + 1))
done

cat "$TEMPLATES/article-list-footer.html" >>"$ROOT/article-list.html"
