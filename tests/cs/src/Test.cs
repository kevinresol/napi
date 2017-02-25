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
		api.getFuncSV()("my input");
		api.getFuncSSV()("my input1", "my input2");
		Console.WriteLine(api.getFuncVS()());
		Console.WriteLine(api.getFuncSS()("my input"));
		Console.WriteLine(api.getFuncSSS()("my input1", "my input2"));
		
		Func<int> f = () => {return 1;};
		Console.WriteLine(f());
		
	}
}