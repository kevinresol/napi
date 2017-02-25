package api;

import napi.types.Function;

@:expose
@:nativeGen
class Api {
	public function new() {
		trace('Intialized Api');
		var f:Function<Void->Void> = null;
		// var f:Function<Int->Void> = null;
		// var f:Function<Void->Int> = null;
		// var f:Function<Int->Int> = null;
		trace(f);
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
	// public function getFuncVV():Func {
	// 	return function() {trace('getFuncVV')};
	// }
	
	function foo() return 234;
}
