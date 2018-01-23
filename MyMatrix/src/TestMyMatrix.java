
public class TestMyMatrix {
	
	public static void main(String[] args){
		MyMatrix m1 = new MyMatrix();
		MyMatrix m2 = new MyMatrix(4);
		System.out.println("m1矩阵：");
		m1.print();
		System.out.println("m2矩阵：");
		m2.print();
		
		MyMatrix m3 = m2.transport();
		System.out.println("m2转置后：");
		m3.print();
		
		System.out.println(m3.isDownTriangle());
		MyMatrix m4 = new MyMatrix(
				new int [][]{
					{1,0,0,0},
					{2,3,0,0},
					{4,5,6,0},
					{7,8,9,10}
				}
		);
		
		System.out.println(m4.isDownTriangle());
		
		MyMatrix m5 = new MyMatrix(
				new int [][]{
					{1,2,4,7},
					{2,3,5,8},
					{4,5,6,9},
					{7,8,9,10}
				}
		);
		
		System.out.println(m5.isSynmetry());
		
		m4.add(m5);
		m4.print();
	}
}
