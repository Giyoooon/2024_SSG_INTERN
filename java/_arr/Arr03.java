package org.ssg2024._arr;

public class Arr03 {

	public static void main(String[] args) {
		int[] arr1 = { 11, 22, 33, 44 };
		System.out.println(arr1[3]);

		for (int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();

		for (int j : arr1) {
			System.out.print(j + " ");
		}

	}

}
