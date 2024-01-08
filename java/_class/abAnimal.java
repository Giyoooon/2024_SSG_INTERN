package org.ssg2024._class;

public abstract class abAnimal implements iAnimal {
	public void Shout() {
		System.out.println("으르렁");
	} // <-- iAnimal
	// void Cry(); // 일반 클래스 cAnimal 구현

	abstract void Run(); // 일반 클래스 cAnimal 구현

	void Walk() {
		System.out.println("걷기");
	} // 일반 클래스 cAnimal Override

	void Jump() {
		System.out.println("점프");
	} // --> main() 실행
}
