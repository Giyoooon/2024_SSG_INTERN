package org.ssg2024._class;

// interface - interface (같은거) : extends
interface iA32 {
}

interface iB32 extends iA32 {
}

// abstract class - abstract class (같은거) : extends
abstract class abC32 {
}

abstract class abD32 extends abC32 {
}

// class - class (같은거) : extends
class cE32 {
}

class cF32 extends cE32 {
}

// abstract class - interface (다른거) : implements
abstract class abG32 implements iA32 {
}

class cH23 implements iA32 {
}

// class - abstract class (본질이 같은거) : extends
class cI32 extends abC32 {
}

public class Cla32 {

	public static void main(String[] args) {
		System.out.println("실행 성공");

	}

}
