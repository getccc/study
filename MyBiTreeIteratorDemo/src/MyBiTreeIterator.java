
public class MyBiTreeIterator {
	
	MyBiTreeNode root;//根节点
	MyBiTreeNode curr;//当前结点
	boolean isComplete;//判断是否遍历结束
	
	MyBiTreeIterator(){
	}
	
	MyBiTreeIterator(MyBiTreeNode root){
		this.root = root;
	}
	
	public void reset(){
		
	}
	
	public void next(){
		
	}
	
	public boolean  endOfBiTree(){
		return isComplete;
	}
	
	public Object getData(){
		return this.curr.getData();
	}
}
