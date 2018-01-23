//表达式计算
public class Test1 {

	public static void expCaculate(LinkStack stack) throws Exception{
		char ch;//扫描每次输入的字符
		int x1,x2,b=0;//x1,x2是两个操作数；b对应字符的ASCII码
		System.out.println("输入后缀表达式并以#符号结束：");
		while((ch = (char)(b = System.in.read())) != '#'){
			//如果是数字，说明是操作数则压入堆栈
			if (Character.isDigit(ch)) {
				stack.push(new Integer(Character.toString(ch)));
			}
			//如果不是数字，说明是运算符
			else{
				x2 = ((Integer)stack.pop()).intValue();
				x1 = ((Integer)stack.pop()).intValue();
				switch(ch)
				{
				case '+':
					x1+=x2;
					break;
				case '-':
					x1-=x2;
					break;
				case '*':
					x1*=x2;
					break;
				case '/':
					if (x2==0) {
						throw new Exception("分母不能为零");
					}
					else{
						x1/=x2;
					}
					break;
				}
				stack.push(new Integer(x1));
			}
		}
		System.out.println("后缀表达式计算结果是："+stack.getTop());
	}
	
	public static void main(String[] args) {
		
		LinkStack stack = new LinkStack();
		try {
			Test1.expCaculate(stack);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
