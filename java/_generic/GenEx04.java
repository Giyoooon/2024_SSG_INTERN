package org.ssg2024._generic;

class Box04<T> {
	private T t;

	public T get() {
		return t;
	}

	public void set(T t) {
		this.t = t;
	}
}

class Box041 {
	private String t;

	public String get() {
		return t;
	}

	public void set(String t) {
		this.t = t;
	}
}

class Util04 {
	static <K> String TestA(K s) {
		String ans = "정답 :" + s;
		return ans;
	}

	static Box041 boxing0(String t) {
		Box041 box = new Box041();
		box.set(t);
		return box;
	}

	static Box041 boxing1(String t) {
		Box041 box = new Box041();
		box.set(t);
		return box;
	}

	static <T> String boxing2(T t) {
		String box = new String();
		box = t.toString();
		return box;
	}

	static <T> Box04<T> boxing(T t) {
		Box04<T> box = new Box04<T>();
		box.set(t);
		return box;
	}

}

public class GenEx04 {

	public static void main(String[] args) {
		Box041 b41 = Util04.boxing0("박찬호");
		System.out.println(b41.get());

		Box04<Integer> b1 = Util04.boxing(1000);
		int intValue = b1.get();
		System.out.println(intValue);

		Box04<String> b2 = Util04.boxing("홍길동");
		String strValue = b2.get();
		System.out.println(strValue);

		Box04<Integer> b3 = Util04.<Integer>boxing(2000);
		int intValue2 = b3.get();
		System.out.println(intValue2);
		Box04<String> b4 = Util04.<String>boxing("이승엽");
		String strValue2 = b4.get();
		System.out.println(strValue2);

		String s1 = Util04.<Integer>TestA(100);
		System.out.println(s1); // 정답 : 100
		String s2 = Util04.<String>TestA("SSG");
		System.out.println(s2); // 정답 : SSG
	}

}
