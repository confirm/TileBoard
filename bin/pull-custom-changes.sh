#!/bin/bash
#
# Pull latest custom-changes.
#
# Because custom-changes is sometimes rebased and force-pushed, a simple pull
# might fail (history rewrite). Therefore delete it, pull it and check it out
# again.
#

set -e

echo "Delete custom-changes…"
git checkout master
git branch -D custom-changes
echo

echo "Pulling latest custom-changes and switching to it again…"
git pull
git checkout custom-changes
echo
