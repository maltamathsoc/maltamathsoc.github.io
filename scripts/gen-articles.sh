#!/bin/sh

pwd

ROOT="."

IN_DIR="$ROOT/markdown/articles"
OUT_DIR="$ROOT/html/articles"
TEMPLATES="$ROOT/templates"

ARTICLES=$(ls $IN_DIR)

for DIR in $ARTICLES; do
    TITLE=$(cat "$IN_DIR/$DIR/title")
    AUTHOR=$(cat "$IN_DIR/$DIR/author")
    DATE=$(cat "$IN_DIR/$DIR/date")

    mkdir -p "$OUT_DIR/$DIR"

    [ -d "$IN_DIR/$DIR/images" ] && rsync -r "$IN_DIR/$DIR/images" "$OUT_DIR/$DIR"

    cat "$TEMPLATES/article-header.html" >"$OUT_DIR/$DIR/article.html"

    echo "<div id='title'>
			<h1>$TITLE</h1>
			<h4 class='author-date'>$AUTHOR - $DATE</h4>
		</div>
		<hr>" >>"$OUT_DIR/$DIR/article.html"

    pandoc -f markdown -t html "$IN_DIR/$DIR/article.md" >>"$OUT_DIR/$DIR/article.html"

    cat "$TEMPLATES/article-footer.html" >>"$OUT_DIR/$DIR/article.html"
done
