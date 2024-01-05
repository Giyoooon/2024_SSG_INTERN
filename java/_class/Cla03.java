package org.ssg2024._class;

class Wallet {
	static int money;
	
	static void setMoney(int input, int output) {
		money = money + input - output;
	}
}

public class Cla03 {
	public static void main(String[] args) {
		// Wallet m = new Wallet();
		// Wallet w = new Wallet();
		
		//m.setMoney(input, output);
		Wallet.setMoney(20000, 13000);
		
		//System.out.println(m.getMoney());
		System.out.println(Wallet.money);
		
		//w.setMoney(input, output);
		Wallet.setMoney(30000, 11000);
		
		//System.out.println(w.getMoney());
		System.out.println(Wallet.money);
	}
}
