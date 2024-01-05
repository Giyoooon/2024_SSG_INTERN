package org.ssg2024._class;

/**
 * class : 구현
 * 
 * abstract class : 구현 + 추상
 * 
 * interface : 추상
 * -------------------------
 * class <-> class : extends
 * 
 * class <-> abstract class : extends
 * 
 * interface <-> interface : extends
 * 
 * abstract class <-> abstract class : extends
 * 
 * 나머지 : implements
 * 
 */


class A10 extends Object{
	int aa1 = 10;				// default (같은 패키지)
	public int aa2 = 100;		// public (항상 공개)
	private int aa3 = 1000;		// private (자기 클래스)
	protected int aa4 = 10000;	// protected (상속관계 내 + default)
	A10(){
		System.out.println("A10() 생성자 호출");
	}

}

class B10 extends A10{
	int bb1 = 20;
	B10() {
		super(); // 생
		System.out.println("B10() 생성자 호출");
	}
}

public class Cla10 {
	public static void main(String[] args) {
		//A10 a1 = new A10();
		B10 b1 = new B10();
		System.out.println(b1.aa1);
	}
}
