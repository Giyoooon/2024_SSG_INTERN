package org.ssg2024._class;

interface Ani31{	void Cry();		}

class Dog31 implements Ani31{ 
	public void Cry() { System.out.println("멍멍");	} 	}
class Cat31 implements Ani31{
	public void Cry() { System.out.println("야옹");	}   }
class Duck31 implements Ani31{
	public void Cry() { System.out.println("꽥꽥");	}   }

public class Cla31 {
	// Cla28 참고
	static void AnimalCry(Ani31[] Animals) {
		for (Ani31 Animal : Animals) {	Animal.Cry(); } 	}

	public static void main(String[] args) {
		// Ani31 a1 = new Dog31();
		// interface 변수 = 구현클래스 instance 공간 주소 	
		Ani31[] a = {new Dog31(), new Cat31(), new Duck31()};
		AnimalCry(a);
		//AnimalCry(new Dog31(), new Cat31(), new Duck31());
	}

}

