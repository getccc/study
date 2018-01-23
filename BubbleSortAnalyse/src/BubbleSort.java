
public class BubbleSort {
	
	public static void BubbleSort(int arr[]){
		int n = arr.length;
		int i,j,temp,flag;
		flag = 1;//flag表示排序没有结束，0表示排序已经结束
		for (i = 1; i < n&&flag==1; i++) {
			for (j = 0; j < n-i; j++) {
				flag = 0;
				if (arr[j]>arr[j+1]) {
					flag = 1;
					
				}
			}
		}
	}
}
