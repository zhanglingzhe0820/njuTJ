package com.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//MD5加密算法
public class DigestMD5 {
	private final static String SALT="lalala";//salt
	public static String getMD5Result(String resource){
		try {
			resource=SALT+resource;
			
			MessageDigest digestKind=MessageDigest.getInstance("MD5");//得到实例对象
			byte[] byteResult=digestKind.digest(resource.getBytes());//得到byte数组形式的结果
			return encodeHexString(byteResult);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "WRONG";
		}
	}
	
	//byte转化为16进制
	private static String encodeHexString(byte[] byteResource){
		StringBuilder strBuild=new StringBuilder();
		
		for(byte b:byteResource){
			strBuild.append(Integer.toHexString(b&0XFF));
		}
		
		return new String(strBuild);
	}
}
