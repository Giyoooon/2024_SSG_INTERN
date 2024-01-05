package org.ssg2024._if;

import java.util.Scanner;

public class If01 {

	public static void main(String[] args) {
		// odd, even program
		
		System.out.print("숫자 입력 : ");
		Scanner sc = new Scanner(System.in);
		int i1 = sc.nextInt();
		sc.close();
		if(i1 % 2 == 1) 
			System.out.println("홀수임");
		else
			System.out.println("짝수임");
	}

}
