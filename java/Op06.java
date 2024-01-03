package org.ssg2024;

public class Op06 {

	public static void main(String[] args) {
		int a = 6 , b = 3; 
		 // 0110    // 0011
		System.out.println(a & b);// 0010 -> 2
		System.out.println(a | b);// 0111 -> 7
		System.out.println(a ^ b);// 0101 -> 5 
		
		System.out.println(a >> 1); //0110 --> 0011
		System.out.println(b << 1); //0011 --> 0110

	}

}
