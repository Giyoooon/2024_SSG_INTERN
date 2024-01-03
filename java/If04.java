package org.ssg2024;

import java.util.Scanner;

public class If04 {
	public static void main(String[] args) {
		int iKr = 0, iEn = 0;
		int iTotal = 0, iAvg = 0;
		
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수 입력: ");
		iKr = sc.nextInt();
		
		System.out.print("영어 점수 입력: ");
		iEn = sc.nextInt();
		
		sc.close();
		
		iTotal = iKr + iEn;
		iAvg = iTotal / 2;
		System.out.printf("%-8s: %d\n", "점수 총합",iTotal);
		System.out.printf("%-8s: %d\n", "점수 평균", iAvg);
		
		String grade = "평균낙제";
		
		if(iKr < 60 || iEn < 60)
			grade = "과목 낙제";
		else if(iKr + iEn >= 90 * 2)
			grade = "우수";
		else if(iKr + iEn >= 80 * 2)
			grade = "보통";
		else if(iKr + iEn >= 70 * 2)
			grade = "부족";
		
		
		System.out.printf("%-8s: %s", "성적 " ,grade);
	}
}
