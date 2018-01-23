import java.util.AbstractSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.Vector;



public class MyLotto {
	
	public static void main(String[] args) {
		
		Vector<Integer> v = new Vector<Integer>();
		
		//初始化红球号码
		for (int i = 0; i <=33; i++) {
			v.add(i);
		}
		
		//随机生成六个红球
		for (int i = 0; i <6; i++) {
			int len = v.size();
			int random = (int)(Math.random()*100)%len;
			System.out.println("第"+(i+1)+"个红球:"+v.get(random));
			v.remove(random);
		}
		
		//随机抽取篮球
		int num = (int)(Math.random()*100)%16;
		System.out.println("篮球号码是："+(num+1));
		
	}
}
