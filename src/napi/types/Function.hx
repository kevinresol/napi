package napi.types;

@:genericBuild(napi.types.Macro.buildFunction())
class Function<Rest> {}

#if js
typedef Action__0 = Void->Void;
typedef Action__1<T1> = T1->Void;
typedef Action__2<T1, T2> = T1->T2->Void;
typedef Func__0<R> = Void->R;
typedef Func__1<T1, R> = T1->R;
typedef Func__2<T1, T2, R> = T1->T2->R;
#elseif cs
@:native('System.Action') extern class Action__0 {}
@:native('System.Action') extern class Action__1<T1> {}
@:native('System.Action') extern class Action__2<T1, T2> {}
@:native('System.Func') extern class Func__0<R> {}
@:native('System.Func') extern class Func__1<T1, R> {}
@:native('System.Func') extern class Func__2<T1, T2, R> {}
#end

@:dce abstract Action_0(Action__0) from Action__0 {
	@:from public static inline function ofFunc(f:Void->Void)
		return #if cs untyped __cs__('() => {0}',f()); #else f; #end
	public inline function call()
		#if cs untyped __cs__('{0}()', this); #else this(); #end
}


@:dce abstract Action_1<T1>(Action__1<T1>) from Action__1<T1> {
	@:from public static inline function ofFunc<T1>(f:T1->Void)
		return #if cs untyped __cs__('(p1) => {0}', f(p1)); #else f; #end
	public inline function call(p1:T1)
		#if cs untyped __cs__('{0}({1})', this, p1); #else this(p1); #end
}

@:dce abstract Action_2<T1, T2>(Action__2<T1, T2>) from Action__2<T1, T2> {
	@:from public static inline function ofFunc<T1, T2>(f:T1->T2->Void)
		return #if cs untyped __cs__('(p1, p2) => {0}', f(p1, p2)); #else f; #end
	public inline function call(p1:T1, p2:T2)
		#if cs untyped __cs__('{0}({1}, {2})', this, p1, p2); #else this(p1, p2); #end
}


@:dce abstract Func_0<R>(Func__0<R>) from Func__0<R> {
	@:from public static inline function ofFunc<R>(f:Void->R)
		return #if cs untyped __cs__('() => {0}', f()); #else f; #end
	public inline function call():R
		return #if cs untyped __cs__('{0}()', this); #else this(); #end
}


@:dce abstract Func_1<T1, R>(Func__1<T1, R>) from Func__1<T1, R> {
	@:from public static inline function ofFunc<T1, R>(f:T1->R)
		return #if cs untyped __cs__('(p1) => {0}', f(p1)); #else f; #end
	public inline function call(p1:T1):R
		return #if cs untyped __cs__('{0}({1})', this, p1); #else this(p1); #end
}

@:dce abstract Func_2<T1, T2, R>(Func__2<T1, T2, R>) from Func__2<T1, T2, R> {
	@:from public static inline function ofFunc<T1, T2, R>(f:T1->T2->R)
		return #if cs untyped __cs__('(p1, p2) => {0}', f(p1, p2)); #else f; #end
	public inline function call(p1:T1, p2:T2):R
		return #if cs untyped __cs__('{0}({1}, {2})', this, p1, p2); #else this(p1, p2); #end
}