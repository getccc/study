//哈夫曼树类
public class HaffmanTree {
	
	//最大权值
	static final int  MAXVALUE = 1000;
	int nodeNum;//叶子结点个数
	
	public HaffmanTree(int n){
		this.nodeNum = n;
	}
	
	//构造哈夫曼树的算法
	public void haffman(int[] weight,HaffNode[] nodes){
		int n = this.nodeNum;
		//m1,m2,表示最小的两个权值，x1,x2,表示最小权值对应的编号
		int m1,m2,x1,x2;
		
		//初始化所有的结点，对应有n个叶子结点的哈夫曼树，有2n-1个结点
		for (int i = 0; i <2*n-1; i++) {
			HaffNode temp = new HaffNode();
			//初始化n个叶子结点
			if (i<n) {
				temp.weight = weight[i];
			}
			else{
				temp.weight = 0;
			}
			temp.parent=0;
			temp.flag=0;
			temp.leftChild=-1;
			temp.rightChild=-1;
			nodes[i] = temp;
		}
		//初始化n-1个非叶子结点
		for (int i = 0; i < n-1; i++) {
			m1 = m2 = MAXVALUE;
			x1 = x2 =0;
			for (int j = 0; j <n+i; j++) {
				if (nodes[j].weight<m1 && nodes[j].flag==0) {
					m2 = m1;
					x2 = x1;
					m1 = nodes[j].weight;
					x1 = j;
				}
				else if (nodes[j].weight<m2 && nodes[j].flag==0) {
					m2 = nodes[j].weight;
					x2 = j;
				}
			}
			nodes[x1].parent = n+i;
			nodes[x2].parent = n+i;
			nodes[x1].flag = 1;
			nodes[x2].flag = 1;
			nodes[n+i].weight = nodes[x1].weight+nodes[x2].weight;
			nodes[n+i].leftChild = x1;
			nodes[n+i].rightChild = x2;
			
		}
		
	}
	
	//哈夫曼编码算法
	public void haffmanCode(HaffNode[] nodes,Code[] haffCode){
		int n = this.nodeNum;
		Code code = new Code(n);
		int child,parent;
		
		for (int i = 0; i < n; i++) {
			code.start = n-1;
			code.weight = nodes[i].weight;
			child = i;
			parent = nodes[child].parent;
			while(parent != 0){
				if (nodes[parent].leftChild == child) {
					code.bit[code.start] = 0;
					
				}else{
					code.bit[code.start] = 1;
				}
				code.start--;		
				child = parent;
				parent = nodes[child].parent;
			}
			
			Code temp = new Code(n);
			for (int j = code.start+1; j <n; j++) {
				temp.bit[j] = code.bit[j];
			}
			temp.weight = code.weight;
			temp.start = code.start;
			haffCode[i] = temp;
		}
	}
}
