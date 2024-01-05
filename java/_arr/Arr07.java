package org.ssg2024._arr;

public class Arr07 {

	public static void main(String[] args) {
		String[][] sArr01 = { { "A", "B", "C" }, { "D", "E", "F" }, { "G", "H", "J" } };
		// C, D, H
		// System.out.println(sArr01[0][2] + " " + sArr01[1][0] + " " + sArr01[2][1]);
		for (int i = 0; i < sArr01.length; i++) {
			for (int j = 0; j < sArr01[i].length; j++) {
				System.out.print(sArr01[i][j] + " ");
			}
			System.out.println();
		}
		String[][] sArr02 = { { "A", "B", "C", "D" }, { "E", "F" }, { "G", "H", "J" } };
		// B, E, J
		// System.out.println(sArr02[0][1] + " " + sArr02[1][0] + " " + sArr02[2][2]);
		for (int i = 0; i < sArr02.length; i++) {
			for (int j = 0; j < sArr02[i].length; j++) {
				System.out.print(sArr02[i][j] + " ");
			}
			System.out.println();
		}

		System.out.println(sArr01[0][2] == sArr02[0][2]);
		System.out.println(sArr01[0][2].equals(sArr02[0][2]));
	}

}
