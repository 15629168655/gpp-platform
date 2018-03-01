package com.tbyf.util;



import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import org.apache.commons.codec.binary.Base64;

public class StringHelper
{
  public static boolean parseBoolean(int paramInt)
  {
    return paramInt == 1;
  }

/*  public static boolean parseBoolean(Object paramObject)
  {
    if ((paramObject == null) || ("".equals(paramObject)))
      return false;
    if ((paramObject instanceof Integer))
      return parseBoolean(((Integer)paramObject).intValue());
    if ((paramObject instanceof BigDecimal))
      return parseBoolean(((BigDecimal)paramObject).intValue());
    if ((paramObject instanceof String))
      return parseBoolean((String)paramObject, "false");
    return false;
  }*/

 /* public static boolean parseBoolean(String paramString1, String paramString2)
  {
    if ((paramString1 != null) && (!"".equals(paramString1)))
      paramString1 = paramString1.toLowerCase();
    else
      paramString1 = paramString2;
    try
    {
      paramString1 = Boolean.parseBoolean(paramString1);
    }
    catch (Exception localException)
    {
      throw (paramString1 = localException);
    }
    return paramString1;
  }
*/
  public static String replaceNull(Object paramObject)
  {
    return replaceNull(paramObject, "");
  }

  public static String replaceNull(Object paramObject, String paramString)
  {
    if (paramObject == null)
      return paramString;
    return paramObject.toString();
  }

/*  public static int parseInt(Object paramObject)
  {
    if ((paramObject == null) || ("".equals(paramObject)))
      return 0;
    if ((paramObject instanceof Integer))
      return ((Integer)paramObject).intValue();
    if ((paramObject instanceof BigDecimal))
      return ((BigDecimal)paramObject).intValue();
    if ((paramObject instanceof String))
      return parseInt((String)paramObject, "0");
    return 0;
  }

  public static int parseInt(int paramInt)
  {
    return parseInt(String.valueOf(paramInt), "0");
  }

  public static int parseInt(int paramInt, String paramString)
  {
    return parseInt(String.valueOf(paramInt), paramString);
  }
*/
  /*public static int parseInt(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || ("".equals(paramString1)) || ("null".equals(paramString1)))
      paramString1 = paramString2;
    try
    {
      paramString1 = Integer.parseInt(paramString1);
    }
    catch (Exception localException)
    {
      throw (paramString1 = localException);
    }
    return paramString1;
  }*/

  public static boolean isEmpty(String paramString)
  {
    return (paramString == null) || ("".equals(paramString)) || ("null".equals(paramString));
  }

  public static String join(Object[] paramArrayOfObject)
  {
    return join(paramArrayOfObject, ",");
  }

  public static String join(Object[] paramArrayOfObject, String paramString)
  {
    if (paramArrayOfObject == null)
      return null;
    StringBuffer localStringBuffer = new StringBuffer();
    for (int i = 0; i < paramArrayOfObject.length; i++)
    {
      if (i != 0)
        localStringBuffer.append(paramString);
      localStringBuffer.append(paramArrayOfObject[i]);
    }
    return localStringBuffer.toString();
  }

/*  public static String replaceStr(String paramString1, String paramString2, String paramString3)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    int i = paramString1.length();
    int j = paramString2.length();
    int m;
    for (int k = 0; (m = paramString1.indexOf(paramString2, k)) >= 0; k = m + j)
    {
      localStringBuffer.append(paramString1.substring(k, m));
      localStringBuffer.append(paramString3);
    }
    if (k < i)
      localStringBuffer.append(paramString1.substring(k));
    return localStringBuffer.toString();
  }*/

/*  public static String findOneString(String paramString1, String paramString2, String paramString3)
  {
    String str1 = "";
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null))
      return str1;
    String str2 = paramString1.indexOf(paramString2);
    paramString3 = paramString1.indexOf(paramString3, str2 + paramString2.length());
    if ((str2 != -1) && (paramString3 > str2))
      str1 = paramString1.substring(str2 + paramString2.length(), paramString3);
    return str1;
  }
*/
/*  public static String[] findString(String paramString1, String paramString2, String paramString3)
  {
    int i = 0;
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null))
      return null;
    ArrayList localArrayList = new ArrayList();
    while (i != -1)
    {
      int j = paramString1.indexOf(paramString2);
      int k = paramString1.indexOf(paramString3, j + paramString2.length());
      if ((j != -1) && (k > j))
      {
        String str = paramString1.substring(j + paramString2.length(), k);
        paramString1 = paramString1.substring(k + paramString3.length());
        localArrayList.add(str);
      }
      else
      {
        i = -1;
      }
    }
    return (String[])localArrayList.toArray(new String[localArrayList.size()]);
  }*/

  public static String getBASE64(byte[] paramArrayOfByte)
  {
    if ((paramArrayOfByte != null) && (paramArrayOfByte.length != 0))
      return new String(Base64.encodeBase64(paramArrayOfByte));
    return "";
  }

  public static byte[] getFromBASE64(String paramString)
  {
    if ((paramString != null) && (!"".equals(paramString)))
      return Base64.decodeBase64(paramString.getBytes());
    return "".getBytes();
  }

  public static byte[] getFromBASE64(String paramString1, String paramString2)
  {
    if ((paramString1 != null) && (!"".equals(paramString1)))
    {
      if ((paramString2 == null) || ("".equals(paramString2)))
        return Base64.decodeBase64(paramString1.getBytes());
      try {
		return Base64.decodeBase64(paramString1.getBytes(paramString2));
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
    }
    return "".getBytes();
  }

  public static String getStackTrace(Exception paramException)
  {
    StringWriter localStringWriter = new StringWriter();
    paramException.printStackTrace(new PrintWriter(localStringWriter));
    return localStringWriter.toString();
  }
}