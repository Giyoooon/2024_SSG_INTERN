package org.ssg2024._if;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class If02 {
	public static void main(String[] args) {
		// 숫자를 입력받아서 
		// 4으로 나눈 나머지가 0이면 기타
		// 4으로 나눈 나머지가 1이면 가위
		// 4으로 나눈 나머지가 2이면 바위
		// 4으로 나눈 나머지가 3이면 보
		int ggankkenppo;
		System.out.println("숫자 입력 :  ");
		Scanner sc = new Scanner(System.in);
		ggankkenppo = sc.nextInt();
		sc.close();
		ggankkenppo %= 4;
		if(ggankkenppo == 1)
			System.out.println("가위");
		if(ggankkenppo == 2)
			System.out.println("바위");
		if(ggankkenppo == 3)
			System.out.println("보");
		else
			System.out.println("기타");
		
		String[] result = {"기타", "가위", "바위", "보"};
		System.out.println(result[ggankkenppo]);
		
		Map<Integer, String> map = new HashMap<>() {{
			put(0, "기타");
			put(1, "가위");
			put(2, "바위");
			put(3, "보");
		}};
		
		System.out.println(map.get(ggankkenppo));
	}
}
