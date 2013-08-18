#!/bin/bash
# @author:  Olivier Louvignes

dirname=`dirname $0`
basename=`basename $0`
INFO="\033[32m\033[1m[INFO]\033[22m\033[39m"
WARN="\033[33m\033[1m[WARN]\033[22m\033[39m"
ERROR="\033[31m\033[1m[ERROR]\033[22m\033[39m"
CHECK="\033[32m\033[1m✔\033[22m\033[39m"
function _date  { echo `date +%Y-%m-%dT%H:%M:%S.%N | cut -b 1-23`Z; }
function _info  { echo -e `_date` "- $INFO -" $*; }
function _warn  { echo -e `_date` "- $WARN -" $*; }
function _error { echo -e `_date` "- $ERROR -" $*; }
function _done  { echo -e `_date` "- $INFO - $CHECK Done"; }

echo "$basename beginning to run at `date +%Y-%m-%dT%H:%M:%S` on `hostname`."
echo '======================================================================'

p=${1:-.};
r=${2:-};
_info "Looking for *(Copie en conflit*$r*";
find $p -type f -name "*(Copie en conflit*$r*" -print0 | while read -d $'\0' -r file ; do
  basename=$(basename "$file")
  extension="${basename##*.}"
  filename="${basename%.*}"
  clean=$(echo "$file" | sed -e 's/\s(Copie en conflit[^()]*)//g')
  _info "Prossessing $clean"
  mv -f "$file" "$clean"
  _done
done;