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

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT USER_ID, USER_NAME, GROUP_NAME, PASSWORD \n");
			sql_str.append("	FROM USER_INFO													\n");								
			sql_str.append(" WHERE USER_ID=?													\n");
			sql_str.append(" AND PASSWORD=?												\n");				
			
			pstmt = conn.prepareStatement(sql_str.toString());
			pstmt.setString(1,user_id);
			pstmt.setString(2,password);
			rs = pstmt.executeQuery();
            
			int count = 0;
            while (rs.next()) {
            	count++;
            	user_id = rs.getString("USER_ID");
            	user_name = rs.getString("USER_NAME");
            	group_name = rs.getString("GROUP_NAME");
     	    }
            if(count != 0){            	
            	response_value.put("LOGIN_SUCCESS", "Y");	
            	response_value.put("USER_ID", user_id);
            	response_value.put("USER_NAME", user_name);
            	response_value.put("GROUP_NAME", group_name);
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

	public static JSONArray UserList(Connection conn)throws SQLException, NamingException, JSONException {
		
		JSONArray response_value = new JSONArray(); 

		try{			

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("SELECT USER_NUMBER,		\n");
			sql_str.append("		USER_ID,		\n");
			sql_str.append("		USER_NAME,		\n");
			sql_str.append("		PASSWORD,		\n");
			sql_str.append("		GROUP_NAME,		\n");
			sql_str.append("		DESCRIPTION		\n");
			sql_str.append("	FROM USER_INFO		\n");								
			
			Hashtable param = new Hashtable();
			response_value = DBQueryExcutor.selectMultiRowArray(conn, sql_str.toString(), param, false);
		}catch(Exception e){			
			e.printStackTrace();		
		}
		return response_value;
	}
	
	public static JSONObject insertuser(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("INSERT INTO USER_INFO			\n");
			sql_str.append("(USER_ID, USER_NAME, GROUP_NAME, PASSWORD, DESCRIPTION, CREATE_DATE) \n");
			sql_str.append("	VALUES(:USER_ID,			\n"); // 유저 ID
			sql_str.append("		   :USER_NAME,			\n"); // 유저 이름
			sql_str.append("		   :GROUP_NAME,			\n"); // 그룹 이름
			sql_str.append("		   :PASSWORD,			\n"); // 유저 패스워드
			sql_str.append("		   :DESCRIPTION,		\n"); // 설명
			sql_str.append("		   CURRENT_DATE)		\n"); // 생성 일자
			
			Hashtable<String, String> param = new Hashtable<String, String>();
			param.put("USER_ID", request_value.getString("user_id"));
			param.put("USER_NAME", request_value.getString("user_name"));
			param.put("PASSWORD", request_value.getString("password"));
			param.put("GROUP_NAME", request_value.getString("group_name"));
			param.put("DESCRIPTION", request_value.getString("description"));
			
			response_value = DBQueryExcutor.updateQueryExcutor(conn, sql_str.toString(), param, false);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}

	public static JSONObject updateuser(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("UPDATE USER_INFO SET			\n");
			sql_str.append("	USER_ID=:USER_ID,			\n"); // 유저 ID
			sql_str.append("	USER_NAME=:USER_NAME,		\n"); // 유저 이름
			sql_str.append("	PASSWORD=:PASSWORD,			\n"); // 유저 패스워드			
			sql_str.append("	GROUP_NAME=:GROUP_NAME,		\n"); // 그룹 이름
			sql_str.append("	DESCRIPTION=:DESCRIPTION,	\n"); // 설명
			sql_str.append("	CREATE_DATE=CURRENT_DATE	\n"); // 생성일자
			sql_str.append("	WHERE USER_ID=:USER_ID		\n"); // 검색 조건
			
			Hashtable<String, String> param = new Hashtable<String, String>();
			param.put("USER_ID", request_value.getString("user_id"));
			param.put("USER_NAME", request_value.getString("user_name"));
			param.put("PASSWORD", request_value.getString("password"));
			param.put("GROUP_NAME", request_value.getString("group_name"));
			param.put("DESCRIPTION", request_value.getString("description"));
			param.put("USER_ID", request_value.getString("user_id"));			
			
			response_value = DBQueryExcutor.updateQueryExcutor(conn, sql_str.toString(), param, false);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}

	public static JSONObject deleteuser(Connection conn, JSONObject request_value)throws SQLException, NamingException, JSONException {

		
		JSONObject response_value = new JSONObject();

		try{					

			StringBuffer sql_str = new StringBuffer();
			sql_str.append("DELETE FROM USER_INFO			\n");
			sql_str.append("	WHERE USER_ID IN (:USER_ID)		\n"); // 검색 조건
			
			Hashtable<String, String> param = new Hashtable<String, String>();
//			String paramValue = request_value.getString("user_id").replaceAll(",", "','");
//			System.out.println("============> 삭제 변수 가공 후 : " + paramValue);
			param.put("USER_ID", request_value.getString("user_id"));
			
			response_value = DBQueryExcutor.deleteQueryExcutor(conn, sql_str.toString(), param, true);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return response_value;
	}	

}
