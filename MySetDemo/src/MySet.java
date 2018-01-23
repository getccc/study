//用户自定义的MySet
public class MySet {
	
	private MyVector value = new MyVector();
	
	//添加对象
	public void add(Object obj)throws Exception{
		//不允许添加空对象
		if (obj==null) {
			return;
		}
		//由于set类不允许添加重复的元素，所以先查找该对象是否存在
		if (value.indexOf(obj)<0) {
			value.add(obj);
		}
		else{
			return;
		}
		
	}
	
	//删除对象
	public void remove(Object obj) throws Exception{
		value.remove(obj);
	}
	
	//是否包含一个对象
	public boolean contain(Object obj)throws Exception{
		return value.contain(obj);
	}
	
	public int size(){
		return value.size();
	}
	
	public Object get(int index)throws Exception{
		return value.get(index);
	}
	
	//是否包含另一个集合对象
	public boolean include(Object obj)throws Exception{
		if (obj instanceof MySet) {
			MySet set = (MySet)obj;
			int count=0;
			while(count<set.size()){
				Object temp = set.get(count);
				count++;
				if (!contain(temp)) {
					return false;
				}
			}
			return true;
		}else{
			return false;
		}
	}
	
	//判断两个集合是否相等
	public boolean equals(Object obj){
		if (obj instanceof MySet) {
			MySet set = (MySet)obj;
			try {
				if (include(set)&&set.include(this)) {
					return true;
				}else{
					return false;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}else{
			return false;
		}
	}
	
	//判断集合是否为空
	public boolean isEmpty(){
		return value.size()>0;
	}
}
