package org.ssg2024._method;

public class Meth03 {
	static void sum(int[] iArr) { // 매개변수 배열화
		int result = 0;
		for (int i : iArr)
			result += i;
		System.out.println(result);
	}

	// 가변인자 사용해서 받을 수 있다.
	static void sum2(int... iArr) { // 가변 길이 매개변수
		int result = 0;
		for (int i : iArr)
			result += i;
		System.out.println(result);
	}

	private static void sum3(String string, int[] iArr) {
		int result = 0;
		for (int i : iArr)
			result += i;
		System.out.println(string + " : " + result);
	}

	private static void sum4(String string, int... iArr) {
		int result = 0;
		for (int i : iArr)
			result += i;
		System.out.println(string + " : " + result);
	}

	private static void sum5(int[] iArr, String string) {
		int result = 0;
		for (int i : iArr)
			result += i;
		System.out.println(string + " : " + result);
	}
	
	/***
	 * 가변인자가 앞에 있으면 안됨
	 * 앞에 fix된 크기의 매개 인자가 있어야함 
	 * The variable argument type int of the method sum6 must be the last parameter
	 * private static void sum6(int... iArr, String string) {
	 * 		int result = 0;
	 * 		for (int i : iArr)
	 * 		result += i;
	 * 		System.out.println(string + " : " + result);
	 * }
	 */
	
	public static void main(String[] args) {
		int a = 20, b = 10, c = 5;
		int[] iArr1 = new int[] { a, b, c };

		sum(iArr1);
		sum(new int[] { 50, 40, 30, 20, 10 });
		sum2(a, b, c);
		sum2(50, 40, 30, 20, 10);
		sum(new int[] { 30, 20, 10 });
		sum3("덧셈", iArr1);
		sum4("덧셈", 40, 30, 20, 10);
		sum5(iArr1, "덧셈");
		// sum6(40, 30, 20, 10, "덧셈");
	}

}
