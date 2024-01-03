package org.ssg2024;

import java.util.Scanner;

public class If03 {

	public static void main(String[] args) {
		String result = "기타";
		String input = null;
		
		System.out.print("입력 : ");
		Scanner sc = new Scanner(System.in);
		input = sc.nextLine();
		sc.close();
		
		if(input.equals("동"))
			result = "East";
		else if(input.equals("서"))
			result = "West";
		else if(input.equals("남"))
			result = "South";
		else if(input.equals("북"))
			result = "North";
		
		System.out.println("결과 : " + result);
	}

}
