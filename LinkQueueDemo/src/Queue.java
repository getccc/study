//队列接口
public interface Queue {
	
	//入队
	public void append(Object obj) throws Exception;
	
	//出队
	public Object delete() throws Exception;
	
	//获得队头元素
	public Object getFront() throws Exception;
	
	//判断队列是否为空
	public boolean isEmpty();
}
