
public class Test {
	
	public static void main(String[] args) throws Exception {
		/*
		CircleSequenceQueue queue = new CircleSequenceQueue();
		
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
		}
		*/
		
		WindowQueue queue = new WindowQueue();
		//传同一个对象
		Producer p = new Producer(queue);
		Consumer c = new Consumer(queue);
		
		//排队买票线程
		Thread pThread = new Thread(p);
		//卖票线程
		Thread cThread = new Thread(c);
		
		pThread.start();
		cThread.start();
	}
}
