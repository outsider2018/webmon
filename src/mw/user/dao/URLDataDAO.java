package mw.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
			//System.out.println("getURLList : " + response_value);
			
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

	public static JSONObject deleteurl(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("DELETE FROM URL_LIST			\n");
			sql_str.append("	WHERE URL_NUMBER IN (?)		\n"); // 검색 조건
			
			ArrayList<Integer> param = new ArrayList<Integer>();
			String[] temp = request_value.getString("url_number").split(",");
			for(int i=0;i<temp.length;i++) {
				param.add(Integer.parseInt(temp[i]));
			}
			
			response_value = DBQueryExcutor.deleteQueryExcutor(conn, sql_str.toString(), param, true);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}

	public static JSONObject inserturl(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("INSERT INTO URL_LIST			\n");
			sql_str.append("(ENV_NAME, DOMAIN_NAME, BUSINESS_NAME, MW_TYPE, SOLUCTION_NAME, USE_YN, DESCRIPTION, URL) \n");
			sql_str.append("	VALUES(:ENV_NAME,			\n"); // 환경
			sql_str.append("		   :DOMAIN_NAME,		\n"); // 도메인
			sql_str.append("		   :BUSINESS_NAME,		\n"); // 업무명
			sql_str.append("		   :MW_TYPE,			\n"); // WEB/WAS
			sql_str.append("		   :SOLUCTION_NAME,		\n"); // 제품
			sql_str.append("		   :USE_YN,		\n"); // 사용여부
			sql_str.append("		   :DESCRIPTION,		\n"); // 설명
			sql_str.append("		   :URL)					\n"); // URL
			
			
			Hashtable<String, String> param = new Hashtable<String, String>();
			param.put("ENV_NAME", request_value.getString("env_name"));
			param.put("DOMAIN_NAME", request_value.getString("domain_name"));
			param.put("BUSINESS_NAME", request_value.getString("business_name"));
			param.put("MW_TYPE", request_value.getString("mw_type"));
			param.put("SOLUCTION_NAME", request_value.getString("soluction_name"));
			param.put("USE_YN", request_value.getString("use_yn"));
			param.put("DESCRIPTION", request_value.getString("description"));
			param.put("URL", request_value.getString("url"));
			
			response_value = DBQueryExcutor.updateQueryExcutor(conn, sql_str.toString(), param, false);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}
	
	public static JSONArray totalUrl(Connection conn, String env_name)throws SQLException, NamingException, JSONException {		
		JSONArray response_value = new JSONArray();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT count(URL) AS totalUrl FROM URL_LIST  \n");								
			sql_str.append(" WHERE ENV_NAME=:env_name					 \n");				
			
			Hashtable param = new Hashtable();
			param.put("env_name", env_name);
			
			response_value = DBQueryExcutor.selectMultiRowArray(conn, sql_str.toString(),param);			
			System.out.println("totalUrlList : " + response_value);
			
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

	public static JSONArray getChkURL(Connection conn, String env_name)throws SQLException, NamingException, JSONException {		
		JSONArray response_value = new JSONArray();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT 	URL_NUMBER, ENV_NAME, DOMAIN_NAME, BUSINESS_NAME, MW_TYPE, SOLUCTION_NAME, USE_YN, DESCRIPTION, URL 	\n");
			sql_str.append("	FROM URL_LIST											\n");								
			sql_str.append(" WHERE ENV_NAME=:env_name									\n");				
			sql_str.append(" 	   AND USE_YN='Y'									\n");				
			
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
	
	public static void insertChkHist(Connection conn, HashMap hashMap)throws SQLException, NamingException, JSONException {
		JSONObject response_value = new JSONObject();
		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("INSERT INTO URLCHK_HIST			\n");
			sql_str.append("(URL, STATUS_CODE, CREATE_TIME) \n");
			sql_str.append("	VALUES(:URL,				\n"); // URL
			sql_str.append("		   :STATUS_CODE,		\n"); // 상태코드
			sql_str.append("		   CURRENT_TIMESTAMP)	\n"); // 시간
			
			
			Hashtable<String, String> param = new Hashtable<String, String>();
			param.put("URL", (String) hashMap.get("Url"));
			param.put("STATUS_CODE", (String) hashMap.get("StatusCode"));
			response_value = DBQueryExcutor.updateQueryExcutor(conn, sql_str.toString(), param, false);			
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
	}
	
}
