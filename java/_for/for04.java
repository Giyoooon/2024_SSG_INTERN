package org.ssg2024._for;

public class for04 {
	public static void main(String[] args) {
		// 시작점 : int i = 0
		// 끝점 : i <= 10
		// 스텝 : i++
		// 처리 : System.out.print(i * j + " ");

		for (int i = 1; i <= 10; i++) {
			for (int j = 1; j <= 10; j++) {
				System.out.printf("%2d ", i * j);
			}
			System.out.println();
		}
	}
}
