package mw.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;

public class CommonLib {
	static ResourceBundle properties = null;
	
	// KSC601 to 8859_1
	public String toKorean(String str){
		String convStr = null;
		try{
			if(str == null)
				return "";
			convStr = new String(str.getBytes("KSC601"),"8859_1");
		} catch (UnsupportedEncodingException e){}
		return convStr;
		}
	
	// 8859_1 to KSC5601
	public String fromKorean(String str){
		
		String convStr = null;
		try{
			if(str == null)
				return "";
			convStr = new String(str.getBytes("8859_1"),"KSC5601");
		}catch(UnsupportedEncodingException e){}
		return convStr;
		}
	
	//���� üũ
	public String checkNull(String str){
		
		String strTmp;
		if(str == null)
			strTmp = "";
		else
			strTmp = str;
		return strTmp;
	}
	
	public String dateFormat(Object date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sDate = sdf.format(date);

        return sDate;
	}
	
	public String getCurrentDate(){
		Date toDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("���� ��¥ : " + sdf.format(toDay));
		return sdf.format(toDay);
	}
	
	// Properties Load
	public static String getProperties(String key){
		String value = "";
		try{
			if(properties == null)
				getResource();
			value = properties.getString(key);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	private static void getResource(){
		try{
			properties = ResourceBundle.getBundle("project");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
