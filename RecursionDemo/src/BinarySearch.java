import java.util.Scanner;

public class BinarySearch {

	public static boolean bSearch(int[] arr, int des, int low, int high) {
		int mid;// 中间的下标
		if (low > high) {
			return false;
		}
		mid = (low + high) / 2;
		if (des == arr[mid]) {
			return true;
		} else if (des < arr[mid]) {
			return bSearch(arr, des, low, mid - 1);
		} else {
			return bSearch(arr, des, mid + 1, high);
		}
	}

	public static void main(String[] args) {
		
		int[] arr = {1,6,11,17,23,45,56,76,87,93};
		
		int des;
		Scanner in = new Scanner(System.in);
		System.out.println("请输入一个正整数：");
		des=in.nextInt();
		
		if (BinarySearch.bSearch(arr, des, 0, arr.length)) {
			System.out.println(des+"在数组当中！");
		}else{
			System.out.println(des+"不在数组中");
		}
	}
}
