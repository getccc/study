import java.util.Scanner;

public class Test {

	public static String[] expToStringArray(String exp) {
		int n = exp.length();
		String[] arr = new String[n];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = exp.substring(i, i + 1);
		}

		return arr;
	}

	public static void signCheck(String exp) throws Exception {
		SequenceStack stack = new SequenceStack();
		String[] arr = Test.expToStringArray(exp);
		for (int i = 0; i < arr.length; i++) {
			if (arr[i].equals("(") || arr[i].equals("[") || arr[i].equals("{")) {
				stack.push(arr[i]);
			} else if (arr[i].equals(")") && !stack.isEmpty()
					&& stack.getTop().equals("(")) {
				stack.pop();
			} else if (arr[i].equals(")") && !stack.isEmpty()
					&& !stack.getTop().equals("(")) {
				System.out.println("左右括号匹配次序不正确");
				return;
			} else if (arr[i].equals("]") && !stack.isEmpty()
					&& stack.getTop().equals("[")) {
				stack.pop();
			} else if (arr[i].equals("]") && !stack.isEmpty()
					&& !stack.getTop().equals("[")) {
				System.out.println("左右括号匹配次序不正确");
				return;
			} else if (arr[i].equals("}") && !stack.isEmpty()
					&& stack.getTop().equals("{")) {
				stack.pop();
			} else if (arr[i].equals("}") && !stack.isEmpty()
					&& !stack.getTop().equals("{")) {
				System.out.println("左右括号匹配次序不正确");
				return;
			}else if (arr[i].equals(")") || arr[i].equals("]") || arr[i].equals("}")) {
				System.out.println("右括号多于左括号！");
				return;
			}
		}
		if (!stack.isEmpty()) {
			System.out.println("左括号多于右括号！");
		}else{
			System.out.println("括号匹配正确");
		}
	}

	/**
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		/*
		 * LinkStack stack = new LinkStack();
		 * 
		 * Scanner in = new Scanner(System.in); int temp; for (int i = 0; i <
		 * 10; i++) { System.out.println("请输入第"+(i+1)+"个整数"); temp =
		 * in.nextInt(); stack.push(temp); }
		 * 
		 * while(!stack.isEmpty()){ System.out.println(stack.pop()); }
		 */

		String str = "{a+[b+(c*a)/(d-e)]}";
		Test.signCheck(str);
	}
}
