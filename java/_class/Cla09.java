package org.ssg2024._class;

class Point09{
	int x, y;
	
	Point09(int x, int y){
		this.x = x;
		this.y = y;
		System.out.println(this.x + ", " + this.y);
	}
	
//	static void sum(Point09 p1, Point09 p2) {
//		System.out.println((p1.x + p1.y) + ", " + (p2.x + p2.y));
//	}
	static Point09 pSum(Point09 p1, Point09 p2) {
		return new Point09(p1.x + p2.x, p1.y + p2.y);
	}
	
	static void sum(Point09 ...points) {
		int sumX = 0;
		int sumY = 0;
		for(Point09 p : points) {
			sumX += p.x;
			sumY += p.y;
		}
		
		System.out.println(sumX + ", " + sumY);
	}
	static String sTest(String str1, String str2) {
		return str1 + str2;
	}
}

public class Cla09 {
	public static void main(String[] args) {
		Point09 p1 = new Point09(20, 10);	// 20, 10
		Point09 p2 = new Point09(35, 25);	// 35, 25 
		Point09.sum(p1, p2); // ==> 55, 35
		
		Point09 p3 = Point09.pSum(p1, p2);
		
		String s1 = Point09.sTest("신세계", "InC");
		System.out.println(s1);
		System.out.println(p3.x + ", " + p3.y);
	}
}
