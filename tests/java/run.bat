cd ..\haxe
haxe build.hxml -java ..\..\bin\java
if %errorlevel% neq 0 exit /b %errorlevel%

cd ..\java
if not exist "..\..\bin\java\tests" mkdir ..\..\bin\java\tests
javac -cp ".;..\..\bin\java\java.jar" -d ..\..\bin\java\tests src\Main.java
if %errorlevel% neq 0 exit /b %errorlevel%

cd ..\..\bin\java
java -cp "./java.jar;tests" Main
if %errorlevel% neq 0 exit /b %errorlevel%

