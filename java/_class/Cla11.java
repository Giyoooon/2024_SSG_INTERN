package org.ssg2024._class;


// getter, setter
class Book11{
	private String title;
	private String author;
	private int    price;
	public void setBook(String a,String b,int c){
		this.title = a; this.author = b; this.price = c;
	}
	
	public void getBook(){
		System.out.println(title+","+author+","+price);
	}
}
public class Cla11 {
	public static void main(String[] args) {
		Book11 b1 = new Book11();
		b1.setBook("자바", "Tom", 34000);
		b1.getBook();
	}

}

