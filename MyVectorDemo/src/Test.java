import java.util.Scanner;
//字符串消除：相邻相同字符
public class Test {

	public static int handle(StringBuffer buffer) {
		int count = 0;
		while (true) {
			StringBuffer temp = new StringBuffer();
			int i = 0, j = 1;
			for (; j < buffer.length(); j++) {
				if (buffer.charAt(i) != buffer.charAt(j)) {
					temp.append(buffer.charAt(i));
				} else {
					while (j < buffer.length()
							&& buffer.charAt(i) == buffer.charAt(j))
						j++;
				}
				i = j;
			}
			if (j == buffer.length()) {
				temp.append(buffer.charAt(i));
			}
			if (temp.length() == buffer.length()) {
				count = temp.length();
				break;
			}
			buffer = temp;
		}
		return count;
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		for (int i = 0; i < n; i++) {
			StringBuffer buffer = new StringBuffer(scanner.next());
			int min = buffer.length();
			for (int j = 0; j < buffer.length(); j++) {
				for (char ch = 'A'; ch <= 'C'; ch++) {
					StringBuffer temp = new StringBuffer(buffer);
					temp = temp.insert(j, ch);
					int count = handle(temp);
					min = min > count ? count : min;
				}
			}
			System.out.println(buffer.length() + 1 - min);
		}
	}
}