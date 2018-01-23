package com.gh.crm.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.id.Hex;

import sun.misc.BASE64Encoder;

/**
 * 工具类
 * 
 * @author CaiJianWei
 * 
 *         2017-10-22
 */
public class IDUtils {
	// 生成32位ID
	public static String getCode() {
		
		return new String(Hex.encodeHex(org.apache.commons.id.uuid.UUID
				.randomUUID().getRawBytes()));
	}

	public static String getMD5(String str){
		// 生成一个MD5加密计算摘要
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(str.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new BigInteger(1, md.digest()).toString(16);
	}
}
