import java.util.Arrays;

//用户自定义的MyString
public class MyString {
	
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
	
	public MyString(){
		value=new char[0];
		count=0;
	}
	
	//构造方法：实现从一个字符串中取出新的字符串
	//char[] value:已有的字符数组。
	//int offset:起始下标
	//int count :拷贝的个数
	public MyString(char[] value,int offset,int count){
		//判断起始位置是否<0
		if (offset<0) {
			throw new StringIndexOutOfBoundsException(offset);
		}
		//判断count是否<0
		if (count<0) {
			throw new StringIndexOutOfBoundsException(count);
		}
		//判断起始位置+count是否大于value字符串的长度
		if (offset+count>value.length) {
			throw new StringIndexOutOfBoundsException(offset+count);
		}
		this.value = new char[count];
		this.count = count;
		arrayCopy(value,offset,this.value,0,count);
	}
	
	//根据已有的字符串数组，构造新的字符串
	public MyString(char[] value){
		this.count = value.length;
		this.value = new char[count];
		arrayCopy(value,0,this.value,0,count);
	}
	
	//使用JDK本身的String类，构造新的字符串
	public MyString(String str){
		char[] chararray = str.toCharArray();
		value = chararray;
		count = chararray.length;
	}

	
	public String toString() {
		String str="";
		for (int i = 0; i < count; i++) {
			str+=value[i];
		}
		return str;
	}
	
	public int length(){
		return count;
	}
	
	public char charAt(int index){
		if (index<0||index>=count) {
			throw new StringIndexOutOfBoundsException(index);
		}
		return value[index];
	}
	
	//比较两个字符串的大小
	//如果当前字符串大于比较字符串，返回一个正整数
	//如果当前字符串等于比较字符串，返回0
	//如果当前字符串小于比较字符串，返回负整数
	public int compareTo(MyString anotherStr){
		int len1 = this.count;
		int len2 = anotherStr.length();
		int n = Math.min(len1, len2);
		char[] v1 = value;
		char[] v2 = anotherStr.value;
		int i = 0;
		while(i<n){
			char c1 = v1[i];
			char c2 = v2[i];
			if (c1!=c2) {
				return c1-c2;
			}
			i++;
		}
		return len1-len2;
	}
	
	//求子串1,给出起始下标0
	public MyString substring(int beginIndex,int endIndex){
		if (beginIndex<0) {
			throw new StringIndexOutOfBoundsException(beginIndex);
		}
		if (endIndex>count) {
			throw new StringIndexOutOfBoundsException(endIndex);
		}
		if (beginIndex>endIndex) {
			throw new StringIndexOutOfBoundsException(endIndex-beginIndex);
		}
		return (beginIndex==0&&endIndex==count)?this:new MyString(value,beginIndex,endIndex-beginIndex);
	}
	
	//求子串，给出开始下标，到字符串结尾
	public MyString substring(int beginIndex){
		return substring(beginIndex,count);
	}
	
	public char[] toCharArray(){
		char[] buff = new char[count];
		arrayCopy(value,0,buff,0,count);
		return buff;
	}
	
	//字符串的连接
	public MyString concat(MyString str){
		int otherLen = str.length();
		char[] strarray = str.toCharArray();
		if (otherLen==0) {
			return this;
		}
		char[] buff = new char[count+otherLen];
		arrayCopy(value,0,buff,0,count);
		arrayCopy(strarray,0,buff,count,otherLen);
		return new MyString(buff);
	}
	
	//插入子串
	public MyString insert(MyString str,int pos){
		
		if (pos<0||pos>count) {
			throw new StringIndexOutOfBoundsException(pos);
		}
		
		if (pos!=0) {
			//获得插入点之前的子串
			MyString str1 = this.substring(0, pos);
			//获得插入点之后的子串
			MyString str2 = this.substring(pos);
			MyString res1 = str1.concat(str);
			MyString res2 = res1.concat(str2);
			return res2;
		}else{
			return str.concat(this);
		}
	}
	
	//删除子串
	public MyString delete(int beginIndex,int endIndex){
		if (beginIndex<0) {
			throw new StringIndexOutOfBoundsException(beginIndex);
		}
		if (endIndex>count) {
			throw new StringIndexOutOfBoundsException(endIndex);
		}
		if (beginIndex>endIndex) {
			throw new StringIndexOutOfBoundsException(endIndex-beginIndex);
		}
		//删除整个字符串
		if (beginIndex==0&&endIndex==count) {
			return new MyString();
		}else{
			//获得删除点前的子串
			MyString str1 = this.substring(0, beginIndex);
			//获得删除点后的子串
			MyString str2 = this.substring(endIndex);
			
			return str1.concat(str2);
		}
	}
}
