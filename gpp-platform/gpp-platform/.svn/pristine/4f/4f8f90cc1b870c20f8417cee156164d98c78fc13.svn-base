package com.tbyf.util;

import java.sql.Blob;
import java.sql.SQLException;

/**
 * Blob工具类
 * @author liwb
 * 2017-08-28
 */
public class BlobUtil {
	
	public static String  blobObjectToString(Object object) throws Exception{
		byte[] bytes = null;
		if(object instanceof Blob){
			Blob blob = (Blob)object;
			if(blob!=null){
				bytes = blob.getBytes(1, (int) blob.length());
			}
			return new String(bytes);
		}else{
			return "";
		}
	}
}
