
public class Boliena {
	
	//获得波列那锲数列第n项的值
	public static int getNums(int n){
		
		if (n==1||n==2) {
			return 1;
		}
		else{
			return getNums(n-1)+getNums(n-2);
		}
	}
	
	public static void main(String[] args) {
		int n=7;
		int result = 0;
		for (int i =n; i >=1; i--) {
			result += Boliena.getNums(i);
		}
		System.out.println("波列那锲数列前"+n+"项之和："+result);
	}
}
