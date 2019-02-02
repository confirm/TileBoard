#!/bin/bash
#
# Script to rebase the master to the upstream master and then the custom-changes
# to the new master.
#
# This is required to get the latest changes from upstream and then apply the
# custom changes on top of it. We could also go with merge instead of rebase.
# However, having a proper git history is more important, especially as we're
# in control of all working copies (force push & broken history).
#

set -e

echo "Fetching upstream…"
git fetch upstream
echo

echo "Rebasing origin to upstream master…"
git checkout master
git rebase upstream/master
echo

echo "Rebasing custom-changes to master"
git checkout custom-changes
git rebase master
echo

echo "Force pushing custom-changes…"
git push -f
echo
