#!/bin/bash

pushd ../haxe
haxe build.hxml -java ../../bin/java
popd