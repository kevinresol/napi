using System;
using api;

delegate void Printer();
public class Test {
	public static void Main() {
		Api api = new Api();
		
		Console.WriteLine(api.getString());
		Console.WriteLine(api.getInt());
		Console.WriteLine(api.getFloat());
		
		api.getFuncVV()();
		api.getFuncSV()("native input");
		api.getFuncSSV()("native input1", "native input2");
		Console.WriteLine(api.getFuncVS()());
		Console.WriteLine(api.getFuncSS()("native input"));
		Console.WriteLine(api.getFuncSSS()("native input1", "native input2"));
		
		api.setFuncVV(() => Console.WriteLine("setFuncVV"));
		api.setFuncSV((s) => Console.WriteLine("setFuncSV " + s));
		api.setFuncSSV((s1, s2) => Console.WriteLine("setFuncSSV " + s1 + s2));
		api.setFuncVS(() => "native ouput");
		api.setFuncSS((s) => "native output " + s);
		api.setFuncSSS((s1, s2) => "native output " + s1 + s2);
		
	}
}