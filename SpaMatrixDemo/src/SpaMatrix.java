
public class SpaMatrix {
	int rows;//行数
	int cols;//列数
	int dNum;//非0元素个数
	MyVector v;
	
	SpaMatrix(int max){
		rows = cols = dNum = 0;
		v = new MyVector(max);
	}
	
	//根据用户传来的三元组数组，来初始化矩阵
	public void evaluate(int r,int c,int d,Three[] item)throws Exception{
		this.rows = r;
		this.cols = c;
		this.dNum = d;
		for (int i = 0; i < d; i++) {
			v.add(i, item[i]);
		}
	}
	
	//稀疏矩阵的转置
	public SpaMatrix transport()throws Exception{
		SpaMatrix a = new SpaMatrix(v.size());
		a.rows =this.cols;
		a.cols = this.rows;
		a.dNum = this.dNum;
		
		for (int i = 0; i < dNum; i++) {
			Three t=(Three)v.get(i);
			a.v.add(i,new Three(t.col,t.row,t.value));
		}
		return a;
	}
	
	//打印稀疏矩阵的方法
	public void print()throws Exception{
		System.out.println("矩阵的行数："+this.rows);
		System.out.println("矩阵的列数："+this.cols);
		System.out.println("非零元素的个数："+this.dNum);
		
		System.out.println("矩阵三元组为：");
		for (int i = 0; i < dNum; i++) {
			System.out.println("a<"+((Three)v.get(i)).row+","+((Three)v.get(i)).col+">="+((Three)v.get(i)).value);
		}
	}
}
