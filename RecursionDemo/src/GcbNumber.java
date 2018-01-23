
public class GcbNumber {
	
	public static int gcb(int bigNum,int smallNum){
		if (bigNum<0||smallNum<0) {
			return -1;//表示没有找到最大公约数
		}
		if (smallNum==0) {
			return bigNum;
		}
		if (bigNum<smallNum) {
			return gcb(smallNum,bigNum);
		}else{
			return gcb(smallNum,bigNum%smallNum);
		}
	}
	
	public static void main(String[] args){
		int a =12;
		int b=32;
		int result = GcbNumber.gcb(b, a);
		System.out.println(result);
	}
}
