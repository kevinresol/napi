package napi.types;

@:genericBuild(napi.types.Macro.buildFunction())
class Function<Rest> {}


#if cs
@:native('System.Action') extern class Action__0 {}
@:dce abstract Action_0(Action__0) {
	@:from public static inline function ofFunc(f:Void->Void)
		return untyped __cs__('() => {0}', (function() f())());
}

@:native('System.Action') extern class Action__1<T1> {}
@:dce abstract Action_1<T1>(Action__1<T1>) {
	@:from public static inline function ofFunc<T1>(f:T1->Void)
		return untyped __cs__('(t1) => {0}', (function(t1:T1) f(t1))(t1));
}
@:native('System.Action') extern class Action__2<T1, T2> {}
@:dce abstract Action_2<T1, T2>(Action__2<T1, T2>) {
	@:from public static inline function ofFunc<T1, T2>(f:T1->T2->Void)
		return untyped __cs__('(t1, t2) => {0}', (function(t1:T1, t2:T2) f(t1, t2))(t1, t2));
}

@:native('System.Func') extern class Func__0<R> {}
@:dce abstract Func_0<R>(Func__0<R>) {
	@:from public static inline function ofFunc<R>(f:Void->R)
		return untyped __cs__('() => {0}', (function() f())());
}

@:native('System.Func') extern class Func__1<T1, R> {}
@:dce abstract Func_1<T1, R>(Func__1<T1, R>) {
	@:from public static inline function ofFunc<T1, R>(f:T1->R)
		return untyped __cs__('(t1) => {0}', (function(t1) f(t1))(t1));
}
@:native('System.Func') extern class Func__2<T1, T2, R> {}
@:dce abstract Func_2<T1, T2, R>(Func__2<T1, T2, R>) {
	@:from public static inline function ofFunc<T1, T2, R>(f:T1->T2->R)
		return untyped __cs__('(t1, t2) => {0}', (function(t1, t2) f(t1, t2))(t1, t2));
}
#end