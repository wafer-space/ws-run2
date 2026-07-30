#!/bin/sh
set -Ce
cat G802-part-* > G802.oas
echo "57fa57f52eac82835a051f2a353e5a30  G802.oas" | md5sum -c
