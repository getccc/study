
public class Test {
	
	public static MyBiTreeNode makeTree(){
		MyBiTreeNode b,c,d,e,f,g;
		g = MyBiTree.getTreeNode(new Character('G'), null, null);
		d = MyBiTree.getTreeNode(new Character('D'), null, g);
		b = MyBiTree.getTreeNode(new Character('B'), d, null);
		e = MyBiTree.getTreeNode(new Character('E'), null, null);
		f = MyBiTree.getTreeNode(new Character('F'), null, null);
		c = MyBiTree.getTreeNode(new Character('C'), e, f);
		
		return MyBiTree.getTreeNode(new Character('A'), b, c);
	}
	
	
	public static void main(String[] args) {
		MyBiTreeNode root;
		root = Test.makeTree();
		System.out.println("前序遍历的结果是：");
		MyBiTreeIterator it = new MyBiTreePreInterator(root);
		
		for (it.reset();!it.endOfBiTree();it.next()) {
			System.out.print(it.getData()+" ");
		}
		System.out.println();
		
		System.out.println("中序遍历的结果是：");
		it = new MyBiTreeInIterator(root);
		
		for (it.reset();!it.endOfBiTree();it.next()) {
			System.out.print(it.getData()+" ");
		}
		System.out.println();
	}
}
