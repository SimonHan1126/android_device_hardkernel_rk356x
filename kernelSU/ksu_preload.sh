#!/system/bin/sh
set -e
SRC=/system/etc/ksu_allowlist.bin
DST_DIR=/data/adb/ksu
DST=$DST_DIR/.allowlist

log -t KSU_PRELOAD "start"
if [ -f "$SRC" ]; then
  mkdir -p "$DST_DIR"
  cp "$SRC" "$DST"
  chown 0:0 "$DST"
  chmod 0600 "$DST"
  restorecon -RF "$DST_DIR" 2>/dev/null || true
  setprop ksu.preload.done 1
  log -t KSU_PRELOAD "copied allowlist"
else
  log -t KSU_PRELOAD "no SRC allowlist"
fi