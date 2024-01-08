package org.ssg2024._class;

// 선언적 설계
class cDog34 implements iAnimal{
	@Override
	public
	void Shout() {
		System.out.println("므르렁 1");
	}
	
	@Override
	public void Cry(){
		System.out.println("멍 멍 1");
	}
}

public class Cla34 {
	public static void main(String[] args) {
		cDog34 dog1 = new cDog34();
		dog1.Shout();	//므르렁 1
		dog1.Cry();		// 멍멍 1
		
		// 익명 구현 객체, 클래스
		iAnimal dog2 = new iAnimal() {
			public void Shout() {
				System.out.println("므르렁 2");
			}
			public void Cry() {
				System.out.println("멍 멍 2");
			}
		};
		dog2.Shout();
		dog2.Cry();
	}
}
