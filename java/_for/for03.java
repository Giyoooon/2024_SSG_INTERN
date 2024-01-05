package org.ssg2024._for;

import java.util.Scanner;

public class for03 {
	public static void main(String[] args) {
		int target = 3;
		System.out.print("구구단 몇단? ");
		Scanner sc = new Scanner(System.in);
		target = sc.nextInt();
		sc.close();

		// 3 * 1 = 3 ...
		// 시작점 : int i = 1
		// 끝점 : i <= 10
		// 스텝 : i++
		// 처리 : System.out.println(String.format("%2d * %2d = %2d", target, i, target *
		// i));

		for (int i = 1; i <= 10; i++)
			System.out.println(String.format("%d * %2d = %2d", target, i, target * i));
		System.out.println();
	}
}
