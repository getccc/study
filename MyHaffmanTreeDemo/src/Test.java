
public class Test {
 
	public static void main(String[] args) {
		
		int n = 4;
		int[] weight = {1,3,5,7};
		HaffmanTree haffmanTree = new HaffmanTree(n);
		HaffNode[] nodes = new HaffNode[2*n-1];
		Code[] codes = new Code[n];
		//构造哈夫曼树
		haffmanTree.haffman(weight, nodes);
		//生成哈夫曼编码
		haffmanTree.haffmanCode(nodes, codes);
		
		//打印哈夫曼编码
		for (int i = 0; i < n; i++) {
			System.out.print("weight="+codes[i].weight+"Code=");
			for (int j =codes[i].start+1; j <n; j++) {
				System.out.print(codes[i].bit[j]);
			}
			System.out.println();
		}
	}
}
