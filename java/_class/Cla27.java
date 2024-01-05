package org.ssg2024._class;

abstract class abAni27 { // 추상 클래스
	String name = "Arch";
	
	abAni27(){
		System.out.println("adAni27() 생성자 실행");
	}
	
	// 추상 method
	abstract void cry();
	
	// 구현 method
	void shout() {
		System.out.println("으르렁");
	}
	
	// 구현 method
	void jump() {
		System.out.println("점 프");
	}
}

class Dog27 extends abAni27{
	Dog27(){
		System.out.println("Dog27 생성자 실행");
	}
	void cry() {
		System.out.println("멍멍");
	}
	
	void jump() {
		System.out.println("껑 충"); // Method Override
	}
	
	void run() {
		System.out.println("뛰 어");
	}
}

public class Cla27 {
	public static void main(String[] args) {
		Dog27 d27 = new Dog27();

		d27.cry();	// abAni27 추상 -> Dog27 구현
		d27.jump();	// abAni27 구현 
		d27.shout();// abAni27 구현 -> Dog27 오버라이드
		d27.run();	// Dog27 구현
		
		abAni27 ab27 = new abAni27() {			
			void cry() {}
		};
	}
}
