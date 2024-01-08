package org.ssg2024._generic;
class Gen05{
	 static <T> T getArr(T[]  Arr) { return Arr[Arr.length-1]; }
}

class GenArr {
	static <T> T getArr(T ...Arr) {return Arr[Arr.length-1];}
}


public class GenEx05 {
	public static void main(String[] args) {
		Integer[] a1 = {111,222,333,444};
		String[] s1 = {"자바","C#","SQL"};
		System.out.println(Gen05.getArr(a1));
		System.out.println(Gen05.getArr(s1));
		
		Integer[] a2 = {555,666,777,888};
		String[] s2 = {"Java","DB","OS"};
		System.out.println(GenArr.<Integer>getArr(a2));
		System.out.println(GenArr.<String>getArr(s2));

	}

}

