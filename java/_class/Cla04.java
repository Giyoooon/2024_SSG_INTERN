package org.ssg2024._class;

class Calc04{
	void sum(int i, int j) {
		System.out.println(i + j);
	}
	
	static void sub(int i, int j) {
		System.out.println(i - j);
	}
}

public class Cla04 {
	void mul(int i, int j) { // 권장하지 않음
		System.out.println(i * j);
	}
	
	static void div(int i, int j) {
		System.out.println(i / j);
	}
	
	public static void main(String[] args) {
		int a = 20, b = 10; 
		Calc04 cal4 = new Calc04();
		
		//System.out.println(cal4.sum(a, b)); -> 안됨
		
		cal4.sum(a, b);
		Calc04.sub(a, b);
		
		// Heap Space에 Cla04에 해당하는 공간을 또 차지해야 함 -> 비효율적
		Cla04 cla4 = new Cla04(); 
		cla4.mul(a, b);
		
		div(a, b); // 클래스 내에서 static 메서드는 class 이름 없이 선언이 가능하다.
	}
}
