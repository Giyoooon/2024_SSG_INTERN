package org.ssg2024._class;

interface iA33{ 
	// public static final field
	String iName1 ="iA1"; 
	
	// public (default) instance implement method 
	default void iCry() {System.out.println("으앙");}
	
	// public abstract instance method
	void iRun();
	
	// public static implement method
	static void iShout() {System.out.println("으르렁"); 
	}
}

abstract class abA33{
	// instance implement field
	String abName; 
	// static implement field
	static String abName2;
	// instance implement method
	void abCry() {System.out.println("으앙");}
	// instance abstract method 
	abstract void abShout();
	// static implement method
	static void Run() {System.out.println("뛰 어"); }
	
}

class cA33{
	// instance implement field
	String cName1;
	// static implement field
	static String cName2;
	// instance implement method
	void cCry() {System.out.println("으 앙"); }
	// static implement method
	static void cShout() {System.out.println("으르렁");}
	
}
	
public class Cla33 {

	public static void main(String[] args) {

	}

}
