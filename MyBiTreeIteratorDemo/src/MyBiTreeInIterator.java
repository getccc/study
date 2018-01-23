import java.util.Stack;

////二叉树游标中序遍历类
public class MyBiTreeInIterator extends MyBiTreeIterator {
  
	Stack<MyBiTreeNode> stack = new Stack<MyBiTreeNode>();
    
	MyBiTreeInIterator()
	{
		
	}
	
	MyBiTreeInIterator(MyBiTreeNode root)
	{
		super(root);
	}
    
	//得到最左边的结点
	public MyBiTreeNode getFarLeft(MyBiTreeNode node)
	{
	   if(node==null)
	   {
		   return null;
	   }
	   while(node.getLeftChild()!=null)
	   {
		  stack.push(node);
		  node = node.getLeftChild(); 
	   }
	   return node;
	}
	
	
	@Override
	public void next() {
		// TODO Auto-generated method stub
		if(this.isComplete)
		{
			System.out.println("已经遍历到二叉树结尾！");
			return ;
		}
		if(this.curr.getRightChild()!=null)
		{
			//在右孩子当中找最左边的。
			this.curr = getFarLeft(this.curr.getRightChild());
		}
		else if(!stack.isEmpty())
		{
			this.curr = stack.pop();
		}
		else
		{
			this.isComplete = true;
		}
	}

	@Override
	public void reset() {
		// TODO Auto-generated method stub
		if(this.root==null)
		{
			this.isComplete = true;
		}
		else
		{
			this.isComplete = false;
		}
		if(this.root==null)
		{
			return ;
		}
		
		this.curr = getFarLeft(this.root);
	}
	
	
}
