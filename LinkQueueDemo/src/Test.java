
public class Test {
	
	public static boolean isHuiWen(String str) throws Exception{
		int n = str.length();
		LinkStack stack = new LinkStack();//创建堆栈
		LinkQueue queue = new LinkQueue();//创建队列
		
		for (int i = 0; i < n; i++) {
			stack.push(str.substring(i, i+1));//把字符串每个字符压入堆栈
			queue.append(str.substring(i, i+1));//把字符串每个字符压入队列
		}
		
		while(!queue.isEmpty()&&!stack.isEmpty()){
			if (!queue.delete().equals(stack.pop())) {
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) throws Exception {
		/*
		LinkQueue queue = new LinkQueue();
		queue.append("a");
		queue.append("b");
		queue.append("c");
		queue.append("d");
		queue.append("e");
		queue.append("f");
		
		queue.delete();
		queue.delete();
		
		queue.append("g");
		
		while(!queue.isEmpty()){
			System.out.println(queue.delete());
		}*/
		
		String str1 = "abcdcba";
		String str2 = "abcdcii";
		
		try {
			if (Test.isHuiWen(str2)) {
				System.out.println(str2+"是回文");
			}else{
				System.out.println(str2+"不是回文");
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
