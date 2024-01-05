package org.ssg2024._for;

public class for02 {
	public static void main(String[] args) {
		// 5 4 3 2 1

		// 시작점 : int = 5
		// 끝점 : i >= 1
		// 스텝 : i--
		// 처리 : System.out.print(i + " ");

		for (int i = 5; i >= 1; i--)
			System.out.print(i + " ");
		System.out.println();

		// 0 2 4 6 8 10
		// 시작점 : int i= 0
		// 끝점 : i <= 10
		// 스텝 : i += 2
		// 처리 : System.out.print(i + " ");
		for (int i = 0; i <= 10; i += 2)
			System.out.print(i + " ");
		System.out.println();

//		for (int i = 0; i <= 10; i++)
//			if (i % 2 == 0)
//				System.out.print(i + " ");
//		System.out.println();

		// 9 7 5 3 1
		// 시작점 : int i = 9
		// 끝점 : i >= 1
		// 스텝 : i -= 2
		// 처리 : System.out.print(i + " ");
		for (int i = 9; i >= 0; i -= 2)
			System.out.print(i + " ");
		System.out.println();

//		for (int i = 9; i >= 0; i--)
//			if (i % 2 == 1)
//				System.out.print(i + " ");
//		System.out.println();
	}
}
