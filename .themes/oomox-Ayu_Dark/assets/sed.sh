#!/bin/sh
sed -i \
         -e 's/#0D1017/rgb(0%,0%,0%)/g' \
         -e 's/#BFBDB6/rgb(100%,100%,100%)/g' \
    -e 's/#0B0E14/rgb(50%,0%,0%)/g' \
     -e 's/#BFBDB6/rgb(0%,50%,0%)/g' \
     -e 's/#0D1017/rgb(50%,0%,50%)/g' \
     -e 's/#BFBDB6/rgb(0%,0%,50%)/g' \
	"$@"
