#!/bin/sh

EXTENSIONSDIR=/usr/share/inkscape/extensions/
EXTENSION=~/.config/inkscape/extensions/countersheet.py

if [ ! -d "$EXTENSIONSDIR" ]; then
    echo "Need $EXTENSIONSDIR to make counters" >&2
    exit 1
fi

if [ ! -f "$EXTENSION" ]; then
    echo "Need $EXTENSION to make counters" >&2
    exit 1
fi

cd $(dirname "$0")

if [ ! -f "low-ink.svg" ]; then
    echo "Run script in 2D directory" >&2
    exit 1
fi

export PYTHONPATH=$EXTENSIONSDIR:$PYTHONPATH

#FIXME probably use same version as SquadronLeader instead
VERSION=$(cat VERSION)

BASENAME=SquadronLeader_counters_low-ink_$VERSION
SVG=$BASENAME.svg
PDF=$BASENAME.pdf

sed s/CSVERSION/$VERSION/ < low-ink.svg > low-ink-with-version.svg

python3 $EXTENSION -d "$(pwd)/counters.csv" \
        --imagedir="$(pwd)" \
        --pdfdir="$(pwd)" \
        --registrationmarkslen=3mm \
        --registrationmarksdist=1mm \
        --outlinedist=5mm \
        low-ink-with-version.svg > $SVG \
    && mv cs_layer_0001.pdf "$PDF" \
    && rm low-ink-with-version.svg

if [ -f cs_layer_0002.pdf ]; then
    echo "WARNING: generated more than one sheet of counters"
    echo "make_countersheet.sh must be updated to handle that!"
    exit 2
fi
