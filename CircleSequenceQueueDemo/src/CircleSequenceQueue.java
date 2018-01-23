//循环顺序队列
public class CircleSequenceQueue implements Queue {
	
	static final int defaultSize = 10;//默认队列的长度
	int front;//队头
	int rear;//队尾
	int count;//统计元素个数的计数器
	int maxSize;//队的最大长度
	Object[] queue;//队列
	
	public CircleSequenceQueue(){
		init(defaultSize);
	}
	
	public CircleSequenceQueue(int size){
		init(size);
	}
	
	public void init(int size){
		maxSize = size;
		front=rear=0;
		count=0;
		queue=new Object[size];
	}
	
	public void append(Object obj) throws Exception {
		if (count>0&&front==rear) {
			throw new Exception("队列已满！");
		}
		queue[rear]=obj;
		rear=(rear+1)%maxSize;
		count++;
	}

	public Object delete() throws Exception {
		if (isEmpty()) {
			throw new Exception("队列为空！");
		}
		Object obj = queue[front];
		front = (front+1)%maxSize;
		count--;
		return obj;
	}

	public Object getFront() throws Exception {
		if (!isEmpty()) {
			return queue[front];
		}else{
			return null;
		}
	}

	public boolean isEmpty() {

		return count==0;
	}

}
