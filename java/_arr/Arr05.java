package org.ssg2024._arr;

public class Arr05 {

	public static void main(String[] args) {
		String s = "사과";
		String[] sArr = { "감", "사과", "배", "딸기" };

		for (String a : sArr) {
			System.out.print(a + " ");
		}
		System.out.println();
		System.out.println(s.equals(sArr[1]));
		System.out.println(s == sArr[1]);
	}

}
