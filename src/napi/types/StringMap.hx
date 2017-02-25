package napi.types;

import Map as StdMap;
import haxe.ds.StringMap as StdStringMap;

#if cs
private typedef Impl<T> = cs.system.collections.generic.Dictionary_2<String, T>;
#elseif js
private typedef Impl<T> = {};
#end

@:dce abstract StringMap<V>(Impl<V>) #if !js from Impl<V> #end {
	@:from
	public static inline function copyFromMap<V>(v:StdMap<String, V>):StringMap<V> {
		return copyFromStringMap(v);
	}
	
	@:from
	static inline function copyFromStringMap<V>(v:StdStringMap<V>):StringMap<V> {
		#if cs
			var ret = new Impl<V>();
			for(key in v.keys()) ret.Add(key, v.get(key));
			return ret;
		#elseif js
			var ret = {};
			for(key in v.keys()) Reflect.setField(ret, key, v.get(key));
			return cast ret;
		#end
	}
	
	@:to
	public inline function copyToMap():StdMap<String, V> {
		return copyToStringMap();
	}
	
	@:to
	inline function copyToStringMap():StdStringMap<V> {
		var ret = new StdStringMap();
		#if cs
			var iter = this.GetEnumerator();
			while(iter.MoveNext()) ret.set(iter.Current.Key, iter.Current.Value);
		#elseif js
			for(key in Reflect.fields(this)) ret.set(key, Reflect.field(this, key));
		#end
		return ret;
	}
}