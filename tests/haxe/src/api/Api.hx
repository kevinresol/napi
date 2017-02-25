package api;

import napi.types.Function;

@:expose
@:nativeGen
class Api {
	public function new() {
		trace('Intialized Api');
	}
	
	public function test():Func0V {
		return new MyFunc0V();
	}
	
	public function test1():Func0<Int> {
		return new MyFunc0();
	}
	
	public function test2():Func1<Int, Int> {
		return new MyFunc1(function(v) return v * v);
	}
	
	public function test3() {
		return new Function<Int>(1);
	}
}
class MyFunc0V implements Func0V {
	public function new() {}
	public function invoke():Void {
		trace('my func0');
	}
}
@:nativeGen
class MyFunc0 implements Func0<Int> {
	public function new() {}
	public function invoke() {
		return 1;
	}
}
@:nativeGen
class MyFunc1 implements Func1<Int, Int> {
	var f:Int->Int;
	public function new(f:Int->Int) {
		this.f = f;
	}
	public function invoke(v) {
		return f(v);
	}
}