#!/usr/bin/bash

SYSSOFT=.syssoft
if [ -e "$SYSSOFT" ]; then
	cat "$SYSSOFT" | xargs sudo apt install -y
else
	echo "$SYSSOFT not found, no system software will be installed."
fi

CUSTOMSOFT=.customsoft.sh
if [ -e "$CUSTOMSOFT" ]; then
	chmod a+x "$CUSTOMSOFT"
	./"$CUSTOMSOFT"
else
	echo "$CUSTOMSOFT not found, no custom software will be installed."
fi
