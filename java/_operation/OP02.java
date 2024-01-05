package org.ssg2024._operation;

public class OP02 {

	public static void main(String[] args) {
		int a = 10;
		int b = --a;
		
		System.out.println(b); // 9
		System.out.println(a); // 9
		int c = a--;
		System.out.println(c); // 9
		System.out.println(a); // 8
		int d = ++a;
		System.out.println(d); // 9
		System.out.println(a); // 9
		int e = a++;
		System.out.println(e); // 9
		System.out.println(a); // 10
	}

}
