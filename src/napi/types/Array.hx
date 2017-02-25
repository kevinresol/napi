package napi.types;

import Array as StdArray;

#if js
typedef Impl<T> = StdArray<T>;
#elseif cs
typedef Impl<T> = cs.system.collections.generic.List_1<T>;
#end

@:dce abstract Array<T>(Impl<T>) from Impl<T> {
	@:from public static inline function copyFromArray<T>(v:StdArray<T>):Array<T> {
		#if cs 
			var arr = new Impl();
			for(i in v) arr.Add(i);
			return arr;
		#else
			return v.copy();
		#end
	}
	
	@:to public inline function copyAsArray():StdArray<T> {
		#if cs
			var arr = [];
			var iter = this.GetEnumerator();
			while(iter.MoveNext()) arr.push(iter.Current);
			return arr;
		#else
			return this.copy();
		#end
	}
}