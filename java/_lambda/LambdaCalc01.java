package org.ssg2024._lambda;

interface iCalc01 {
	int Sum(int x);
}

public class LambdaCalc01 {
	public static void main(String[] args) {
		// 익명 구현 객체
		iCalc01 ic01 = new iCalc01() {
			@Override
			public int Sum(int x) {
				return x+1000;
			}
		};
		
		
		System.out.println(ic01.Sum(7));
		
		// Lambda 식 1
		iCalc01 ic02 = (x) -> {
			return (x + 1000);
		};
		System.out.println(ic02.Sum(6));
		
		iCalc01 ic03 = (x) -> (x + 1000);
		System.out.println(ic03.Sum(5));
		
		iCalc01 ic04 = x -> x + 1000;
		System.out.println(ic04.Sum(4));
	}
}
