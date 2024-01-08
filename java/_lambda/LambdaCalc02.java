package org.ssg2024._lambda;

interface iCalc02 {
	int Sum(int x, int y);
}

public class LambdaCalc02 {
	public static void main(String[] args) {
		// 익명 구현 객체
		iCalc02 ic01 = new iCalc02() {
			@Override
			public int Sum(int x, int y) {
				return x + y;
			}
		};

		System.out.println(ic01.Sum(10, 7));

		// Lambda 식 1
		iCalc02 ic02 = (x, y) -> {
			return (x + y);
		};
		System.out.println(ic02.Sum(100, 6));

		iCalc02 ic03 = (x, y) -> (x + y);
		System.out.println(ic03.Sum(1000, 5));

		iCalc02 ic04 = (x , y) -> x + y;
		System.out.println(ic04.Sum(10000, 4));
	}
}
