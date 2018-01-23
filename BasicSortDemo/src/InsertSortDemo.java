//插入排序
public class InsertSortDemo {
	
	public static void insertSort(int[] arr){
		for (int i = 1; i < arr.length; i++) {
			for (int j = 0; j < i; j++) {
				if (arr[j]>arr[i]) {
					int temp = arr[i];
					//向后移动元素
					for (int k = i; k > j; k--) {
						arr[k]=arr[k-1];
					}
					arr[j]=temp;
				}
			}
		}
	}
	
	
	
	public static void print (int[] arr){
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		
		int[] arr = {23,12,10,33,56,8,4,17,29,43};
		print(arr);
		System.out.println("----排序之后-----");
		insertSort(arr);
		print(arr);
	}
}
