
public class Test {
	
	public static void main(String[] args) {
		
		char[] c1={'c','h','i','n','a'};
		char[] c2={'i','l','o','v','e',' ','c','h','i','n','a'};
 		
		MyString str1 = new MyString();
		
		MyString str2 = new MyString(c1);
		
		MyString str3 = new MyString(c2,1,5);
		
		MyString str4 = new MyString("Hello");
		
		MyString str5 = new MyString("China");
		
		MyString str6 = new MyString(c2);
		
		MyString str7 = str4.concat(str5);
		
		System.out.println(str1);
		System.out.println(str2);
		System.out.println(str3);
		System.out.println(str4);
		
		System.out.println(str4.length());
		System.out.println(str4.charAt(2));
		System.out.println(str2.compareTo(str5));
		
		System.out.println(str6.substring(1, 5));
		System.out.println(str6.substring(6));
		
		System.out.println(str4.concat(str5));
		System.out.println(str7.insert(new MyString(" you "), 5));
		
		System.out.println(str7.delete(5, 5));
	}
	 
}
