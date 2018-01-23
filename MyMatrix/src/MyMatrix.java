import java.util.Random;

public class MyMatrix {

	int[][] matrix;// 矩阵数组
	Random random = new Random();// 随机数对象

	// 默认构造方法，生成3*3的矩阵
	public MyMatrix() {
		matrix = new int[3][3];
		// 初始化矩阵
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				matrix[i][j] = random.nextInt(100);
			}
		}
	}

	// 默认构造方法，生成n*n的矩阵
	public MyMatrix(int n) {
		matrix = new int[n][n];
		// 初始化矩阵
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				matrix[i][j] = random.nextInt(100);
			}
		}
	}

	// 默认构造方法，生成m*n的矩阵
	public MyMatrix(int m, int n) {
		matrix = new int[m][n];
		// 初始化矩阵
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				matrix[i][j] = random.nextInt(100);
			}
		}
	}

	// 根据已经二维数组，生成矩阵
	public MyMatrix(int[][] matrix) {
		this.matrix = matrix;
	}

	// 返回矩阵数组
	public int[][] getMatrix() {
		return this.matrix;
	}

	// 打印矩阵
	public void print() {
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				System.out.print(matrix[i][j] + " ");
			}
			System.out.println();
		}
	}

	// 转置矩阵
	public MyMatrix transport() {
		// 行变列
		int m = matrix[0].length;
		// 列变行
		int n = matrix.length;

		MyMatrix transMatrix = new MyMatrix(m, n);
		// 初始化
		for (int i = 0; i < transMatrix.matrix.length; i++) {
			for (int j = 0; j < transMatrix.matrix[i].length; j++) {
				transMatrix.matrix[i][j] = matrix[j][i];
			}
		}
		return transMatrix;
	}

	// 判断矩阵是否是上三角矩阵
	public boolean isUpTriangle() {
		for (int i = 1; i < matrix.length; i++) {
			for (int j = 0; j < i; j++) {
				if (matrix[i][j] != 0) {
					return false;
				}
			}
		}
		return true;
	}

	// 判断是否是下三角矩阵
	public boolean isDownTriangle() {
		for (int i = 0; i < matrix.length; i++) {
			for (int j=matrix[i].length-1; j>i;j--) {
				if (matrix[i][j] != 0) {
					return false;
				}
			}
		}
		return true;
	}

	// 判断是否是对称矩阵
	public boolean isSynmetry() {
		for (int i = 1; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				if (matrix[i][j] != matrix[j][i]) {
					return false;
				}
			}
		}
		return true;
	}

	// 矩阵求和
	public void add(MyMatrix b) {
		int m = b.matrix.length;
		int n = b.matrix[0].length;
		if (m != matrix.length || n != matrix[0].length) {
			System.out.println("矩阵类型不相同，无法相加");
		} else {
			for (int i = 0; i < matrix.length; i++) {
				for (int j = 0; j < matrix[i].length; j++) {
					matrix[i][j]+=b.matrix[i][j];
				}
			}
		}
	}
}
