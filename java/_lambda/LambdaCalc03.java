package org.ssg2024._lambda;

interface iCalc03 {
	int Sum(int x, int y);

	int Sub(int x, int y);
}

interface kr03 {
	// Hi Korea 출력
	void Hi();
}

public class LambdaCalc03 {
	public static void main(String[] args) {
		// 익명 구현 개체 -->
		iCalc03 ic01 = new iCalc03() {
			public int Sum(int x, int y) {
				return x + y;
			}

			public int Sub(int x, int y) {
				return x - y;
			}

		};

		System.out.println(ic01.Sum(30, 20));
		System.out.println(ic01.Sub(30, 20));
		// Lambda식 구성
		// Lambda식은 functional interface 만 수용
//					 -> interface 내 대표 추상 method가 오직 하나만 존재
		// iCalc03 ic02 = (x, y) -> {return x - y;};
		
		kr03 kr01 = () -> System.out.println("Hi Korea");
		
		kr01.Hi();
	}
}
