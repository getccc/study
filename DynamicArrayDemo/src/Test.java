
public class Test {
	public static void main(String[] args)throws Exception {
		
		DynamicArray arr1 = new DynamicArray();
		for (int i = 0; i < arr1.maxSize; i++) {
			arr1.arr[i]=i;
		}
		
		for (int i = 0; i < arr1.maxSize; i++) {
			System.out.print(arr1.arr[i]+" ");
		}
		
		System.out.println("\n-------调整大小后------\n");
		
		arr1.reSize(20);
		
		for (int i = 0; i < arr1.maxSize; i++) {
			System.out.print(arr1.arr[i]+" ");
		}
		
		DynamicArray arr2 = new DynamicArray(arr1);
		System.out.println("\n-------拷贝新数组后------\n");
		
		for (int i = 0; i < arr2.maxSize; i++) {
			System.out.print(arr2.arr[i]+" ");
		}
	}
}
