package api;

import napi.types.Function;

@:expose
@:nativeGen
class Api {
	public function new() {
		trace('Intialized Api');
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
	
	public function setFuncVV(f:Function<Void->Void>) {
		f.call();
	}
	
	public function setFuncSV(f:Function<String->Void>) {
		f.call('haxe input');
	}
	
	public function setFuncSSV(f:Function<String->String->Void>) {
		f.call('haxe input1', 'haxe input2');
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
