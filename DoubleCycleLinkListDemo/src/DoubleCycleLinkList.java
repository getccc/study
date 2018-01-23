//单向链表类
public class DoubleCycleLinkList implements List {

	Node head;//头指针
	Node current;//当前结点对象
	int size;//结点个数
	
	//初始化一个空链表
	public DoubleCycleLinkList(){
		//初始化头结点，让头指针指向头结点。并且让当前结点对象等于头结点。
		this.head = current = new Node(null);
		this.size = 0;//单向链表，初始长度为零。
		this.head.next = head;
		this.head.prior = head;
	}
	
	//定位函数，实现当前操作对象的前一个结点，也就是让当前结点对象定位到要操作的节点前
	public void index(int index) throws Exception{
		if (index < -1 || index > size -1) {
			throw new Exception("参数错误！");
		}
		//说明在头结点之后操作
		if (index == -1)
			return;
			current = head.next;
			int j=0;//循环变量
			while(current != head && j < index){
				current = current.next;
				j++;
			}
		
	}

	
	public void delete(int index) throws Exception {
		//判断链表是否为空
		if (isEmpty()) {
			throw new Exception("链表为空，无法删除！");
		}
		if (index < 0 || index > size) {
			throw new Exception("参数错误！");
		}
		index(index-1);//定位到要操作结点的前一个结点对象
		current.setNext(current.next.next);
		current.next.setPrior(current);
		size--;
	}

	
	public Object get(int index) throws Exception {
		if (index < -1 || index > size -1) {
			throw new Exception("参数错误！");
		}
		index(index);
		
		return current.getElement();
	}

	
	public void insert(int index, Object obj) throws Exception {
		if (index < 0 || index > size) {
			throw new Exception("参数错误！");
		}
		index(index-1);//定位到要操作结点的前一个结点对象
		current.setNext(new Node(obj,current.next));
		current.next.setPrior(current);
		current.next.next.setPrior(current.next);
		size++;
	}


	public boolean isEmpty() {
		return size==0;
	}

	
	public int size() {
		return this.size;
	}
}
