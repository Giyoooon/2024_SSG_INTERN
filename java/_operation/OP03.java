package org.ssg2024._operation;

public class OP03 {

	public static void main(String[] args) {
		int i = 4, j = 3;
		System.out.println(i > j);
		System.out.println(i <= j);
		System.out.println(i == j);
		System.out.println(i != j);
		System.out.println(true && false);
		System.out.println(true || false);
		
		
		System.out.println(6 & 4); // 110 & 100 -> 4
		System.out.println(6 | 4); // 110 | 100 -> 6
		System.out.println(6 & 3); // 110 & 011 -> 2
		System.out.println(6 | 3); // 110 | 011 -> 7
	}

}
