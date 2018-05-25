package mw.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import javax.naming.NamingException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import mw.user.db.*;

public class URLDataDAO {
	
	public static JSONObject getURLList(Connection conn, String env_name)throws SQLException, NamingException, JSONException {		
		JSONObject response_value = new JSONObject();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT 	ENV_NAME, DOMAIN_NAME, BUSINESS_NAME, SOLUCTION_NAME, USE_YN, DESCRIPTION, URL 	\n");
			sql_str.append("	FROM URL_LIST											\n");								
			sql_str.append(" WHERE ENV_NAME=:env_name									\n");				
			
			Hashtable param = new Hashtable();
			param.put("env_name", env_name);
			
			//response_value = DBQueryExcutor.selectMultiRow(conn, sql_str.toString(),param, false);			
			response_value = DBQueryExcutor.selectMultiRow_web(conn, sql_str.toString(),param, false);			
			System.out.println("getURLList : " + response_value);
			
		}catch (SQLException e1) {
			e1.printStackTrace();
		}catch(Exception e2){			
			e2.printStackTrace();		
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}

		}
		return response_value;
	}
	
	public static JSONArray getURLListArray(Connection conn, String env_name)throws SQLException, NamingException, JSONException {		
		JSONArray response_value = new JSONArray();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT 	URL_NUMBER, ENV_NAME, DOMAIN_NAME, BUSINESS_NAME, MW_TYPE, SOLUCTION_NAME, USE_YN, DESCRIPTION, URL 	\n");
			sql_str.append("	FROM URL_LIST											\n");								
			sql_str.append(" WHERE ENV_NAME=:env_name									\n");				
			
			Hashtable param = new Hashtable();
			param.put("env_name", env_name);
			
			//response_value = DBQueryExcutor.selectMultiRow(conn, sql_str.toString(),param, false);
			response_value = DBQueryExcutor.selectMultiRowArray(conn, sql_str.toString(),param);			
			System.out.println("getURLList : " + response_value);
			
		}catch (SQLException e1) {
			e1.printStackTrace();
		}catch(Exception e2){			
			e2.printStackTrace();		
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}

		}
		return response_value;
	}
	
	public static JSONObject getURLList(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			String envName = request_value.getString("env_name");
			

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT 	ENV_NAME, DOMAIN_NAME, BUSINESS_NAME, SOLUCTION_NAME, USE_YN, DESCRIPTION, URL 	\n");
			sql_str.append("	FROM URL_LIST											\n");								
			sql_str.append(" WHERE ENV_NAME=:envName									\n");				
			
			Hashtable param = new Hashtable();
			param.put("envName", envName);
			
			response_value = DBQueryExcutor.selectMultiRow(conn, sql_str.toString(),param, false);			
			System.out.println("getURLList : " + response_value);
			
		}catch (SQLException e1) {
			e1.printStackTrace();
		}catch(Exception e2){			
			e2.printStackTrace();		
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}

		}
		return response_value;
	}

	public static Object deleteURLListArray(Connection conn, String[] request_value) {
		System.out.println("DAO=================================");
		for(String str:request_value) {
			System.out.println("DAO값:"+str);
		}
		
		StringBuffer sql_str = new StringBuffer();
		sql_str.append("DELETE 														\n");
		sql_str.append("	FROM URL_LIST											\n");								
		sql_str.append(" WHERE ENV_NAME in (:url_numbers)							\n");				
		
		Hashtable param = new Hashtable();
		param.put("url_numbers", request_value);
		
		return null;
	}
}
