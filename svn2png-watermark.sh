#1/bin/bash

for fname in $(find $1 -name "*.svg")
do
	newname=$(echo $fname | sed -e 's/svg$/png/')
	echo "Found: $fname --> $newname"
	rsvg-convert $fname -o $newname

    convert $newname \
        \( -size 300x -background none -fill '#0008' -gravity center \
        label:"ask-to:lara.codeca@gmail.com" -trim -rotate -30 \
        -bordercolor none -border 10 \
        -write mpr:wm +delete \
        +clone -fill mpr:wm  -draw 'color 0,0 reset' \) \
        -compose over -composite \
        $newname
done

