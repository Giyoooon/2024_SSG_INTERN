package org.ssg2024._class;

class Ani19 {
	String name = "동물";
	int[] iArr1;
	// Ani19(){System.out.println(this.name);}
	void cry() {
		System.out.println("으앙");
	}
}

class Dog19 extends Ani19 {
	String name = "개";

	Dog19() {
		System.out.println(super.name);
		super.cry();
		System.out.println(this.name);
		cry();
	}

	void cry() {
		super.cry();
		System.out.println("멍멍");
	}
}

public class Cla19 {

	public static void main(String[] args) {
		Dog19 d1 = new Dog19();
		d1.cry();

	}

}