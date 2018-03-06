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


public class UserDataDAO {
	
	
	public static JSONObject login(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject(); 
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			String user_id = request_value.getString("user_id");
			String password = request_value.getString("password");
			String user_name = "";
			String group_name = "";			
			String admin_YN = "";
			String accept_YN = "";

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT USER_ID, USER_NAME, GROUP_NAME, LOGIN_PASSWORD, ADMIN_YN, ACCEPT_YN 	\n");
			sql_str.append("	FROM USER_INFO													\n");								
			sql_str.append(" WHERE USER_ID=?													\n");
			sql_str.append(" AND LOGIN_PASSWORD=?												\n");				
			
			pstmt = conn.prepareStatement(sql_str.toString());
			pstmt.setString(1,user_id);
			pstmt.setString(2,password);
			System.out.println("SQL : " + pstmt.toString());
			rs = pstmt.executeQuery();
            
			int count = 0;
            while (rs.next()) {
            	count++;
            	user_id = rs.getString("USER_ID");
            	user_name = rs.getString("USER_NAME");
            	group_name = rs.getString("GROUP_NAME");
            	admin_YN = rs.getString("ADMIN_YN");
            	accept_YN = rs.getString("ACCEPT_YN");
     	    }
            if(count != 0){            	
            	response_value.put("LOGIN_SUCCESS", "Y");            	
            	response_value.put("USER_ID", user_id);
            	response_value.put("USER_NAME", user_name);
            	response_value.put("GROUP_NAME", group_name);
            	response_value.put("ADMIN_YN", admin_YN);
            	response_value.put("ACCEPT_YN", accept_YN);
            }else{
            	response_value.put("LOGIN_SUCCESS", "N");
            }           
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

	public static JSONObject newJoinForm(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {
		
		JSONObject response_value = new JSONObject(); 

		try{			

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT GROUP_ID, GROUP_NAME, DESCRIPTION		\n");
			sql_str.append("	FROM GROP_INFO								\n");								
			
			Hashtable param = new Hashtable();
			response_value = DBQueryExcutor.selectSingleRow(conn, sql_str.toString(), param);            
		}catch(Exception e){			
			e.printStackTrace();		
		}
		return response_value;
	}
	
	public static JSONObject newJoin(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("INSERT INTO user_info			\n");
			sql_str.append("	VALUES(:USER_ID,			\n"); // 유저 ID
			sql_str.append("		   :USER_NAME,			\n"); // 유저 이름
			sql_str.append("		   :USER_PASSWORD,		\n"); // 유저 패스워드
			sql_str.append("		   :GROUP_ID,			\n"); // 그룹 이름
			sql_str.append("		   :MOBILE_NUMBER,		\n"); // 전화번호
			sql_str.append("		   :EMAIL_ADDRESS,		\n"); // 이메일
			sql_str.append("		   CURRENT_DATE(),		\n"); // 생성 일자
			//sql_str.append("		   ':ADMIN_YN',			\n");			
			sql_str.append("		   'N',					\n"); // 관리자 여부
			//sql_str.append("		   ':ACCEPT_YN',			\n");
			sql_str.append("		   'N',					\n"); // 접속 승인			
			sql_str.append("		   :DESCRIPTION)		\n"); // 설명
			
			Hashtable param = new Hashtable();
			param.put("USER_ID", request_value.getString("USER_ID"));
			param.put("USER_NAME", request_value.getString("USER_NAME"));
			param.put("USER_PASSWORD", request_value.getString("USER_PASSWORD1"));
			param.put("GROUP_ID", request_value.getString("GROUP_ID"));
			param.put("MOBILE_NUMBER", request_value.getString("MOBILE_NUMBER"));
			param.put("EMAIL_ADDRESS", request_value.getString("EMAIL_ADDRESS"));			
			//param.put("ACCEPT_YN", "N");
			param.put("DESCRIPTION", request_value.getString("DESCRIPTION"));
			
			response_value = DBQueryExcutor.updateQueryExcutor(conn, sql_str.toString(), param, false);
			
			System.out.println("USER Insert SQL : " + response_value.toString());
           
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}

}
