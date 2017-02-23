#!/bin/bash

pushd ../haxe
haxe build.hxml -js ../../bin/node/api.js -lib hxnodejs
popd

cp src/index.js ../../bin/node/
cd ../../bin/node
node index.js
