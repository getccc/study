//冒泡排序算法
public class SwapSortDemo {
	
	public static void swapSort(int[] arr){
		for (int i = arr.length-1; i >=0; i--) {
			for (int j = 0; j < i; j++) {
				if (arr[j]>arr[j+1]) {
					int temp;
					temp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1]=temp;
				}
			}
		}
	}
	
	
	
	
	
	public static void print(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
	}

	public static void main(String[] args) {
		int[] arr = { 23, 12, 10, 33, 56, 8, 4, 17, 29, 43 };
		print(arr);
		System.out.println("----排序之后-----");
		swapSort(arr);
		print(arr);
	}
}
