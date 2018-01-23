//买票者
public class Producer implements Runnable {
	
	WindowQueue queue;
	
	public Producer(WindowQueue queue){
		this.queue = queue;
	}

	public void run() {
		while(queue.num<100){
			try{
				queue.producer();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
}
