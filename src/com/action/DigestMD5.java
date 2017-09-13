package com.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//MD5�����㷨
public class DigestMD5 {
	private final static String SALT="lalala";//salt
	public static String getMD5Result(String resource){
		try {
			resource=SALT+resource;
			
			MessageDigest digestKind=MessageDigest.getInstance("MD5");//�õ�ʵ������
			byte[] byteResult=digestKind.digest(resource.getBytes());//�õ�byte������ʽ�Ľ��
			return encodeHexString(byteResult);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "WRONG";
		}
	}
	
	//byteת��Ϊ16����
	private static String encodeHexString(byte[] byteResource){
		StringBuilder strBuild=new StringBuilder();
		
		for(byte b:byteResource){
			strBuild.append(Integer.toHexString(b&0XFF));
		}
		
		return new String(strBuild);
	}
}
