package org.ssg2024._class;

class Book06{
	String title = "무제";
	String author = "미상";
	int price = 0;
	
	// 생성자 method overloading
	
	Book06(){
		System.out.println("Book05 생성됨");
		System.out.println(title + ", " + author + ", " + price);
	}
	
	Book06(String title){
		this.title = title;
		System.out.println(title + ", " + author + ", " + price);
	}
	
	Book06(String title, String author){
		this.title = title;
		this.author = author;
		System.out.println(title + ", " + author + ", " + price);
	}
	
	Book06(String title, String author, int price){
		this.title = title;
		this.author = author;
		this.price = price;
		System.out.println(title + ", " + author + ", " + price);
	}
}

public class Cla06 {
	public static void main(String[] args) {
		Book05 b1 = new Book05();
		Book05 b4 = new Book05("Java", "Jane", 25000);
		
	}
}
