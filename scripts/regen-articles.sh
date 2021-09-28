#!/bin/sh

pwd

ROOT="."

OLD_DIR="$ROOT/markdown/articles/old"
OUT_DIR="$ROOT/html/articles"
TEMPLATES="$ROOT/templates"

ARTICLES=$(ls "$OLD_DIR")

rm -rf "$OUT_DIR"

for DIR in $ARTICLES; do
    TITLE=$(cat "$OLD_DIR/$DIR/title")
    AUTHOR=$(cat "$OLD_DIR/$DIR/author")
    DATE=$(cat "$OLD_DIR/$DIR/date")

    mkdir -p "$OUT_DIR/$DIR"

    [ -d "$OLD_DIR/$DIR/images" ] && rsync -r "$OLD_DIR/$DIR/images" "$OUT_DIR/$DIR"

    cat "$TEMPLATES/article-header.html" >"$OUT_DIR/$DIR/article.html"

    echo "<div id='title'>
			<h1>$TITLE</h1>
			<h4 class='author-date'>$AUTHOR - $DATE</h4>
		</div>
		<hr>" >>"$OUT_DIR/$DIR/article.html"

    pandoc -f markdown -t html "$OLD_DIR/$DIR/article.md" >>"$OUT_DIR/$DIR/article.html"

    cat "$TEMPLATES/article-footer.html" >>"$OUT_DIR/$DIR/article.html"
done
