package org.ssg2024._arr;

import java.util.Arrays;

public class Arr10 {
	public static void main(String[] args) {
		int[] iArr01 = new int[]{10, 20, 30};
		int[] iArr02 = new int[3];
		
		System.out.println(iArr01 == iArr02);	// false
		System.out.println(iArr01[0]);			// 10
		System.out.println(iArr02[0]);			// 0
		
		iArr02 = iArr01;
		
		int[] iArr03 = new int[3];
		System.arraycopy(iArr01, 0, iArr03, 0, iArr01.length);
		
		System.out.println(iArr03 == iArr01);
		iArr03[2] = 90;
		System.out.println(Arrays.toString(iArr01));
		System.out.println(Arrays.toString(iArr03));
		
		
		String[] sArr01 = new String[] {"2024", "SSG", "INC"};
		String[] sArr02 = new String[3];
		
		sArr01 = sArr02;
		
		String[] sArr03 = new String[3];
		
		System.arraycopy(sArr01, 0, sArr03, 0, sArr01.length);
		
		
	}
}
