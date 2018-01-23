//对称矩阵类
public class SynmeMatrix {
	
	double [] a;//矩阵元素
	int n;//矩阵的阶数
	int m;//一维数组的个数
	
	public SynmeMatrix(int n){
		//需要保存的元素个数是m=n*(n+1)/2;
		m = n*(n+1)/2;
		a = new double[m];
		this.n = n;
	}
	
	//通过一个二维数组来初始化
	public void evaluate(double[][] b){
		int k = 0;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if (i>=j) {
					a[k++]=b[i][j];//只保存下三角元素
				}
			}
		}
	}
	
	//通过一个一维数组来初始化，那么这个一维数组就是对称矩阵元素的副本
	public void evaluate(double[] b){
		for (int k = 0; k<m; k++) {
			a[k]=b[k];
		}
	}
	
	//对称矩阵相加
	public SynmeMatrix add(SynmeMatrix b){
		SynmeMatrix t = new SynmeMatrix(n);
		int k;
		for (int i = 1; i <=n; i++) {
			for (int j = 1; j <=n; j++) {
				if (i>=j) {
					k=i*(i-1)/2+j-1;
				}else{
					k=j*(j-1)/2+i-1;
				}
				t.a[k]=a[k]+b.a[k];
			}
		}
		return t;
	}
	
	//打印对称矩阵
	public void print(){
		int k;
		for (int i = 1; i <=n; i++) {
			for (int j = 1; j <=n; j++) {
				if (i>=j) {
					k=i*(i-1)/2+j-1;
				}else{
					k=j*(j-1)/2+i-1;
				}
				System.out.print(" "+a[k]);
			}
			System.out.println();
		}
	}
}
