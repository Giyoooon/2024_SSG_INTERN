package org.ssg2024._generic;

class Car03 {
	Car03() {
		System.out.println("Car03() 실행됨.");
	}
}

class Tv03 {
	Tv03() {
		System.out.println("Tv03() 실행됨.");
	}
}

class Product03<T, M> {
	private T kind;
	private M model;

	void setData(T kind, M model) {
		this.kind = kind;
		this.model = model;
	}

	T getKind() {
		return this.kind;
	}

	M getModel() {
		return this.model;
	}
}

public class GenEx03 {
	public static void main(String[] args) {
		// Kind: Tv , Model: SmartTV
		Product03<Tv03, String> p1 = new Product03<Tv03, String>();
		p1.setData(new Tv03(), "SmartTV");
		System.out.println(p1.getKind() + "," + p1.getModel());
		// Kind: Car, Model: 디젤
		Product03<Car03, String> p2 = new Product03<>();
		p2.setData(new Car03(), "디젤");
		System.out.println(p2.getKind() + "," + p2.getModel());
	}

}