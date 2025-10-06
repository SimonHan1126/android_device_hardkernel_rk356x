APK=/home/simonhan1126/Downloads/Magisk-v29.0.apk
WORK=$(mktemp -d); unzip -q "$APK" -d "$WORK"; chmod +x "$WORK"/assets/*

cp magisk_patched-boot.img "$WORK"/
cd "$WORK"
./assets/magiskboot unpack magisk_patched-boot.img

# Inspect ramdisk contents
mkdir r && (cd r && cpio -id < ../ramdisk.cpio 2>/dev/null)
find r -maxdepth 2 -iname '*magisk*'
