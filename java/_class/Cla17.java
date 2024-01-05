package org.ssg2024._class;


class Ani17 {
	String name = "이름";
	void cry() {System.out.println("응애");};
}

class Dog17 extends Ani17{
	String name = "꼬두";
	
	@Override
	void cry() {
		System.out.println("멍멍");
	}
}

class Cat17 extends Ani17 {
	String name = "아치";
	void cry() {
		System.out.println("애옹");
	}
}

public class Cla17 {
	
	public static void main(String[] args) {
		Dog17 d1 = new Dog17();
		System.out.println(d1.name);
		d1.cry();
		
		Cat17 c1 = new Cat17();
		System.out.println(c1.name);
		c1.cry();
	}
}
