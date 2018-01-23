//卖票者
public class Consumer implements Runnable {
	
	WindowQueue queue;
	
	public Consumer(WindowQueue queue){
		this.queue = queue;
	}
	
	public void run() {
		while(queue.isAlive){
			try{
				queue.consumer();
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
	
}
