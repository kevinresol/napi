using System;
using api;

public class Test {
	public static void Main() {
		Api api = new Api();
		api.test().invoke();
	}
}