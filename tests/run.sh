#!/bin/bash

BASEDIR=$(dirname "$0")
echo "$BASEDIR"
haxe --cwd "$BASEDIR" run.hxml --run Run $@