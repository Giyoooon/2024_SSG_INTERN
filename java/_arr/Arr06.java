package org.ssg2024._arr;

public class Arr06 {

	public static void main(String[] args) {
		int[][] iArr01 = { { 10, 20, 30 }, { 40, 50, 60 }, { 70, 80, 90 } };
		// 출력 => 30 40 80
//		System.out.println(iArr01[0][2] + " " + iArr01[1][0] + " " + iArr01[2][1]);

		for (int i = 0; i < iArr01.length; i++) {
			for (int j = 0; j < iArr01[i].length; j++) {
				System.out.print(iArr01[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println("==============");
		int[][] iArr02 = { { 10, 20, 30, 40 }, { 50, 60 }, { 70, 80, 90 } };
		// 출력 => 30 40 80
//		System.out.println(iArr02[0][2] + " " + iArr02[0][3] + " " + iArr02[2][1]);

		for (int i = 0; i < iArr02.length; i++) {
			for (int j = 0; j < iArr02[i].length; j++) {
				System.out.print(iArr02[i][j] + " ");
			}
			System.out.println();
		}
	}

}
