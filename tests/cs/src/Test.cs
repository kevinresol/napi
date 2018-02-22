using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using api;

delegate void Printer();
public class Test {
	static int success;
	static int errors;
	public static void Main() {
		success = 0;
		errors = 0;
		Api api = new Api();
		
		Assert(api.getBool());
		Assert(api.getString().Equals("string"));
		Assert(api.getInt() == 123);
		Assert(api.getFloat() == 1.23);
		Assert(String.Join(",", api.getBools()).Equals("True,False,True"));
		Assert(String.Join(",", api.getStrings()).Equals("a,b,c"));
		Assert(String.Join(",", api.getInts()).Equals("123,234,345"));
		Assert(String.Join(",", api.getFloats()).Equals("1.23,2.34,3.45"));
		Console.WriteLine(String.Join(",", api.getFloatss()));
		Assert(String.Join(",", api.getStringMap()).Equals("[a, 1],[b, 2],[c, 3]"));
		
		api.getFuncVV()();
		api.getFuncSV()("native input");
		api.getFuncSSV()("native input1", "native input2");
		Console.WriteLine(api.getFuncVS()());
		Console.WriteLine(api.getFuncSS()("native input"));
		Console.WriteLine(api.getFuncSSS()("native input1", "native input2"));
		
		api.setBool(true);
		api.setString("a");
		api.setInt(123);
		api.setFloat(1.23);
		api.setBools(new List<bool> {true, false, true});
		api.setStrings(new List<string> {"a", "b", "c"});
		api.setInts(new List<int> {123, 234, 345});
		api.setFloats(new List<double> {1.23, 2.34, 3.45});
		api.setStringMap(new Dictionary<string, int>{{"a", 1}, {"b", 2}, {"c", 3}});
		
		api.setFuncVV(() => Console.WriteLine("setFuncVV"));
		api.setFuncSV((s) => Console.WriteLine("setFuncSV " + s));
		api.setFuncSSV((s1, s2) => Console.WriteLine("setFuncSSV " + s1 + s2));
		api.setFuncVS(() => "native ouput");
		api.setFuncSS((s) => "native output " + s);
		api.setFuncSSS((s1, s2) => "native output " + s1 + s2);
		
		Console.WriteLine("================================");
		Console.WriteLine(success + " Success, " + errors + " Errors");
		Environment.Exit(errors);
	}
	
	static void Assert(bool v, [CallerLineNumber] int line = 0) {
		if(!v) {
			errors++;
			Console.WriteLine("Errored at line: " + line);
		} else {
			success++;
		}
	}
}