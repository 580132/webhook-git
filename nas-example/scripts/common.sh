#!/bin/sh
sync_repo() {
  URL="$1"; BRANCH="$2"; DEST="$3"
  mkdir -p "$DEST"
  if [ ! -d "$DEST/.git" ]; then
    rm -rf /tmp/clone && git clone --branch "$BRANCH" "$URL" /tmp/clone
    cp -a /tmp/clone/. "$DEST/"; rm -rf /tmp/clone
  else
    cd "$DEST" && git fetch origin && git reset --hard "origin/$BRANCH" && git clean -fd
  fi
}
