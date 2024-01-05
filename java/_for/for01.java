package org.ssg2024._for;

public class for01 {

	public static void main(String[] args) {
		// 반복문 -> 시작점, 끝점, 스텝, 처리
		// 출력 : 1 2 3 4 5

		// 시작점 : int = 1
		// 끝점 : 5 <= i
		// 스텝 : i++
		// 처리 : System.out.print(i + " ");

		// for(시작점;끝점;스텝) { 처리; }
		System.out.print("for	 : ");
		for (int i = 1; i <= 5; i++)
			System.out.print(i + " ");

		System.out.println();

		// 시작점
		int j = 1;
		// while(끝점) { 처리; 스텝; }
		System.out.print("while	 : ");
		while (j <= 5) {
			System.out.print(j++ + " ");
		}
		System.out.println();
		// 시작점
		// do { 처리; 스텝; }
		// while(끝점);
		System.out.print("do-while : ");
		int k = 1;
		do {
			System.out.print(k++ + " ");
		} while (k <= 5);
	}

}
