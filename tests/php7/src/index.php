<?php

// The following autoloader can be defined in composer.json when distributed
// https://getcomposer.org/doc/01-basic-usage.md#autoloading
// {"autoload": {"psr-4": {"": "lib/"}}}

set_include_path(__DIR__.'/lib');
spl_autoload_register(function($class) {
	$file = stream_resolve_include_path(str_replace('\\', '/', $class) .'.php');
	if ($file) include_once $file;
});

use \api\Api;
$api = new Api();

function trace($v) {
	print_r($v);
	echo PHP_EOL;
}

trace($api->getBool());
trace($api->getString());
trace($api->getInt());
trace($api->getFloat());
trace($api->getBools());
trace($api->getStrings());
trace($api->getInts());
trace($api->getFloats());
trace($api->getFloatss());
trace($api->getStringMap());

$api->getFuncVV()();
$api->getFuncSV()("native input");
$api->getFuncSSV()("native input1", "native input2");
trace($api->getFuncVS()());
trace($api->getFuncSS()("native input"));
trace($api->getFuncSSS()("native input1", "native input2"));

$api->setBool(true);
$api->setInt(123);
$api->setFloat(1.23);
$api->setString('a');
$api->setBools([true, false, true]);
$api->setInts([123, 234, 345]);
$api->setFloats([1.23, 2.34, 3.45]);
$api->setStrings(['a', 'b', 'c']);
$api->setStringMap(['a' => 1, 'b' => 2, 'c' => 3]);

$api->setFuncVV(function() {trace("setFuncVV");});
$api->setFuncSV(function($s) {trace("setFuncSV " . $s);});
$api->setFuncSSV(function($s1, $s2) {trace("setFuncSSV " . $s1 . $s2);});
$api->setFuncVS(function() {return "native ouput";});
$api->setFuncSS(function($s) {return "native output " . $s;});
$api->setFuncSSS(function($s1, $s2) {return "native output " . $s1 . $s2;});

trace('Done');