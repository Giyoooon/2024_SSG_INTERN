package org.ssg2024._try;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Try01 {
	public static void main(String[] args) {
		System.out.print("숫자 입력 -> ");
		Scanner sc = new Scanner(System.in);

		try {
			int si = sc.nextInt();
			int so = 100 / si;
			System.out.println("result = " + so);
		} catch (ArithmeticException ae) {
			System.out.println(ae);
			System.out.println("0 으로는 나눌 수 없다");
		} catch (InputMismatchException ie) {
			System.out.println(ie);
			System.out.println("숫자를 입력해야 함");
		} finally {
			System.out.println("-- 항상 실행 됨 --");
		}
		System.out.println("-- 마지막 출력 --");
		sc.close();

		/**
		 * 숫자 입력 -> 0 Exception in thread "main" java.lang.ArithmeticException: / by
		 * zero at org.ssg2024._try.Try01.main(Try01.java:10)
		 */
	}
}
