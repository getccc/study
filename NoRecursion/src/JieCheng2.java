import java.util.Scanner;

//采用非递归算法，实现阶乘。使用循环
public class JieCheng2 {
	
	public static long jieCheng2(int num){
		long result = 1;
		for (int i=num; i>=1; i--) {
			result*=i;
		}
		return result;
	}
	
	public static void main(String[] args) {
		int num;
		long result;
		Scanner in = new Scanner(System.in);
		System.out.println("请输入一个正整数：");
		num = in.nextInt();
		result = JieCheng2.jieCheng2(num);
		System.out.println(num+"的阶乘是："+result);
	}
}
