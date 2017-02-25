import api.Api;
public class Main {
	public static void main(String[] args) {
		int errors = 0;
		
		Api api = new Api();
		api.test().invoke();
		int i = api.test1().invoke();
		int i2 = api.test2().invoke(2);
		
		
		System.out.println("Got:");
		System.out.println(i);
		System.out.println(i2);
		
		System.exit(errors);
	}
}