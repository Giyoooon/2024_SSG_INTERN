package org.ssg2024._arr;

import java.util.Arrays;

public class Arr09 {
	public static void main(String[] args) {
		int[] iArr01 = new int[3];
		int[] iArr02 = new int[3];
		int[] iArr03 = iArr01;
		
		iArr01[0] = 10;
		System.out.println(iArr01 == iArr02);	// false
		System.out.println(iArr01 == iArr03);	// true
		System.out.println(iArr03[0]);			// 10	
		System.out.println(Arrays.toString(iArr01));
		System.out.println(Arrays.toString(iArr02));
		System.out.println(Arrays.toString(iArr03));
//		iArr01[0] = 20;
		
		String[] sArr01 = new String[3];
		String[] sArr02 = new String[3];
		String[] sArr03 = sArr01;
		sArr01[0] = "SSG";
		System.out.println(sArr01 == sArr02);	// false
		System.out.println(sArr01 == sArr03);	// true
		System.out.println(sArr03[0]);			// SSG
		System.out.println(Arrays.toString(sArr01));
		System.out.println(Arrays.toString(sArr02));
		System.out.println(Arrays.toString(sArr03));
	}
}
