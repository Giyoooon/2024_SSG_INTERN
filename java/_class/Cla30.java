package org.ssg2024._class;

interface iAnimal30{
	//***** Java 7.x 버전 
	// 상수화 필요
	static final String name = "동물"; 
				 String name2 = "동물2"; // static final => 상수
	void Cry(); // public abstract method , instance member
	// public abstract void Cry(); 
	
	//***** Java 8.x 버전 
	// default method <-- 구현부까지 확정 , instance member 
	//					<-- 하위 클래스에서 Override 가능
	// public default (abstract) void Shout() { ~~~ }
	default void Shout() {System.out.println("으르렁");};
	// static method <-- 구현부까지 확정 , static member
	static void Run() {System.out.println("뛰 어");}
}

class Dog30 implements iAnimal30{
	public void Cry() {System.out.println("멍멍");} // 구현 method
	public void Shout() {System.out.println("크르렁");} // 구현 method
}
public class Cla30 {

	public static void main(String[] args) {
		Dog30 d1 = new Dog30(); d1.Cry(); d1.Shout();
		//d1.name = "아치";
		System.out.println(iAnimal30.name2);
		iAnimal30.Run();
		System.out.println(d1.name);
	}

}

