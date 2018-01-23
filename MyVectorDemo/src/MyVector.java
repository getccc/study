//用户自定义的Vector类
public class MyVector implements Collection {
	
	public Object[] data;//集合对象数组
	private int count;//集合大小
	private final static int defaultSize=10;
	
	public MyVector(){
		init(defaultSize);
	}
	
	public MyVector(int size){
		init(size);
	}
	
	public void init(int size){
		data = new Object[size];
		count = 0;
	}
	
	//动态扩充内存
	private void ensureCapacity(int minCapacity){
		int oldCapacity = data.length;
		if (minCapacity>oldCapacity) {
			Object[] oldData = data;
			int newCapacity = oldCapacity*2;
			if (newCapacity<minCapacity) {
				newCapacity = minCapacity;
			}
			data = new Object[newCapacity];
			System.arraycopy(oldData, 0, data, 0, count);
		}
	}
	
	
	public void add(int index, Object element) throws Exception {
		if (index>=count+1) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		ensureCapacity(count+1);
		System.arraycopy(data, index, data, index+1, count-index);
		data[index]=element;
		count++;
	}

	public void add(Object element) throws Exception {
		add(count,element);
	}

	public boolean contain(Object element) throws Exception {
		
		return false;
	}

	public Object get(int index) throws Exception {
		if (index>=count||index<0) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		
		return data[index];
	}

	public void remove(int index) throws Exception {
		if (index>=count||index<0) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		int j=count-index-1;
		if (j>0) {
			System.arraycopy(data, index+1, data, index, j);
		}
		count--;
		data[count]=null;
	}
	
	private int indexOf(Object element){
		if (element == null) {
			for (int i = 0; i < count; i++) {
				if (data[i]==null) {
					return i;
				}
			}
		}else{
			for (int i = 0; i < count; i++) {
				if (data[i].equals(element)) {
					return i;
				}
			}
		}
		return -1;
	}

	public void remove(Object element)throws Exception {
		int index = indexOf(element);
		if (index>=0) {
			remove(index);
		}
	}

	public void set(int index, Object element) {
		if (index>=count||index<0) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		data[index]=element;
	}

	public int size() {
		
		return count;
	}

}
