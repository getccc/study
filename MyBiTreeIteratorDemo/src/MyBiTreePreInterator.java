import java.util.Stack;


//二叉树游标前序遍历类
public class MyBiTreePreInterator extends MyBiTreeIterator{
	
	Stack<MyBiTreeNode> stack = new Stack<MyBiTreeNode>();
	
	MyBiTreePreInterator(){
		
	}
	
	MyBiTreePreInterator(MyBiTreeNode root){
		super(root);
	}
	
	public void next() {
		
		if (this.isComplete) {
			System.out.println("已经遍历到二叉树结尾！");
			return ;
		}
		if (this.curr.getRightChild()!=null) {
			stack.push(this.curr.getRightChild());
		}
		if (this.curr.getLeftChild()!=null) {
			stack.push(this.curr.getLeftChild());
		}
		if (!stack.empty()) {
			this.curr = stack.pop();
		}
		else{
			this.isComplete = true;
		}
	}
	
	public void reset() {
		
		if (this.root==null) {
			this.isComplete = true;
		}
		else{
			this.isComplete = false;
		}
		if (this.root==null) {
			return ;
		}
		
		this.curr = this.root;
	}
}
