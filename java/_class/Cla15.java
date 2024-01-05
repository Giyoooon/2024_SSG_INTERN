package org.ssg2024._class;

public class Cla15 {
	// static을 쓰자.
	static int a;
	int b = 25;	
	static void Hi() {System.out.println("Hi"); }
	void Hi2() {System.out.println("Hi 2"); }

	public static void main(String[] args) {
		System.out.println(a);
		//System.out.println(b); <-- Instance 멤버 직접 사용불가
		Hi(); 
		Cla15 c1 = new Cla15();
		c1.Hi2();
		//c1.a;
	}

}
