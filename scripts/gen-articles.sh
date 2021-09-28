#!/bin/sh

pwd

ROOT="."

OLD_DIR="$ROOT/markdown/articles/old"
NEW_DIR="$ROOT/markdown/articles/new"
OUT_DIR="$ROOT/html/articles"
TEMPLATES="$ROOT/templates"

ARTICLES=$(ls "$NEW_DIR")
OLD_COUNT=$(ls "$OLD_DIR" | wc -l)

C=$OLD_COUNT

for DIR in $ARTICLES; do
    C=$(($C + 1))

    TITLE=$(cat "$NEW_DIR/$DIR/title")
    AUTHOR=$(cat "$NEW_DIR/$DIR/author")
    DATE=$(cat "$NEW_DIR/$DIR/date")

    mkdir -p "$OUT_DIR/$C"

    [ -d "$NEW_DIR/$DIR/images" ] && rsync -r "$NEW_DIR/$DIR/images" "$OUT_DIR/$C"

    cat "$TEMPLATES/article-header.html" >"$OUT_DIR/$C/article.html"

    echo "<div id='title'>
			<h1>$TITLE</h1>
			<h4 class='author-date'>$AUTHOR - $DATE</h4>
		</div>
		<hr>" >>"$OUT_DIR/$C/article.html"

    pandoc -f markdown -t html "$NEW_DIR/$DIR/article.md" >>"$OUT_DIR/$C/article.html"

    cat "$TEMPLATES/article-footer.html" >>"$OUT_DIR/$C/article.html"

	mv "$NEW_DIR/$DIR" "$OLD_DIR/$C"
done
