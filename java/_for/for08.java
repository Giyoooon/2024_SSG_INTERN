package org.ssg2024._for;

import java.util.Scanner;

public class for08 {
	public static void main(String[] args) {
		int firstNum = 0;
		int secondNum = 0;

		// 종료조건
		int exitNum = 99;
		Scanner in = new Scanner(System.in);

		// 구구단 시작
		System.out.println("--- 구구단 시작 ---");
		boolean isContinued = true;
		// --> 무한 반복
		while (isContinued) {
			// 종료 조건
			System.out.println("종료하려면 99를 입력하세요");
			// 첫번째 숫자 입력 : a
			System.out.print("첫번째 숫자를 입력해 주세요 : ");
			firstNum = in.nextInt();
			// 두번째 숫자 입력 : b
			System.out.print("두번째 숫자를 입력해 주세요 : ");
			secondNum = in.nextInt();

			isContinued = (firstNum != exitNum) && (secondNum != exitNum);
			// --> 반복 종료 : a or b 에 99 값 입력 시
			if (!isContinued)
				continue;

			// a단 * b
			System.out.println("===== result =====");
			for (int r = 1; r <= firstNum; r++) {
				for (int c = 1; c <= secondNum; c++) {
					System.out.printf("%2d ", r * c);
				}
				System.out.println();
			}
			System.out.println("==================");
		}

		System.out.println("--- 구구단 종료 ---");
		in.close();
	}
}
