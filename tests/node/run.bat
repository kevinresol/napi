cd ..\haxe
haxe build.hxml -js ..\..\bin\node\api.js -lib hxnodejs
cd ..\node

xcopy /s/y src\index.js ..\..\bin\node\
cd ..\..\bin\node
node index.js
