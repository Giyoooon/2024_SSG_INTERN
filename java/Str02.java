package org.ssg2024;

public class Str02 {
	public static void main(String[] args) {
		String s1 = "SSG";				// 약식
		String s2 = "SSG";				// 위에서 할당된 값이랑 같은 참조값이라면 new String 대신 같은 주소값 참조 
		String s3 = new String("SSG");	// 정식
		String s4 = new String(s1);
		String s5 = s1;
		
		System.out.println("\n--- == ---");
		System.out.println("s1 == s2 : " + (s1 == s2));	// T
		System.out.println("s1 == s3 : " + (s1 == s3));	// F
		System.out.println("s1 == s4 : " + (s1 == s4));	// F
		System.out.println("s1 == s5 : " + (s1 == s5));	// T
		
		System.out.println("s3 == s4 : " + (s3 == s4)); // F
		System.out.println("s4 == s5 : " + (s4 == s5)); // F
		
		System.out.println("\n--- equals ---");
		System.out.println("s1 == s2 : " + s1.equals(s2));	// T
		System.out.println("s1 == s3 : " + s1.equals(s3));	// T
		System.out.println("s1 == s4 : " + s1.equals(s4));	// T
		System.out.println("s1 == s5 : " + s1.equals(s5));	// T
		
	}
}
