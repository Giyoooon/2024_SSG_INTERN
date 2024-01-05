package org.ssg2024._class;

abstract class Ani28{ 
	String name; 
	abstract void Cry(); 

}

class Dog28 extends Ani28{ 
	Dog28() {
		this.name = "개";
	}
	void Cry() { 
		System.out.println(name + ": 멍멍");	
	}
}

class Cat28 extends Ani28{ 
	Cat28() {
		this.name = "고양이";
	} 
	void Cry() { 
		System.out.println(name + ": 야옹");	
	}   
}

class Duck28 extends Ani28{
	Duck28() {
		this.name = "오리";
	}
	void Cry() { 
		System.out.println(name + ": 꽥꽥");	
	}   
}

//class AniAct28 { // util
//	static void AnimalCry(Ani28 ... Ani){ // Ani28[] Ani
//		for(Ani28 Animal : Ani) {
//			Animal.Cry();
//		}
//	}
//}


public class Cla28 {
	static void AnimalCry(Ani28 ... Ani){ // Ani28[] Ani
		for(Ani28 Animal : Ani) {
			Animal.Cry();
		}
	}
	public static void main(String[] args) {
		Ani28[] aniArr = {new Dog28(), new Cat28(), new Duck28()};
		
		for(Ani28 ani : aniArr)
			ani.Cry();
		
		AnimalCry(new Dog28(),new Cat28(),new Duck28());
	}	
}

