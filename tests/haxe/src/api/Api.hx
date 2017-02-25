package api;

import napi.types.Function;
import napi.types.Array;

@:expose
@:nativeGen
class Api {
	public function new() {
		trace('Intialized Api');
	}
	
	public function getBool():Bool {
		return true;
	}
	
	public function getString():String {
		return 'A string';
	}
	
	public function getInt():Int {
		return 123;
	}
	
	public function getFloat():Float {
		return 1.23;
	}
	
	public function getBools():Array<Bool> {
		return [true, false, true];
	}
	
	public function getStrings():Array<String> {
		return ['a', 'b', 'c'];
	}
	
	public function getInts():Array<Int> {
		return [123, 234, 345];
	}
	
	public function getFloats():Array<Float> {
		return [1.23, 2.34, 3.45];
	}
	
	public function getFuncVV():Function<Void->Void> {
		return function() {trace('getFuncVV');};
	}
	
	public function getFuncSV():Function<String->Void> {
		return function(s:String) {trace('getFuncSV $s');};
	}
	
	public function getFuncSSV():Function<String->String->Void> {
		return function(s1:String, s2:String) {trace('getFuncSSV $s1, $s2');};
	}
	
	public function getFuncVS():Function<Void->String> {
		return function() {return 'getFuncVS';};
	}
	
	public function getFuncSS():Function<String->String> {
		return function(s:String) {return 'getFuncSS $s';};
	}
	
	public function getFuncSSS():Function<String->String->String> {
		return function(s1:String, s2:String) {return 'getFuncSSS $s1, $s2';};
	}
	
	public function setFuncVV(f:Function<Void->Void>) {
		f.call();
	}
	
	public function setFuncSV(f:Function<String->Void>) {
		f.call('haxe input');
	}
	
	public function setFuncSSV(f:Function<String->String->Void>) {
		f.call('haxe input1', 'haxe input2');
	}
	
	public function setBool(v:Bool) {
		trace(v);
	}
	
	public function setString(v:String) {
		trace(v);
	}
	
	public function setInt(v:Int) {
		trace(v);
	}
	
	public function setFloat(v:Float) {
		trace(v);
	}
	
	public function setBools(v:Array<Bool>) {
		trace(v.copyAsArray());
	}
	
	public function setStrings(v:Array<String>) {
		trace(v.copyAsArray());
	}
	
	public function setInts(v:Array<Int>) {
		trace(v.copyAsArray());
	}
	
	public function setFloats(v:Array<Float>) {
		trace(v.copyAsArray());
	}
	
	public function setFuncVS(f:Function<Void->String>) {
		trace("setFuncVS " + f.call());
	}
	
	public function setFuncSS(f:Function<String->String>) {
		trace("setFuncSS " + f.call('haxe input'));
	}
	
	public function setFuncSSS(f:Function<String->String->String>) {
		trace("setFuncSSS " + f.call('haxe input1', 'haxe input2'));
	}
}
