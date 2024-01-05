package org.ssg2024._arr;

public class Arr02 {
	public static void main(String[] args) {
		int a1 = 10, a2 = 10;
		System.out.println(a1 == a2); // True

		int[] iArr1 = { 10, 20, 30 }, iArr2 = { 10, 20, 30 };
		// Heap에 공간 할당이 먼저 되어야 하기 때문에 참조값이 다르다
		System.out.println(iArr1 == iArr2); // False
		System.out.println(iArr1[0] == iArr2[0]); // True

		System.out.println("=== String Arr ===");
		String s1 = "Apple", s2 = "Apple";
		System.out.println(s1 == s2); // True

		String[] sArr1 = { "Apple", "Banana", "Grape" };
		String[] sArr2 = { "Apple", "Banana", "Grape" };

		System.out.println(sArr1 == sArr2); // F
		System.out.println(sArr1[0] == sArr2[0]); // T
		System.out.println(sArr1[0] == s1); // T

		System.out.println("=== String HashCode ===");
		System.out.println(s1.hashCode() + ", " + s2.hashCode());
		System.out.println(sArr1[0].hashCode());

		String s3 = new String("Apple");
		System.out.println(s3.hashCode());
		System.out.println(s3 == s2);
	}
}
