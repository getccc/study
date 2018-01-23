
public class Test1 {
	
	public static void main(String[] args)throws Exception {
		
		int i;
		Integer t;
		MyVector mv = new MyVector(10);
		for (i = 0; i <10; i++) {
			mv.add(new Integer(i+1));
		}
		mv.add(11);
		
		System.out.println("size"+mv.size());
		for (i = 0; i < mv.size(); i++) {
			t = (Integer)mv.get(i);
			System.out.println(t+"");
		}
		
	}
}
