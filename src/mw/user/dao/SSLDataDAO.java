package mw.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import javax.naming.NamingException;

import org.json.JSONException;
import org.json.JSONObject;
import mw.user.db.*;

public class SSLDataDAO {

	
	/*
	 * SSL 정보 가져오기
	 * 
	 */
	public static JSONObject getCertList(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {
		
		JSONObject response_value = new JSONObject();

		try{
			String user_id = request_value.getString("user_id");			

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT DOMAIN_ID								\n");
			sql_str.append("	   ,SYSTEM_NAME								\n");
			sql_str.append("	   ,URL										\n");
			sql_str.append("	   ,STATE									\n");
			sql_str.append("	   ,KEYFILE_NAME							\n");
			sql_str.append("	   ,KEYFILE_PATH							\n");
			sql_str.append("	   ,START_DAY								\n");
			sql_str.append("	   ,END_DAY									\n");
			sql_str.append("	   ,DATEDIFF(now(),END_DAY) as DDAY			\n");
			sql_str.append("	   ,DESCRIPTION								\n");
			sql_str.append("	   ,REG_ID									\n");
			sql_str.append("	   ,REG_DATE								\n");
			sql_str.append("	   ,MASTER1									\n");
			sql_str.append("	   ,MASTER2									\n");
			sql_str.append("	FROM SSL_INFO								\n");
			sql_str.append("		WHERE GROUP_ID=							\n");
			sql_str.append("		(SELECT GROUP_ID FROM USER_INFO WHERE USER_ID=:USER_ID)		\n");					   			
            
			Hashtable param = new Hashtable();
			param.put("USER_ID", user_id);
			
			response_value = DBQueryExcutor.selectMultiRow(conn, sql_str.toString(),param, false);
			
			System.out.println("SSL List result : " + response_value.toString());
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}	

	public int getCertCount(Connection conn,String user_id)throws SQLException{
		int totalCount = 0;
		String temp = "";	// SQL로 얻어오는 갯수가 String 이여서 변환을 위함
		try{
			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT COUNT(DOMAIN_ID)							\n");
			sql_str.append("	FROM SSL_INFO								\n");
			sql_str.append("		WHERE GROUP_ID=							\n");
			sql_str.append("		(SELECT GROUP_ID FROM USER_INFO WHERE USER_ID=:USER_ID)		\n");					   			
            
			Hashtable param = new Hashtable();
			param.put("USER_ID", user_id);
			
			temp = DBQueryExcutor.selectSingleString(conn, sql_str.toString(),param, false);
			totalCount = Integer.parseInt(temp);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return totalCount;
	}	
	
}
