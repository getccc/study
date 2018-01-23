
public class TestSynmeMatrix {
	
	public static void main(String[] args) {
		
		SynmeMatrix m1 = new SynmeMatrix(3);
		SynmeMatrix m2 = new SynmeMatrix(3);
		SynmeMatrix m3;
		
		double[][] a = {
				{1,0,0},
				{2,3,0},
				{4,5,6}
		};
		double[] b = {1,2,3,4,5,6};
		m1.evaluate(a);
		m2.evaluate(b);
		
		System.out.println("m1对称矩阵：");
		m1.print();
		System.out.println("m2对称矩阵：");
		m2.print();
		
		m3=m1.add(m2);
		System.out.println("m3对称矩阵：");
		m3.print();
	}
}
