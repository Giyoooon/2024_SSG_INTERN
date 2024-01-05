package org.ssg2024._operation;

public class OP04 {

	public static void main(String[] args) {
			int a = 7, b = 3;
			System.out.println((a == b) && (a > b++));	// F
			System.out.println(b);						// 3
			
			System.out.println((a == b) & (a > b++));	// F
			System.out.println(b);						// 4
			
			System.out.println((a != b) || (a > b++));	// T
			System.out.println(b);						// 4
			
			System.out.println((a != b) | (a > b++));	// T
			System.out.println(b);						// 5
	}

}
