import java.util.List;


public class Test {
	
	public static void main(String[] args) throws Exception {
		/*
		CycleLinkList list = new CycleLinkList();
		for (int i = 0; i < 10; i++) {
			int temp = ((int)(Math.random()*100))%100;
			list.insert(i, temp);
			System.out.print(temp+" ");
		}
		System.out.println("\n----------------------");
		list.delete(4);
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i)+" ");
		}*/
		
		Game game = new Game(6, 3);
		game.play();
		
	}
}
