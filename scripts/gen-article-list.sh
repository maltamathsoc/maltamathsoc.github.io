#!/bin/sh

pwd

ROOT="."

OLD_DIR="$ROOT/markdown/articles/old"
OUT_DIR="$ROOT/../html/articles"
TEMPLATES="$ROOT/templates"
LISTS="$ROOT/lists"

ARTICLES=$(ls "$OLD_DIR")
LENGTH=$(ls "$OLD_DIR" | wc -l)
NOPAGES=$LENGTH

if [ $(($NOPAGES % 15)) -eq 0 ]; then
    NOLISTS=$(($NOPAGES / 15))
else
    NOLISTS=$(($NOPAGES / 15 + 1))
fi

LIST=1
COUNT=1

mkdir -p $LISTS

cat "$TEMPLATES/article-list-header.html" >"$LISTS/article-list-$LIST.html"

for DIR in $(seq $LENGTH -1 1); do
    if [ $COUNT -gt 15 ]; then
        if [ $LIST -eq 1 ]; then
            echo "<hr>
				<div class='footer'>
				<span class='page'>Page $LIST of $NOLISTS</span>
				<a href='./article-list-$((LIST + 1)).html' class='right'><span class="material-icons">
				chevron_right
				</span></a>
				</div>" >>"$LISTS/article-list-$LIST.html"
        else
            echo "<hr>
				<div class='footer'>
				<a href='./article-list-$((LIST - 1)).html' class='left'><span class="material-icons">
				chevron_left
				</span></a>
				<span class='page'>Page $LIST of $NOLISTS</span>
				<a href='./article-list-$((LIST + 1)).html' class='right'><span class="material-icons">
				chevron_right
				</span></a>
				</div>" >>"$LISTS/article-list-$LIST.html"
        fi

        cat "$TEMPLATES/article-list-footer.html" >>"$LISTS/article-list-$LIST.html"
        LIST=$(($LIST + 1))
        COUNT=1
        LENGTH=$(($LENGTH - 15))
        cat "$TEMPLATES/article-list-header.html" >"$LISTS/article-list-$LIST.html"
    fi

    TITLE=$(cat "$OLD_DIR/$DIR/title")
    AUTHOR=$(cat "$OLD_DIR/$DIR/author")
    DATE=$(cat "$OLD_DIR/$DIR/date")
    DESC="$OLD_DIR/$DIR/desc.md"

    if [ $COUNT -lt $LENGTH ] && [ $COUNT -lt 15 ]; then
        echo "<div class='article'>
			<h2 class='title'><a href='$OUT_DIR/$DIR/article.html'>$TITLE</a></h2>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>" >>"$LISTS/article-list-$LIST.html"

        if [ -s "$DESC" ]; then
            pandoc -f markdown -t html "$DESC" >>"$LISTS/article-list-$LIST.html"
            echo "<p class='read-more'>
				<a href='$OUT_DIR/$DIR/article.html'>Read More...</a>
				</p>" >>"$LISTS/article-list-$LIST.html"
        fi

        echo "</div>
			<hr>" >>"$LISTS/article-list-$LIST.html"
    else
        echo "<div class='article'>
			<h2 class='title'><a href='$OUT_DIR/$DIR/article.html'>$TITLE</a></h2>
			<p class='date'>$DATE</p>
			<p class='author'>$AUTHOR</p>" >>"$LISTS/article-list-$LIST.html"

        if [ -s "$DESC" ]; then
            pandoc -f markdown -t html "$DESC" >>"$LISTS/article-list-$LIST.html"
            echo "<p class='read-more'>
				<a href='$OUT_DIR/$DIR/article.html'>Read More...</a>
				</p>" >>"$LISTS/article-list-$LIST.html"
        fi

        echo "</div>" >>"$LISTS/article-list-$LIST.html"
    fi

    COUNT=$(($COUNT + 1))
done

if [ $NOLISTS -gt 1 ]; then
    echo "<hr>
		<div class='footer'>
		<a href='./article-list-$((LIST - 1)).html' class='left'><span class='material-icons'>
		chevron_left
		</span></a>
		<span class='page'>Page $LIST of $NOLISTS</span>
		</div>" >>"$LISTS/article-list-$LIST.html"
fi

cat "$TEMPLATES/article-list-footer.html" >>"$LISTS/article-list-$LIST.html"
