package org.ssg2024._class;

class Ani22 {
	void Cry() {
		System.out.println("으앙");
	}
}

class Dog22 extends Ani22 {
	void Cry() {
		System.out.println("멍멍");
	}
}

class Cat22 extends Ani22 {
	void Cry() {
		System.out.println("야옹");
	}
}

class Duck22 extends Ani22 {
	void Cry() {
		System.out.println("꽥꽥");
	}
}

class Tiger22 extends Ani22{
	void Cry() {
		System.out.println("어흥");
	}
}

public class Cla22 {

	public static void main(String[] args) {
//		Dog22 a1 = new Dog22();
		Ani22 a1 = new Dog22();
//		a1.Cry();
//		Cat22 a2 = new Cat22();
		Ani22 a2 = new Cat22();
//		a2.Cry();
//		Duck22 a3 = new Duck22();
		Ani22 a3 = new Duck22();
//		a3.Cry();

		
//		Ani22[] aniArr = {a1, a2, a3};		
		Ani22[] aniArr = {new Dog22(), new Cat22(), new Duck22(), new Tiger22()};
		
		for (Ani22 a : aniArr) {
			a.Cry();
		}
		
		
	}

}
