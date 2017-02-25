package api;

import napi.types.Native;

@:expose
@:nativeGen
class Api {
	public function new() {
		trace('Intialized Api');
	}
	
	public function getBool():Native<Bool> {
		return true;
	}
	
	public function getString():Native<String> {
		return 'A string';
	}
	
	public function getInt():Native<Int> {
		return 123;
	}
	
	public function getFloat():Native<Float> {
		return 1.23;
	}
	
	public function getBools():Native<Array<Bool>> {
		return [true, false, true];
	}
	
	public function getStrings():Native<Array<String>> {
		return ['a', 'b', 'c'];
	}
	
	public function getInts():Native<Array<Int>> {
		return [123, 234, 345];
	}
	
	public function getFloats():Native<Array<Float>> {
		return [1.23, 2.34, 3.45];
	}
	
	public function getStringMap():napi.types.Map.StringMap<Int> {
		return [
			'a' => 1,
			'b' => 2,
			'c' => 3,
		];
	}
	
	public function getFuncVV():Native<Void->Void> {
		return function() {trace('getFuncVV');};
	}
	
	public function getFuncSV():Native<String->Void> {
		return function(s:String) {trace('getFuncSV $s');};
	}
	
	public function getFuncSSV():Native<String->String->Void> {
		return function(s1:String, s2:String) {trace('getFuncSSV $s1, $s2');};
	}
	
	public function getFuncVS():Native<Void->String> {
		return function() {return 'getFuncVS';};
	}
	
	public function getFuncSS():Native<String->String> {
		return function(s:String) {return 'getFuncSS $s';};
	}
	
	public function getFuncSSS():Native<String->String->String> {
		return function(s1:String, s2:String) {return 'getFuncSSS $s1, $s2';};
	}
	
	public function setBool(v:Native<Bool>) {
		trace(v);
	}
	
	public function setString(v:Native<String>) {
		trace(v);
	}
	
	public function setInt(v:Native<Int>) {
		trace(v);
	}
	
	public function setFloat(v:Native<Float>) {
		trace(v);
	}
	
	public function setBools(v:Native<Array<Bool>>) {
		trace(v.copyAsArray());
	}
	
	public function setStrings(v:Native<Array<String>>) {
		trace(v.copyAsArray());
	}
	
	public function setInts(v:Native<Array<Int>>) {
		trace(v.copyAsArray());
	}
	
	public function setFloats(v:Native<Array<Float>>) {
		trace(v.copyAsArray());
	}
	
	public function setStringMap(v:napi.types.Map.StringMap<Int>) {
		trace(v.copyToMap());
	}
	
	public function setFuncVV(f:Native<Void->Void>) {
		f.toFunc()();
		f.call();
	}
	
	public function setFuncSV(f:Native<String->Void>) {
		f.toFunc()('haxe input');
		f.call('haxe input');
	}
	
	public function setFuncSSV(f:Native<String->String->Void>) {
		f.toFunc()('haxe input1', 'haxe input2');
		f.call('haxe input1', 'haxe input2');
	}
	
	public function setFuncVS(f:Native<Void->String>) {
		trace("setFuncVS " + f.toFunc()());
		trace("setFuncVS " + f.call());
	}
	
	public function setFuncSS(f:Native<String->String>) {
		trace("setFuncSS " + f.toFunc()('haxe input'));
		trace("setFuncSS " + f.call('haxe input'));
	}
	
	public function setFuncSSS(f:Native<String->String->String>) {
		trace("setFuncSSS " + f.toFunc()('haxe input1', 'haxe input2'));
		trace("setFuncSSS " + f.call('haxe input1', 'haxe input2'));
	}
}
