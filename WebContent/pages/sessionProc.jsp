<%@ page contentType = "text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("user_id") != null){
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String group_name = request.getParameter("group_name");
		
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_name", user_name);
		session.setAttribute("group_name", group_name);
		
		System.out.println("=========== 세션 초기화 시작============");
		System.out.println("user_id : " + session.getAttribute("user_id"));
		System.out.println("user_name : " + session.getAttribute("user_name"));
		System.out.println("group_name : " + session.getAttribute("group_name"));
		System.out.println("=========== 세션 초기화 끝 ============ \n");		
		
		response.sendRedirect("./index.jsp");
	}else{
		out.println("<script language='javascript'>");
		out.println("alert('정상적인 접근이 아니거나 세션이 만료되었습니다. 재로그인 해주세요.')");
		out.println("</script>");
		session.invalidate();
		System.out.println("=== 세션에 user_id가 없습니다.");
		response.sendRedirect("../login.jsp");	
	}
%>
</head>
<body>
</body>
</html>