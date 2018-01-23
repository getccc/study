
public class Test {

	
	public static void main(String[] args) {
		MyStringBuffer sb1 = new MyStringBuffer("I LOVE ");
		MyStringBuffer sb2 = new MyStringBuffer("CHINA");
		
//		MyStringBuffer sb3 = sb1.concat(sb2);
//		System.out.println(sb3);
		
		System.out.println(sb1.hashCode());
		System.out.println(sb2.hashCode());
		System.out.println(sb1);
		sb1.concat(sb2);
		System.out.println(sb1.hashCode());
		System.out.println(sb1);
	}

}
