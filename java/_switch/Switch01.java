package org.ssg2024._switch;

import java.util.Scanner;

public class Switch01 {
	public static void main(String[] args) {
		// odd, even program

		System.out.print("숫자 입력 : ");
		Scanner sc = new Scanner(System.in);
		int i1 = sc.nextInt();
		sc.close();
		switch (i1 % 2) {
		case 0:
			System.out.println("홀수");
			break;
		case 1:
			System.out.println("짝수");
			break;
		default:
			break;
		}

	}
}
