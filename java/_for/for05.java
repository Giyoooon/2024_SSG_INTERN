package org.ssg2024._for;

import java.util.Scanner;

public class for05 {
	public static void main(String[] args) {
		System.out.print("줄 몇개? ");
		Scanner sc = new Scanner(System.in);
		int line = sc.nextInt();
		sc.close();

		for (int i = line; i >= 1; i--) {
			System.out.print(i + " : ");
			for (int j = 0; j < i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
