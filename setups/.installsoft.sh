#!/usr/bin/bash

set -e

PREINSTALL=.preinstall.sh
SYSSOFT=.syssoft
CUSTOMSOFT=.custominstall.sh

if [ ! -f "$PREINSTALL" -o ! -f "$SYSSOFT" -o ! -f "$CUSTOMSOFT" ]; then
	"$PREINSTALL or $SYSSOFT or $CUSTOMSOFT is missing."
	exit 1
fi

echo "Starting the installation. . ."


chmod a+x "$PREINSTALL"
./"$PREINSTALL"

cat "$SYSSOFT" | xargs sudo apt install -y

chmod a+x "$CUSTOMSOFT"
./"$CUSTOMSOFT"


