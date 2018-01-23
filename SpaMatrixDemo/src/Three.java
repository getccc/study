//三元组类
public class Three {
	
	public int row;
	public int col;
	public double value;
	
	public Three(int r,int c,double v){
		this.row = r;
		this.col = c;
		this.value = v;
	}
	
	public Three(){
		this(0,0,0.0);
	}
}
