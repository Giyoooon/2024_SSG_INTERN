package org.ssg2024._class;

/**
 * class
 * 	기반			: main
 *  DataTypes	: DB -> Table
 *  				- 상속
 *  Tool		: Method
 *  				- static
 */
class Book01 {
	// 제목
	String title;
	// 저자
	String author;
	// 가격
	int price;
	
	void printBook() {
		System.out.println(title + ", " + author + ", " + price);
	}
}

public class Cla01 {
	public static void main(String[] args) {
		int i = 10;
		Book01 b01 = new Book01();
		b01.printBook();
		
		// 값 주입 후 출력
		b01.title = "Java";
		b01.author = "Tom";
		b01.price = 30000;
		b01.printBook();
		
		Book01 b02 = new Book01();
		// 값 주입 후 출력
		b02.title = "DB";
		b02.author = "Tom";
		b02.price = 9000;
		b02.printBook();
		
		System.out.println(b01.author == b02.author); // 주소 비교
		
		System.out.println(b01.author.hashCode());
		System.out.println(b02.author.hashCode());
		System.out.println("Tom".hashCode());
	}
}
