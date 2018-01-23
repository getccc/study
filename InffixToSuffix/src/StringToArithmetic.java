import java.util.Stack;
import java.util.regex.Pattern;

public class StringToArithmetic {

	public StringToArithmetic() {

	}

	// 将中缀表达式字符串计算得到结果
	public static double stringToArithmetic(String string) {

		return 0;
	}

	// 将中缀表达式转换为后缀表达式
	public static String infixToSuffix(String exp) {
		// 创建操作符堆栈
		Stack<Character> s = new Stack<Character>();
		String suffix = "";// 输出的后缀表达式字符串
		int len = exp.length();

		for (int i = 0; i < len; i++) {
			char temp;// 临时的字符变量
			char ch = exp.charAt(i);
			switch (ch) {
			// 忽略空格
			case ' ':

				break;
			// 如果是左括号，直接压入堆栈。
			case '(':
				s.push(ch);
				break;
			// 如果是加号或者减号，则弹出所有的字符至输出序列，直到
			// 碰到（ 为止
			case '+':
			case '-':
				while (!s.isEmpty()) {
					temp = s.pop();
					if (temp == '(') {
						s.push(temp);
						break;
					}
					suffix += temp;
				}
				s.push(ch);// 把运算符压入堆栈
				break;
			// 如果是乘号或者除号
			case '*':
			case '/':
				while (!s.isEmpty()) {
					temp = s.pop();
					if (temp == '(' || temp == '+' || temp == '-') {
						s.push(temp);
						break;
					} else {
						suffix += temp;
					}
				}
				// suffix +=ch;
				s.push(ch);
				break;
			case ')':
				while (!s.isEmpty()) {
					temp = s.pop();
					if (temp == '(') {
						break;
					} else {
						suffix += temp;
					}
				}
				break;
			// 默认如果读到是数字 ，则直接送到输出序列
			default:
				suffix += ch;
				break;
			}
		}
		// 如果栈不为空，把剩余的运算符依次弹出，送至输出序列。
		while (!s.isEmpty()) {
			suffix += s.pop();
		}

		return suffix;
	}

	// 输入后缀表达式字符串得到运算结果
	public static double suffixToArithmetic(String exp) {
		Pattern pattern = Pattern.compile("\\d+||(\\d+\\.\\d+)"); // 使用正则表达式 匹配数字
		// 用指定字符，把字符串转换为字符串数组
		String strings[] = exp.split("");

		for (int i = 0; i < strings.length; i++)
			strings[i].trim();
		Stack<Double> stack = new Stack<Double>();

		for (int i = 0; i < strings.length; i++) {

			if (strings[i].equals(""))
				continue;

			// 如果是数字，则进栈
			if ((pattern.matcher(strings[i])).matches()) {

				stack.push(Double.parseDouble(strings[i]));
			} else {
				// 如果是运算符，弹出运算数，计算结果。
				double y = stack.pop();
				double x = stack.pop();
				stack.push(caculate(x, y, strings[i])); // 将运算结果重新压入栈。
			}
		}
		return stack.pop(); // 弹出栈顶元素就是运算最终结果。
	}

	private static double caculate(double x, double y, String simble) {
		if (simble.trim().equals("+"))
			return x + y;
		if (simble.trim().equals("-"))
			return x - y;
		if (simble.trim().equals("*"))
			return x * y;
		if (simble.trim().equals("/"))
			return x / y;
		return 0;
	}
}
