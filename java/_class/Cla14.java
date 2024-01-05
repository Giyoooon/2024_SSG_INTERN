package org.ssg2024._class;

class Com14{
	static void Sum(int x, int y) { System.out.println(x+y); }
	void Sub(int x, int y) { System.out.println(x-y); }
	static String company = "SSG InC";
	static String dept = "IT";
	static String info;  
	static { // static 초기화 블록<-- 조건문, 반복문  
		
		info = company + dept;
		Sum(222,111); // static method 만 가능 
	}
}
public class Cla14 {

	public static void main(String[] args) {
		System.out.println(Com14.info);
		System.out.println("실행완료");
	}

}