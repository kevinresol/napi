package napi.types;

import Array as StdArray;

#if js
private typedef Impl<T> = StdArray<T>;
#elseif cs
private typedef Impl<T> = cs.system.collections.generic.List_1<T>;
#elseif php7
// We can't use php.NativeIndexedArray<T> because the @:from/@:to methods interfere with those below
private typedef Impl<T> = php.NativeArray;
#end

@:dce abstract Array<T>(Impl<T>) from Impl<T> {
	@:from public static inline function copyFromArray<T>(v:StdArray<T>):Array<T> {
		#if js
			return v.copy();
		#elseif cs 
			var arr = new Impl();
			for(i in v) arr.Add(i);
			return arr;
		#elseif php7
			return cast @:privateAccess v.arr;
		#end
	}
	
	@:to public inline function copyAsArray():StdArray<T> {
		#if js
			return this.copy();
		#elseif cs
			var arr = [];
			var iter = this.GetEnumerator();
			while(iter.MoveNext()) arr.push(iter.Current);
			return arr;
		#elseif php7
			return @:privateAccess StdArray.wrap(this);
		#end
	}
}