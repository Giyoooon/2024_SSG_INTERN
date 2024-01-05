package org.ssg2024._class;

class Book26 extends Object{
	String title  = "무제";
	String author = "미상";
	int    price  = 0;
	@Override
	public String toString(){ 
		String info =this.title+","+this.author+","+this.price;
		return info;
	}
}
public class Cla26 {

	public static void main(String[] args) {
		Book26 b1 = new Book26();
		System.out.println(b1.toString());
		System.out.println(b1);
		//--> 무제, 미상, 0 
		String s1 = "SSG";
		System.out.println(s1);
		System.out.println(s1.toString());
	}

}

