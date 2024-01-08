package org.ssg2024._class;

public class AnimalEx {
	/**
	 * 구현? - 익명 구현 객체 - 람다식
	 */
	public static void main(String[] args) {
		cAnimal a1 = new cAnimal();
		a1.Shout(); // interface 선언 -> 추상 구현
		a1.Cry(); // interface 선언 -> 일반 구현
		a1.Walk(); // 추상 class 선언,구현 -> 오버라이드
		a1.Jump(); // 추상 class 선언,구현 -> 실행
		a1.Run(); // 추상 class 선언 -> 일반 구현
		a1.Stop(); // 일반 class 선언,구현 -> 실행

		abAnimal ab = new abAnimal() {

			@Override
			public void Cry() {
				// TODO Auto-generated method stub

			}

			@Override
			void Run() {
				// TODO Auto-generated method stub

			}
		};

		iAnimal ia = new iAnimal() {

			@Override
			public void Shout() {
				// TODO Auto-generated method stub

			}

			@Override
			public void Cry() {
				// TODO Auto-generated method stub

			}
		};
	}

}
