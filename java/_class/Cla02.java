package org.ssg2024._class;

public class Cla02 {
	public static void main(String[] args) {
		String s1 = new String();
		s1 = "SSG";
		String s2 = new String("SSG");
		
		System.out.println(s1 + "," + s2);
		
		Book01 b01 = new Book01(); // 같은 패키지
		b01.title = s1;
		b01.printBook();
		
		System.out.println(b01.title == s1);
		System.out.println(b01.title.hashCode());
		System.out.println(s1.hashCode());
		
		System.out.println(b01.hashCode());
	}
}
