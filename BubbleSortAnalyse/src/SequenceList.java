
public class SequenceList implements List {
	//默认的顺序表的最大长度
	final int defaultSize = 10;
	//最大长度
	int maxSize;
	//当前长度
	int size;
	//对象数组
	Object[] listArray;
	
	public SequenceList(){
		init(defaultSize);
	}
	
	public SequenceList(int size){
		init(size);
	}
	
	private void init(int size) {
		maxSize = size;
		this.size = 0;
		listArray = new Object[size];
	}

	
	public void delete(int index) throws Exception {
		if (isEmpty()) {
			throw new Exception("顺序表为空，无法删除！");
		}
		if (index<0||index>size-1) {
			throw new Exception("参数错误！");
		}
		//移动元素
		for (int j = index; j < size-1; j++) {
			listArray[j] = listArray[j+1];
		}
		size--;
	}

	
	public Object get(int index) throws Exception {
		if (index<0||index>=size) {
			throw new Exception("参数错误！");
		}
		return listArray[index];
	}

	
	public void insert(int index, Object obj) throws Exception {
		//线性表已满
		if (size==maxSize) {
			throw new Exception("顺序表已满，无法插入！");
		}
		//插入位置编号是否合法
		if (index<0||index>size) {
			throw new Exception("参数错误");
		}
		//移动元素
		for (int j = size; j > index; j--) {
			listArray[j] = listArray[j-1];
		}
		
		listArray[index]=obj;
		size++;
	}

	
	public boolean isEmpty() {
		
		return size==0;
	}

	
	public int size() {
		
		return size;
	}

}
