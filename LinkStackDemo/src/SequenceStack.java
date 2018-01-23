//顺序栈
public class SequenceStack implements Stack{
	
	Object[] stack;//对象数组
	final int defaultSize = 10;//默认最大长度
	int top;//栈顶位置
	int maxSize;//最大长度
	
	public SequenceStack(){
		init(defaultSize);
	}
	
	public SequenceStack(int size){
		init(size);
	}
	
	public void init(int size){
		this.maxSize = size;
		top = 0;
		stack = new Object[size];
	}
	
	public Object getTop() throws Exception {
		if (isEmpty()) {
			throw new Exception("堆栈为空！");
		}
		return stack[top-1];
	}

	
	public boolean isEmpty() {
		return top==0;
	}

	
	public Object pop() throws Exception {
		if (isEmpty()) {
			throw new Exception("堆栈为空！");
		}
		top--;
		return stack[top];
	}

	
	public void push(Object obj) throws Exception {
		//判断栈是否已满
		if (top == maxSize) {
			throw new Exception("堆栈已满！");
		}
		stack[top] = obj;
		top++;
	}

}
