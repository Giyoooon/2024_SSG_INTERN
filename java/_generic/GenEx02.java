package org.ssg2024._generic;

class Box021 {
	private Object name;

	public void SetName(Object i) {
		this.name = i;
	}

	public Object GetName() {
		return this.name;
	}
}
// Object 타입 사용  -> 빈번한 타입 변환 발생 ->  프로그램 성능 저하

class Box022<T> {
	private T name;

	public void SetName(T i) {
		this.name = i;
	}

	public T GetName() {
		return this.name;
	}
}

public class GenEx02 {

	public static void main(String[] args) {
		Box021 b1 = new Box021();
		
		b1.SetName(21);
		System.out.println(b1.GetName());
		
		int i1 = (int) b1.GetName();
		b1.SetName("KR");
		System.out.println(b1.GetName());
		String s1 = (String) b1.GetName();

		Box022<Integer> b2 = new Box022<Integer>();
		b2.SetName(22);
		System.out.println(b2.GetName());
		Box022<String> b3 = new Box022<>();
		b3.SetName("Korea");
		System.out.println(b3.GetName());
	}

}
