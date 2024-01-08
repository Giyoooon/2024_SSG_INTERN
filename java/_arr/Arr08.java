package org.ssg2024._arr;

public class Arr08 {
	/**
	 * bin 디렉토리 -> cmd 에서 입력
	 * java org.ssg2024._arr.Arr08 사과 배 바나나
	 * -- output
	 * 사과
	 * 배
	 * 바나나
	 * 실행성공
	 */
	public static void main(String[] args) {
		for(String arg : args) {
			System.out.println(arg);
		}
		
		System.out.println("실행 성공");
	}
}
