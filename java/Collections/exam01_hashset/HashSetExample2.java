package Collections.exam01_hashset;

import java.util.*;

public class HashSetExample2 {
	public static void main(String[] args) {
		Set<Member> set = new HashSet<Member>();
		
		set.add(new Member("홍길동", 30));
		set.add(new Member("홍길동", 30));
		
		System.out.println("총 객체수 : " + set.size());
		Member m1 = new Member("Tom",20);
		Member m2 = new Member("Tom",20);
		Member m3 = new Member("Tam",20);
		System.out.println(m1+","+m1.hashCode());
		System.out.println(m2+","+m2.hashCode());
		System.out.println(m3+","+m3.hashCode());
		
		String s1 = "Java";	String s2 = "Java";
		String s3 = new String("Java");	
		String s4 = new String("Java");
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(s3.hashCode());
		System.out.println(s4.hashCode());
		System.out.println(s1==s2);
		System.out.println(s1==s3);
		System.out.println(s3==s4);
	}
}

