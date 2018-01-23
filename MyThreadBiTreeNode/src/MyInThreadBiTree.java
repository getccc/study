//中序线索二叉树类
public class MyInThreadBiTree extends MyThreadBiTree {
	
	public MyInThreadBiTree(){
		super();
	}

	public void initMyBiTree() {

		super.initMyBiTree();
	}
	
	public void createMyThreadBiTree() {

		create(head,null);
	}
	
	private MyBiTreeNode create(MyBiTreeNode curNode,MyBiTreeNode preNode){
		if (curNode != null) 
		{
			MyBiTreeNode tempNode = create(curNode.getLeftNode(), preNode);

			if ((!curNode.isLeftFlag()) && (curNode.getLeftNode() == null)) 
			{
				curNode.setLeftFlag(true);
				curNode.setLeftNode(preNode);
			} // end of if

			preNode = tempNode;

			if ((preNode != null) && (preNode.getRightNode() == null)) 
			{
				preNode.setRightFlag(true);
				preNode.setRightNode(curNode);
			} // end of if

			preNode = curNode;
			preNode = create(curNode.getRightNode(), preNode);
			return preNode;
		} // end of if

		return preNode;
		
	}
	

	public void traversal() {

		MyBiTreeNode walker = this.head;

		if (this.head != null) {
			while (!walker.isLeftFlag())
				walker = walker.getLeftNode();

			System.out.print(walker.getData() + " ");

			while (walker.getRightNode() != null) {
				if (walker.isRightFlag())
					walker = walker.getRightNode();
				else {
					walker = walker.getRightNode();
					while ((walker.getLeftNode() != null)
							&& (!walker.isLeftFlag()))
						walker = walker.getLeftNode();
				} // end of else

				System.out.print(walker.getData() + " ");
			} // end of while
		} // end of if
	}
	
	
	
}
