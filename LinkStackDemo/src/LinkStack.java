
public class LinkStack implements Stack{
	
	Node head;//栈顶指针
	int size;//结点的个数
	
	public LinkStack(){
		head = null;
		size = 0;
	}
	
	public Object getTop() throws Exception {
		
		return head.getElement();
	}

	public boolean isEmpty() {
		
		return head==null;
	}

	public Object pop() throws Exception {
		if (isEmpty()) {
			throw new Exception("栈为空！");
		}
		Object obj = head.getElement();
		head = head.getNext();
		size--;
		return obj;
	}

	public void push(Object obj) throws Exception {
		head = new Node(obj,head);
		size++;
	}

}
