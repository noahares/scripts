#!/bin/sh

destination="$1"

sxiv -o . | xargs -I '{}' mv {} $destination
