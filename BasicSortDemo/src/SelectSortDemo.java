//选择排序
public class SelectSortDemo {
	
	public static void selectSort(int[] arr){
		for (int i = 0; i < arr.length-1; i++) {
			int min = arr[i];
			int index = i;
			
			for (int j = i+1; j < arr.length; j++) {
				if (arr[j]<min) {
					min = arr[j];
					index = j;
				}
			}
			
			if (index!=i) {
				int temp;
				temp = arr[i];
				arr[i]=arr[index];
				arr[index]=temp;
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
		selectSort(arr);
		print(arr);
	}
}
