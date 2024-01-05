package org.ssg2024._class;

interface iAnimal29{
	// public abstract 은닉
	void Cry(); // 추상 method <-- 기본접근제한자 : public 
	void Shout();// 추상 method 
}

class Dog29 implements iAnimal29{
	// 부모의 접근 제한자보다 작아질 수 없다.
	public void Cry() {System.out.println("멍멍");} // 구현 method
	public void Shout() {System.out.println("크르렁");} // 구현 method
}

public class Cla29 {
	public static void main(String[] args) {
		Dog29 d1 = new Dog29(); 
		d1.Cry(); 
		d1.Shout();
	}
}
