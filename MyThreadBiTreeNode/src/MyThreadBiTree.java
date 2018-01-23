import java.util.Scanner;

//线索二叉树类
public class MyThreadBiTree {

	protected MyBiTreeNode head;
	protected final static String ENDFLAG = "null";

	public MyThreadBiTree() {
		this.head = null;
	}

	// 初始化二叉树的根节点
	public void initMyBiTree() {
		String item;
		Scanner in = new Scanner(System.in);
		System.out.println("请输入二叉树的树根结点（输入null表示该结点为空）：");
		item = in.next();
		if (!item.equalsIgnoreCase(ENDFLAG)) {
			head = new MyBiTreeNode(item);
			init(head);
		}
	}

	// 初始化二叉树
	private void init(MyBiTreeNode head) {
		String item;
		Scanner in = new Scanner(System.in);
		System.out.println("请输入"+head.getData()+"结点的左孩子结点：");
		item = in.next();
		if (!item.equalsIgnoreCase(ENDFLAG)) {
			head.setLeftNode(new MyBiTreeNode(item));
			init(head.getLeftNode());
		}
		System.out.println("请输入"+head.getData()+"结点的右孩子结点：");
		item = in.next();
		if (!item.equalsIgnoreCase(ENDFLAG)) {
			head.setRightNode(new MyBiTreeNode(item));
			init(head.getRightNode());//递归
		}
	}
	
	//创建线索二叉树
	public void createMyThreadBiTree(){
		
	}
	
	//线索变量算法
	public void traversal(){
		
	}

}
