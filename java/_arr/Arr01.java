package org.ssg2024._arr;

public class Arr01 {
	public static void main(String[] args) {
		int a1 = 10, a2 = 20, a3 = 30;

		int[] iArr1 = { 10, 20, 30, 40 };

		int iArr2[] = { 11, 21, 31, 41 };
		int[] iArr3 = new int[4]; // {0, 0, 0, 0} <- Heap에 공간 할당 시 해당 type의 기본값이 들어감
		int[] iArr4 = new int[] { 13, 23, 33, 43 };

		System.out.println(iArr1[1]);
		System.out.println(iArr2[1]);
		System.out.println(iArr3[1]);
		System.out.println(iArr4[1]);

		iArr4[1] = 7;
		System.out.println(iArr4[1]);
	}
}
