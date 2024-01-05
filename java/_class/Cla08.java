package org.ssg2024._class;


class Calc08{
	static int sum(int iArr1[]) { // 가변길이 매개변수
		int ans = 0;
		for(int i = 0; i < iArr1.length; i++) {
			ans += iArr1[i];
		}
		return ans;
	}
	
	static void sum2(int...iArr1) {
		int ans = 0;
		for(int i = 0; i < iArr1.length; i++) {
			ans += iArr1[i];
		}
		System.out.println(ans);
	}
}

public class Cla08 {
	public static void main(String[] args) {
		int[] iArr1 = {1,2,3};
		int ans = 0;
		for(int i = 0; i < iArr1.length; i++) {
			ans += iArr1[i];
		}
		
		System.out.println(ans);
		
		int[] iArr2 = {10, 20, 30, 40};
		Calc08.sum(iArr1); // 6
		Calc08.sum(iArr2); // 100
		Calc08.sum2(1,2,3,4,5);
	}
}
