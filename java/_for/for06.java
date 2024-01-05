package org.ssg2024._for;

public class for06 {
	public static void main(String[] args) {
		for (int i = 1; i <= 10; i++) {
			for (int j = 1; j <= 10; j++) {
				int ij = i * j;

				// 50 이 넘으면 해당 반복문 나가기
				if (ij > 50)
					break;

				if (ij % 2 == 0)
					System.out.printf("%2d ", ij);
				else {
					// 해당 연산 pass
					System.out.print("   ");
					continue;
				}
			}
			System.out.println();
		}
	}
}
