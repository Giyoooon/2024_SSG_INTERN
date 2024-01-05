package org.ssg2024._class;

class Book12{
	private String title;
	private String author;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

}
public class Cla12 {

	public static void main(String[] args) {
		Book12 b1 = new Book12();
		b1.setTitle("자바"); 
		System.out.println(b1.getTitle());

	}

}
