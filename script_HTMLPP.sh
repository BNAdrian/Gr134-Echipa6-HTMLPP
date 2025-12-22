#!/bin/bash

if [ -z "$1" ]; then
    echo "Folosire: $0 fisier.html"
    exit 1
fi

INDENT_STR="  "
nivel=0

VOID_TAGS=" br hr img input meta link base col command embed keygen param source track wbr "

printeaza_indentare() {
    local n=$1
    local i=0
    while [ $i -lt $n ]; do
        printf "%s" "$INDENT_STR"
        i=$((i+1))
    done
}

sed -e 's/>/>\n/g' -e 's/</\n</g' "$1" | \

while read -r linie; do
    linie="${linie#"${linie%%[![:space:]]*}"}"
    linie="${linie%"${linie##*[![:space:]]}"}"
    [ -z "$linie" ] && continue

