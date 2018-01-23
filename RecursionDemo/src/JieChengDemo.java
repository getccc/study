import java.util.Scanner;


public class JieChengDemo {
	
	public static long jieCheng(int num){
		if (num==1) {
			return 1;
		}
		else{
			return num*jieCheng(num-1);//递归调用
		}
	}
	
	public static void main(String[] args) {
		
		int num;
		long result;
		Scanner in = new Scanner(System.in);
		System.out.println("请输入一个正整数：");
		num = in.nextInt();
		result = JieChengDemo.jieCheng(num);
		System.out.println(num+"的阶乘是："+result);
	}
}
