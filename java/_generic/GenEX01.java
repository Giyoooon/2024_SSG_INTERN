package org.ssg2024._generic;

class Gen01<ssg> {
	private ssg name;

	public ssg getX() {
		return this.name;
	}

	public void setX(ssg i) {
		this.name = i;
	}
}

class Gen02<T> {
	public void sum(T i, T j) {
		System.out.println(i + ", " + j);
	}
}

class Gen03<S, I> {
	public void sum(S i, I j) {
		System.out.println(i + ", " + j);
	}	
}

class Gen04<K, V> {
	K first;
	V second;
	
	void SetList(K first, V second){
		this.first = first;
		this.second = second;
	}
	
	String GetList(){
		return first + " : " + second;
	}
}

public class GenEX01 {
	public static void main(String[] args) {
		Gen01<String> g11 = new Gen01<String>();
		g11.setX("SSG");
		System.out.println(g11.getX());

		Gen01<Integer> g12 = new Gen01<Integer>();
		g12.setX(777);
		System.out.println(g12.getX());

		Gen01<Boolean> g13 = new Gen01<Boolean>();
		g13.setX(true);
		System.out.println(g13.getX());

		Gen01<String> g14 = new Gen01<>();
		g14.setX("Jane");
		System.out.println(g14.getX());
		Gen01<String> g15 = new Gen01<>();
		g15.setX("Alice");
		System.out.println(g15.getX());

		Gen02<Integer> g21 = new Gen02<Integer>();
		g21.sum(20, 10);

		Gen02<String> g22 = new Gen02<String>();
		g22.sum("SSG", "InC");
		Gen02<Integer> g23 = new Gen02<>();
		g23.sum(20, 10);

		
		Gen03<String, Integer> g31 = new Gen03<String, Integer>();
		g31.sum("SSG", 2019); // ==> SSG, Inc
		Gen03<String, Integer> g32 = new Gen03<>();
		g32.sum("SSG", 2020); // ==> SSG 

		Gen04<String, Integer> g41 = new Gen04<String, Integer>();
		g41.SetList("나이", 20);
		System.out.println(g41.GetList());
		Gen04<String, Integer> g42 = new Gen04<>();
		g42.SetList("키", 200);
		System.out.println(g42.GetList());
	}

}
