using System;
using System.Collections.Generic;
using api;

delegate void Printer();
public class Test {
	public static void Main() {
		Api api = new Api();
		
		Console.WriteLine(api.getBool());
		Console.WriteLine(api.getString());
		Console.WriteLine(api.getInt());
		Console.WriteLine(api.getFloat());
		Console.WriteLine(String.Join(",", api.getBools()));
		Console.WriteLine(String.Join(",", api.getStrings()));
		Console.WriteLine(String.Join(",", api.getInts()));
		Console.WriteLine(String.Join(",", api.getFloats()));
		
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
		
		api.setFuncVV(() => Console.WriteLine("setFuncVV"));
		api.setFuncSV((s) => Console.WriteLine("setFuncSV " + s));
		api.setFuncSSV((s1, s2) => Console.WriteLine("setFuncSSV " + s1 + s2));
		api.setFuncVS(() => "native ouput");
		api.setFuncSS((s) => "native output " + s);
		api.setFuncSSS((s1, s2) => "native output " + s1 + s2);
		
		Console.WriteLine("Done");
	}
}