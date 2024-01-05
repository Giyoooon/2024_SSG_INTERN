package org.ssg2024._class;

class TV23{
	void PowerOn() {System.out.println("TV 켜짐");}
	void PowerOff() {System.out.println("TV 꺼짐");}
}

class SKTV23 extends TV23{
	void PowerOn() {System.out.println("SKTV 켜짐");}
	void PowerOff() {System.out.println("SKTV 꺼짐");}
}

class LGTV23 extends TV23 {
	void PowerOn() {System.out.println("LGTV 켜짐");}
	void PowerOff() {System.out.println("LGTV 꺼짐");}
}

class HDTV23 extends TV23 {
	void PowerOn() {System.out.println("HDTV 켜짐");}
	void PowerOff() {System.out.println("HDTV 꺼짐");}
}

class SSTV23 extends TV23 {
	void PowerOn() {System.out.println("SSTV 켜짐");}
	void PowerOff() {System.out.println("SSTV 꺼짐");}
}


public class Cla23 {

	public static void main(String[] args) {
		TV23[] TVs = {new SKTV23(), new LGTV23(), new SSTV23(), new HDTV23()};
		for(TV23 tv : TVs) { tv.PowerOn(); tv.PowerOff();}
	}

}
