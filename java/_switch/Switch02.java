package org.ssg2024._switch;

import java.util.Scanner;

public class Switch02 {

	public static void main(String[] args) {
		String result = "기타";
		String input = null;

		System.out.print("입력 : ");
		Scanner sc = new Scanner(System.in);
		input = sc.nextLine();
		sc.close();
		switch (input) {
		case "동":
			result = "East";
			break;
		case "서":
			result = "West";
			break;
		case "남":
			result = "South";
			break;
		case "북":
			result = "North";
			break;
		default:
			result = "잘 모르겠어요";
			break;
		}
		System.out.println("결과 : " + result);
	}

}
