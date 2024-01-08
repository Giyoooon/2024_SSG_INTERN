package org.ssg2024._class;

public class cAnimal extends abAnimal {
	// void Shout(); // abAnimal 구현
	@Override
	public void Cry() {
		System.out.println("으앙");
	}

	@Override
	void Run() {
		System.out.println("뛰어");
	}
	
	@Override
	void Walk() {
		System.out.println("걷자");
	} // <-- abAnimal/Override
	// void Jump(); // <-- abAnimal

	void Stop() {
		System.out.println("멈춰");
	} // cAnimal 구현
	// void Walk_Old() { super.Walk(); }
}
