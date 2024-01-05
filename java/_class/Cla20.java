package org.ssg2024._class;

class A20 {int a = 200; }
class B20 extends A20{int b = 100; }

public class Cla20 {

	public static void main(String[] args) {
		// 없는 것을 있다고 하면 안된다
		// 있는 것을 없다고 해도 된다. (바람직하진 않음)
		
		/** 
		 * “부모님은 마음이 넓어서 자식을 품을 수 있지만, 
		 *  자식은 마음이 좁아서 부모님을 담을 수 없다”
		 */
		
		A20 z1 = new A20();
		B20 z2 = new B20();
		A20 z3 = new B20();
		// 메모리 상에서 불가 (z4.b가 안보임)
//		B20 z4 = new A20(); // <-- 실행하면 에러 		
		B20 z4 = (B20)new A20(); // <-- 실행하면 에러
		
		B20 z5 = (B20)z3;
		System.out.println(((B20)z3).b);
		// 적은 항목(부모) = 많은 항목(자식) ==> z3 
		// 부모클래스 변수 = 자식클래스 공간 :=> 자동타입형변환 
		
		
		// 큰 size = 작은 Size 
		short a = 10;
		int b = a;
		int c = 20;
		short d = (short)c;
		
		System.out.println("실행성공");
	}

}

