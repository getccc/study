import java.util.Stack;


public class Test {
	
	public static void main(String[] args) throws Exception {
		/*
		Stack<Character> s = new Stack<Character>();
		
		char ch;
		
		//从控制台输入字符，直到#符号结束
		System.out.println("请输入字符串以#结束：");
		while((ch=(char)(System.in.read()))!='#') {
			s.push(ch);
		}
		
		//弹出堆栈
		while(!s.isEmpty()){
			System.out.println(s.pop());
		}
		*/
		String str = "3+(2-5)*6/3";
		System.out.println(StringToArithmetic.infixToSuffix(str));
		System.out.println(StringToArithmetic.suffixToArithmetic(StringToArithmetic.infixToSuffix(str)));
	}
}
