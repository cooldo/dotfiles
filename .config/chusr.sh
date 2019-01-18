#!/bin/sh
find * -type f  | xargs -I {}  sed -i "s/test/$USER/p" {}
find * -type f  | xargs -I {}  sed -i "s/test/$USER/p" {}

