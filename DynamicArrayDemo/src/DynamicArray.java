//动态数组
public class DynamicArray {
	
	final static int defaultSize=10;
	Object[] arr;//对象数组
	int maxSize;//数组的最大长度
	
	//默认构造方法
	public DynamicArray()
	{
		init(defaultSize);
	}
	
	//指定对象数组长度的构造方法
	public DynamicArray(int size)throws Exception{
		if (size<=0) {
			throw new Exception("数组长度参数异常");
		}
		init(size);
	}
	
	//根据已有对象数组，拷贝复制生成新的对象数组
	public DynamicArray(DynamicArray a){
		arr = new Object[a.maxSize];
		for (int i = 0; i < a.maxSize; i++) {
			arr[i]=a.arr[i];
		}
		maxSize = a.maxSize;
	}
	
	
	public void init(int size){
		arr = new Object[size];
		maxSize = size;
	}
	
	//调整对象数组的大小
	public void reSize(int size) throws Exception{
		//如果调整大小<=,非法！
		if (size<=0) {
			throw new Exception("数组长度参数异常");
		}
		//如果调整大小与原来相同，没有调整必要，直接返回
		if (size==maxSize) {
			return ;
		}
		//构造一个新的对象数组
		Object[] newArray = new Object[size];
		//判断新调整的大小，比原来大，还是比原来小
		int n=(size>maxSize)?maxSize:size;
		for(int i = 0;i<n;i++) {
			newArray[i] = arr[i];
		}
		arr = newArray;
		maxSize = size;
	}
	
}
