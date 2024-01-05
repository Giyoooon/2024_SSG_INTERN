package org.ssg2024._class;

class Sing16{
	// 기본 메서드(Object) 9 + 생성자 1 : 10개
	private static Sing16 sing = new Sing16();
	private Sing16() {
		
	}
	
	static Sing16 getInstance() {
		return sing;
	}
}

public class Cla16 {
	
	public static void main(String[] args) {
//		Sing16 s1 = new Sing16();
		Sing16 s2 = Sing16.getInstance();
		Sing16 s3 = Sing16.getInstance();
//		Sing16 s4 = Sing16.sing;
		
		System.out.println(s2 == s3);
	}
}
