package org.ssg2024._method;

public class Meth02 {
	static void sum(int a) {
		System.out.println(10000 + a);
	}

	static void sum(int a, int b) {
		System.out.println(a + b);
	}

	static void sum(int a, int b, int c) {
		System.out.println(a + b + c);
	}

	static void sum(String a, String b) {
		System.out.println(a + b);
	}

	public static void main(String[] args) {
		int a = 20, b = 10, c = 5;
		sum(a);
		sum(a, b);
		sum(a, b, c);
		sum("신세계", "INC");
	}
}
