package org.ssg2024._method;

public class Meth01 {
	// 함수
	// 입력값 O, 출력값 O
	static int sum(int x, int y) { // 선언부
		// 구현부
		int ans = x + y;
		return ans;
	}

	// 입력값 O, 출력값 X
	static void sub(int x, int y) { // 선언부
		// 구현부
		System.out.println(x - y);
	}

	// 입력값 X, 출력값 O
	static int mul() { // 선언부
		// 구현부
		int ans = 10 * 3;
		return ans;
	}

	// 입력값 X, 출력값 X
	static void div() { // 선언부
		// 구현부
		System.out.println(1000 / 5);
	}

	public static void main(String[] args) {
		int a1 = sum(20, 10);
		System.out.println(a1);

		sub(20, 10);

		int m1 = mul();
		System.out.println(m1);

		div();
	}
}
