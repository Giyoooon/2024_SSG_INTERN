package org.ssg2024._class;

public class Cla13 {

	public static void main(String[] args) {
		String str1 = "Hi SSGInC";
		String str2 = "Hello Korea";
				
		System.out.println(str1.substring(3));  // 
		System.out.println(str1.substring(0,3));

		System.out.println(str2 + str1);
		System.out.println(str2.concat(str1));
		System.out.println(str2.indexOf("e"));
		System.out.println(str2.lastIndexOf("e"));
		System.out.println(str2.replace("e","s"));
		System.out.println(str2.replace("or","zx"));
		
		System.out.println((int)'A');
		System.out.println((int)'a');
		System.out.println("A".compareTo("a"));
		System.out.println("a".compareTo("A"));
		System.out.println("A".compareTo("B"));
		System.out.println("D".compareTo("o"));
		System.out.println(str1.compareTo(str2));
		
		if(str1.compareTo(str2)>0) 
			{System.out.println("SK Hynix 가 크다");}
		else{System.out.println("HP Edu 가 크다");}
		
		String str3 = "ab-cd-ef";
		String[] sArr = str3.split("-");
		
		System.out.println(sArr[1]);
		
		short z1 = 10; int z2 = z1;
		int z3 = 10; short z4 = (short)z3;
		
		
		int i = 20, j = 10;
		System.out.println(String.valueOf(i)+String.valueOf(j));// 2010
		String x = "20", y="10";
		System.out.println(Integer.parseInt(x)+Integer.parseInt(y));// 30
		String z5 = "30";
		// wrapper class
		int z6 = Integer.parseInt(z5);
		
		Integer z7 = new Integer(40);
		System.out.println(z7);
		
		int z8 = 100;		//stack
		Integer z9 = 100; 	//heap
		
		System.out.println(z9.hashCode());
		System.out.println(z9.intValue());
		System.out.println(z8 == z9);
		System.out.println(z9 == z8);
		//System.out.println(z8.equals(z9)); // primitive type은 .equals 안됨
		System.out.println(z9.equals(z8));
		
				
		Integer p2 = new Integer(40);
		//int p3 = p2;
		int p3 = p2.intValue();
		
		int k1 = Integer.valueOf("777"); // heap에 있는 data만 추출 (정석)
		System.out.println(k1);
		int k0 = 888;
		String k2 = String.valueOf(k0);
		System.out.println(k2);
		
		// Integer.valueOf => 반환값 : Integer 객체
		int p1 = Integer.valueOf("333");
		// Integer.parseInt => 반환값 : int datatype 
		int p4 = Integer.parseInt("343");
		System.out.println(p1);
		System.out.println(p4);
		
// Integer.parseInt(7) <=동일 => (int)Integer.valueOf(7)
		
		Integer p11 = Integer.valueOf("333");
		int p12 = Integer.parseInt("343");
	}

}
