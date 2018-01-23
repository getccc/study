//用户自定义的MyString类
public class MyStringBuffer {
	
	private char[] value;//字符数组
	private int count;//字符串的长度
	
	//从原串指定下标开始拷贝指定长度的字符串到目标串指定位置下标开始
	//char[] src:原串
	//int srcPos:原串的开始下标
	//char[] dst:目标串
	//int dstPos:目标串开始下标
	//int length:拷贝长度
	public static void arrayCopy(char[] src,int srcPos,char[] dst,int dstPos,int length){
		
		if (srcPos+length>src.length||dstPos + length >dst.length) {
			throw new StringIndexOutOfBoundsException(length);
		}
		for (int i = 0; i < length; i++) {
			dst[dstPos++] = src[srcPos++];
		}
	}
	
	private void expandCapacity(int newCapacity){
		char newValue[] = new char[newCapacity];
		arrayCopy(value,0,newValue,0,count);
		value=newValue;//让value指向新创建的newValue数组。
	}
	
	public MyStringBuffer(String str){
		char[] chararray = str.toCharArray();
		value = chararray;
		count=chararray.length;
	}
	
	public MyStringBuffer concat(MyStringBuffer str){
		int otherLen = str.length();
		if (otherLen==0) {
			return this;
		}
		expandCapacity(count+otherLen);
		arrayCopy(str.toCharArray(),0,this.toCharArray(),this.length(),str.length());
		count+=otherLen;
		return this;
	}
	
	public int length(){
		return count;
	}
	
	public String toString() {
		String str="";
		for (int i = 0; i < count; i++) {
			str+=value[i];
		}
		return str;
	}
	
	public char[] toCharArray(){
		return value;
	}
}
