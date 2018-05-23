<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="mw.resource.ResourceInit"%>
<%@ page import="mw.user.dao.UserDataDAO"%>
<%@ page import="mw.user.db.DBConnector"%>
<%@ page import="mw.util.ConvertJson"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONTokener"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">

<head>

<%@ include file="/pages/sessionCheck.jsp" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>KOS System - MW</title>

<!-- Bootstrap Core CSS -->
<link href="/webmon/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/webmon/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/webmon/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/webmon/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id="wrapper">

		<jsp:include page='../rootNavigation.jsp' flush='false' />
		<!-- Page Content -->
		<div id="page-wrapper">		
		<!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">User management</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            사용자 입력
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                               	<form name="insertform" role="form" id="insertform" method="post" action="#">
                                <table class="table table-striped table-bordered table-hover" id="user_info">
                                    <thead>
                                        <tr>
                                            <th>항목</th>
                                            <th>입력</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>ID</td>
                                            <td><input class="form-control" name="user_id" id="user_id" placeholder="Enter ID"></td>
                                        </tr>
                                        <tr>
                                            <td>PASSWORD</td>
                                            <td><input class="form-control"  name="password" id="password" type="password" placeholder="Enter PASSWORD"></td>
                                        </tr>
                                        <tr>
                                            <td>NAME</td>
                                            <td><input class="form-control" name="user_name" id="user_name" placeholder="Enter PASSWORD"></td>
                                        </tr>
                                        <tr>
                                            <td>GROUP</td>
                                            <td>
                                            	<select class="form-control">
	                                                <option>root</option>
	                                                <option>admin</option>
	                                                <option>monitor</option>
	                                            </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>설명</td>
                                            <td><textarea name="description" id="description" class="form-control" rows="3"></textarea></td>
                                        </tr>                                                                   
                                    </tbody>
                                    <tfoot>
                                    	<tr>
                                    		<td colspan="2">
                                    			<input type='button' class="btn btn-primary btn-block" onkeydown="javascript:if(event.keyCode==13){insertuser();}" onclick="javascript:insertuser();" value="입력"></input>
                                    			<input type='button' class="btn btn-primary btn-block" onclick="javascript:cancle();" value="취소"></input>
                                    		</td>                                    		
                                    	</tr>
                                    </tfoot>                                    
                                </table>
                                </form> <!-- Form end -->
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

			<!-- -------------------------------------- Main Page End--------------------------------------------------------- -->
			</div>
			<!-- /#page-wrapper -->			
		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="/webmon/vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="/webmon/vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="/webmon/vendor/metisMenu/metisMenu.min.js"></script>
	     
	    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	    <script>
	    
		function insertuser() {
			if(document.getElementById("user_id").value==""){
				alert("ID를 입력하세요");
				document.getElementById("user_id").focus();
				return false;
			}else if(document.getElementById("password").value==""){
				alert("Password를 입력하세요");
				document.getElementById("password").focus();
				return false;
			}else if(document.getElementById("user_name").value==""){
				alert("Name를 입력하세요");
				document.getElementById("user_name").focus();
				return false;
			}else{
				insertuser_proc();
			}
			

		}
		
		function insertuser_proc() {
			var data = $("form[name=insertform]").serialize();
			$.ajax({
				url: "/webmon/AjaxMessageRequest.do?action=insertuser",
			    type: 'POST', dataType: 'json',  data: data,
			    success: function(obj){
			    	
			    	// 로그인 성공 여부
			    	var loginSuccess = obj.LOGIN_SUCCESS;
			    						    		    	
			    	document.LoginForm.user_name.value = obj.USER_NAME;
			    	document.LoginForm.group_name.value = obj.GROUP_NAME;
			    	
			    	//alert("로그인 정상 여부 : "+ loginSuccess +" , " + document.getElementById("user_name").value + " , " + obj.GROUP_NAME);
	 		    	if(loginSuccess == "Y"){		    	
			    		console.log("login Success : " + loginSuccess);
			    		document.LoginForm.submit();
			    	}else{
			    		alert("ID, Password가 틀렸습니다.");
			    		document.getElementById("password").value='';
			    		document.LoginForm.password.focus();
			    	}
			    }	    
			});	// ajax end
		}
	    
	    </script>

		<!-- Custom Theme JavaScript -->
		<script src="/webmon/dist/js/sb-admin-2.js"></script>
		
		
</body>

</html>
