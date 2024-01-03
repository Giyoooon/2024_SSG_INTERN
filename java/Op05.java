package org.ssg2024;

public class Op05 {

	public static void main(String[] args) {
		int a = 6, b = 3;
		System.out.println(a&b);
		System.out.println(a|b);
		System.out.println(a^b); // bit 반전
		System.out.println(~a); 
		
		byte x1 = 127;
		System.out.println(x1 + 1); // 더미 공간을 할당한다
		int x2 = Integer.MAX_VALUE +1 ;
		System.out.println(x2);

	}

}
