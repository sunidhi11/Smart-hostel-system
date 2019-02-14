/**

user sunidhi
 * 
 */
package sis.com.util;

import java.util.Random;

/**
 * @author hp
 *
 */
public class PasswordGenerator {
	static Random rand = new Random();

	final static  String alphabet= "abcdefghijklmnopqrstuvwxyznusdfkjvizkgjz";
	final static String no= "123456789026541865418645186547";
	
	final static String chara= "@#$%&*";
	
	
	 
	public static String generate(String father_name,String mother_name){
		int length= rand.nextInt(30)+2;
		 String alpha= alphabet.substring(length,length+2);
		String upper = alpha.toUpperCase();
	//	String fname= "ram";
		int flength = father_name.length();
	//	String mname= "sita";
		int mlength= mother_name.length();
		int lengthno= rand.nextInt(20)+1;
		int charalength= rand.nextInt(chara.length())+1;
	 String password_mail= ""+alphabet.charAt(length)+father_name.charAt(flength-1)+mother_name.charAt(mlength-1)
			+no.substring(lengthno,lengthno+2)+chara.charAt(charalength-1)+upper+"";

	System.out.println("password is##########"+password_mail);
	return password_mail;
	}
}
