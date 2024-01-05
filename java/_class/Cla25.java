package org.ssg2024._class;

//final : 봉인하다. 
// 상수 : 변경 불가
// method : override 불가
// class : 상속 불가

class A25{
	final int a;
//	A25() {} 
	A25(int a) {this.a = a;}

	static final int b = 777; // <= Java 에서의 상수 

	final void Hi() {System.out.println("SK Hi"); }
	// final 메소드 -> Override 불가 
}

//final 클래스 -> 상속 불가 
final class B25 extends A25{
	 B25(int a) { super(a); }
	 //void Hi() {System.out.println("HP Hi"); }
}

//class C25 extends B25 {	C25(int a) { super(a); } }

public class Cla25 {

	public static void main(String[] args) {
		A25 a1 = new A25(888);
		System.out.println(a1.a);
		
		B25 b1 = new B25(999);
		//b1.a = 20; 
		System.out.print(b1.a);

	}

}

