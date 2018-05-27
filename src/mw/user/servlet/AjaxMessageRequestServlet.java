package mw.user.servlet;

import java.sql.Connection;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import mw.user.db.*;
import mw.user.dao.*;

public class AjaxMessageRequestServlet extends HttpServlet {
	
	public void init(ServletConfig cfg) throws ServletException{
	}
	
	protected void doGet(HttpServletRequest request_value, HttpServletResponse resp)
	{
		doPost(request_value, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		
		try{
		    java.util.Enumeration names = request.getParameterNames();
/*		    while (names.hasMoreElements()) {
		    	String rName = (String) names.nextElement();
		    	System.out.println("1/ names:"+rName);
		    	String[] rValue = request.getParameterValues(rName);
		    }*/
		    
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8"); 

			String response_value = doService(request, response);
			response_value = new String(response_value.getBytes("UTF-8"), "ISO-8859-1");
			 
			response.getOutputStream().print(response_value);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String doService(HttpServletRequest request, HttpServletResponse response)
	{

		JSONObject request_value = new JSONObject();
		JSONObject response_value = new JSONObject();
		Connection conn = null;
		Object ret = null;

		try{
		    java.util.Enumeration names = request.getParameterNames();
		    while (names.hasMoreElements()) {
		    	String rName = (String) names.nextElement();
		    	System.out.println("2/ names:"+rName);
		    	String[] rValue = request.getParameterValues(rName);
		    	
		    	if (rValue.length == 1)
		    		request_value.put(rName, rValue[0]);
		    	else
		    		request_value.put(rName, rValue);
		    }
			
		    
			conn = DBConnector.getConnection();

			String action = request.getParameter("action");
			String env = request.getParameter("env");
			
			System.out.println("[action] : "+action+"#"+request_value.toString());
			
			/*
			 * Action 
			 * login : 로그인
			 * insertuser : 신규 유저 등록
			 * updateuser : 유저 정보 수정
			 * deleteduser : 유저 삭제
			 * UserList : 유저 리스트
			 * 
			 */
			if("login".equals(action)){				
				ret = UserDataDAO.login(conn, request_value);
			}else if("UserList".equals(action)){
				ret = UserDataDAO.UserList(conn);				
			}else if("insertuser".equals(action)){
				ret = UserDataDAO.insertuser(conn, request_value);
			}else if("updateuser".equals(action)){
				ret = UserDataDAO.updateuser(conn, request_value);
			}else if("deleteuser".equals(action)){
				ret = UserDataDAO.deleteuser(conn, request_value);				
			}else if("UrlList".equals(action)) {
				ret = URLDataDAO.getURLListArray(conn, env);
			}else if("deleteurl".equals(action)) {
				String[] url_number=(String[]) request_value.get("url_num[]");	
				ret = URLDataDAO.deleteURLListArray(conn, url_number);
			}else{
				throw new Exception("Invalid action request ["+action+"]");
			}
			
			String response_value_str = ret.toString();
			System.out.println(" Response:"+response_value_str);

			return response_value_str;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				DBConnector.releaseConnection(conn, null, null);
				//conn.close();
			}catch (Exception e) {}
		}
		return "";
	}

	public void destroy() {

	}

}
