#!/bin/sh

OPK_NAME=zatackax-`date +'%Y%m%d'`.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Zatackax
Comment=Achtung, die Kurve!
Exec=zatackax
Terminal=false
Type=Application
StartupNotify=true
Icon=zatackax
Categories=games;
X-OD-NeedsDownscaling=true
EOF

# create opk
FLIST="zatackax"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} data"
FLIST="${FLIST} zatackax.png"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
