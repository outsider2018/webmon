<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page language = "java" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	request.setCharacterEncoding("UTF-8");
	
	if((String)session.getAttribute("user_id") == null){
		out.println("<script language='javascript'>");
		out.println("alert('정상적인 접근이 아니거나 세션이 만료되었습니다. 재로그인 해주세요.')");
		out.println("</script>");
		session.invalidate();
		System.out.println("=== 세션 ID가 없습니다.");
		response.sendRedirect("../login.jsp");	
	}else{
		System.out.println("session enable : " + session.getAttribute("user_id"));
	}
%>
</head>
<body>
</body>
</html>