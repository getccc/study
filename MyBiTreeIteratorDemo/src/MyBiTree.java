//二叉树类
public class MyBiTree {
	
	private MyBiTreeNode root;//根节点
	
	
	
	MyBiTree(){
		this.root = null;
	}
	
	MyBiTree(Object data,MyBiTree left,MyBiTree right){
		MyBiTreeNode l,r;
		if (left==null) {
			l = null;
		}
		else{
			l = left.root;
		}
		
		if (right==null) {
			r = null;
		}
		else{
			r = right.root;
		}
		
		this.root = new MyBiTreeNode(data,l,r);
	}
	
	//打印二叉树
	public static void printBiTree(MyBiTreeNode root,int level){
		if (root!=null) {
			printBiTree(root.getRightChild(),level+1);
			
			if (level!=0) {
				//输出6*（level-1）个空格
				for (int i = 0; i < 6*(level-1); i++) {
					System.out.print(" ");
				}
				System.out.print("-----");
			}
			System.out.println(root.getData());
			
			printBiTree(root.getLeftChild(),level+1);
		}
	}
	
	//获得二叉树的结点
	public static MyBiTreeNode getTreeNode(Object data,MyBiTreeNode left,MyBiTreeNode right){
		
		MyBiTreeNode node = new MyBiTreeNode(data,left,right);
		
		return node;
	}
	
	//查找指定元素
	public  static MyBiTreeNode search(MyBiTreeNode root,Object obj){
		MyBiTreeNode node = null;
		if (root==null) {
			return null;
		}
		if (root.getData().equals(obj)) {
			return root;
		}
		if (root.getLeftChild()!=null) {
			node = search(root.getLeftChild(),obj);
		}
		if (root.getRightChild()!=null) {
			node = search(root.getRightChild(),obj);
		}
		return node;
	}
}
