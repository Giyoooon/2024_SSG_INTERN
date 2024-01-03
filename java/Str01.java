package org.ssg2024;

import java.util.Scanner;

public class Str01 {

	public static void main(String[] args) {
		
		int i = 10, j = 10;
		System.out.println(i == j); // T
		// Stack에 i, j 각각 해당 값 저장
		// Stack에 저장된 값 비교
		
		String s1 = "SSG", s2 = "SSG"; 
		System.out.println(s1 == s2); // T
		
		// Stack에 저장된 주소값 비교
		// Heap에 "SSG" 저장, 같은 값이라면 같은 Heap 주소값 공유
		
		System.out.print(" --- SSG -> : ");
		Scanner sc = new Scanner(System.in);
		// Heap 공간에 s3를 위한 공간 할당
		String s3 = sc.next();
		sc.close();
		
		System.out.println("==	: " + (s1 == s3)); // F
		
		System.out.println("equals	: " + s1.equals(s3));
	}

}
