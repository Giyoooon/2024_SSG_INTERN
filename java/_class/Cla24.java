package org.ssg2024._class;

class A24 { }
class B24 extends A24 { }
class C24 extends A24 { }
class D24 extends B24 { }
class E24 extends C24 { }
public class Cla24 {

	public static void main(String[] args) {
		B24 b = new B24(); C24 c = new C24();
		D24 d = new D24(); E24 e = new E24(); 
		A24 a1 = b; 
		A24 a2 = c; 
		A24 a3 = d; 
		A24 a4 = e;
		
		B24 b1 = d;
		C24 c1 = e;
		
		// 직계선상이 아니면 형변환 불가능 
		//B24 a5 = c; C24 a6 = b;
		
		System.out.println(b instanceof D24); // D24 z = new B24();
		
		System.out.println(b instanceof B24); // B24 z = new D24();
		
		System.out.println(d instanceof B24); // B24 z = new D24();
		
		System.out.println("실행완료");
	}

}
