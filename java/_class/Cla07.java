package org.ssg2024._class;

class Book07{
	String title;
	String author;
	int price;

	Book07(){
		this("무제");
	}	
	
	Book07(String title, String author, int price) {
		this.title = title;
		this.author = author;
		this.price = price;
	}

	Book07(String title, String author) {
		this.title = title;
		this.author = author;
	}

	Book07(String title) {
		this.title = title;
	}

	void pBook() {
		System.out.println(this.title + ", " + this.author + ", " + this.price);
	}
}

public class Cla07 {
	public static void main(String[] args) {
		Book07 b1 = new Book07("자바", "Tom", 20000);
		b1.pBook();
		Book07 b2 = new Book07("자바", "Tom");
		b2.pBook();
		Book07 b3 = new Book07("자바");
		b3.pBook();
	}
}
