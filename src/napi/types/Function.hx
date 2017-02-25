package napi.types;

// TODO: remove @:generic when the generator properly generates the type parameters

//@:genericBuild()
@:nativeGen
class Function<T> {
	var f:T;
	public function new(f:T)
		this.f = f;
}

class Function0<T> implements Func0<T> {
	public function new() {
		
	}
	public function invoke():T
		throw 'unimplemented';
}

interface Func0V {function invoke():Void;}

@:nativeGen
interface Func0<R> {function invoke():R;}

@:nativeGen
interface Func1<T0, R> {function invoke(p0:T0):R;}