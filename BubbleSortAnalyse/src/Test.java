import java.util.ArrayList;
import java.util.List;


public class Test {
	public static void main(String[] args) {
		SequenceList list = new SequenceList(20);
		try {
			list.insert(0, 0);
			System.out.println(list.size());
			list.insert(1, 1);
			list.insert(2, 2);
			list.insert(3, 3);
			list.insert(1, 5);
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));
			System.out.println(list.get(4));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Integer> list1 = new ArrayList<Integer>();
		list1.add(0, 0);
		list1.add(1, 1);
		list1.add(2, 2);
		list1.add(3, 3);
		list1.add(1, 5);
		System.out.println(list1.get(0));
		System.out.println(list1.get(1));
		System.out.println(list1.get(2));
		System.out.println(list1.get(4));
		
		int[] arr = new int[]{1,2,3};
		arr[0]=arr[1];
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}
}
