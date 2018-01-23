//链式队列
public class LinkQueue implements Queue {
	
	Node front;//队头
	Node rear;//队尾
	int count;//计数器
	
	public LinkQueue(){
		init();
	}
	
	public void init(){
		front = rear = null;
		count=0;
	}
	
	public void append(Object obj) throws Exception {
		Node node = new Node(obj,null);
		
		if (rear != null) {
			rear.next = node;//队尾结点指向新结点
		}
		
		rear = node;//设置队尾结点为新结点
		
		//说明要插入的结点是队列的第一个结点
		if (front==null) {
			front = node;
		}
		count++;
	}

	public Object delete() throws Exception {
		if (isEmpty()) {
			new Exception("队列已空！");
		}
		Node node = front;
		front = front.next;
		count--;
		return node.getElement();
	}

	public Object getFront() throws Exception {
		if (!isEmpty()) {
			return front.getElement();
		}
		else{
			return null;
		}
	}

	public boolean isEmpty() {
		
		return count==0;
	}

}
