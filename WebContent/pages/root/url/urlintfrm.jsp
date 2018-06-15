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
						<h1 class="page-header">URL management</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">신규 URL 등록</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                               	<form name="insertform" role="form" id="insertform" method="post" action="./urllist.jsp">
                                <table class="table table-striped table-bordered table-hover" id="url_info">
                                    <thead>
                                        <tr>
                                            <th>항목</th>
                                            <th>입력</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>ENV</td>
                                            <td><select class="form-control" name="env_name" id="env_name">
	                                                <option value="PRD">PRD</option>
	                                                <option value="SIT">SIT</option>
	                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td>DOMAIN</td>
                                            <td><select class="form-control" name="domain_name" id="domain_name">
	                                                <option value="NO">없음</option>
	                                                <option value="DOM01">DOM01</option>
	                                                <option value="DOM02">DOM02</option>
	                                                <option value="DOM03">DOM03</option>
	                                                <option value="DOM04">DOM04</option>
	                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td>Business</td>
                                            <td><input class="form-control"  name="business_name" id="business_name" placeholder="Enter Business Name"></td>
                                        </tr>
                                        <tr>
                                            <td>Soluction</td>
                                            <td><select class="form-control" name="soluction_name" id="soluction_name">
	                                                <option value="APACHE">Apache</option>
	                                                <option value="WEBTOB">WebtoB</option>
	                                                <option value="WEBLOGIC">Weblogic</option>
	                                                <option value="ESB">ESB</option>
	                                                <option value="JEUS">Jeus</option>
	                                                <option value="JBOSS">JBoss</option>
	                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td>Use Flag</td>
                                            <td><select class="form-control" name="use_flag" id="use_flag">
	                                                <option value="Y">Yes</option>
	                                                <option value="N">No</option>
	                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td>Description</td>
                                            <td><input class="form-control" name="description" id="description" placeholder="ex) ordap AP11"></td>
                                        </tr>
                                        <tr>
                                            <td>URL</td>
                                            <td><input class="form-control" name="url" id="url" placeholder="ex) http://IP:Port/URI"></td>
                                        </tr>                                                                   
                                    </tbody>
                                    <tfoot>
                                    	<tr>
                                    		<td colspan="2" align="right">
                                    			<input type='button' class="btn btn-primary" onkeydown="javascript:if(event.keyCode==13){inserturl();}" onclick="javascript:inserturl();" value="입력"></input>
                                    			<input type='button' class="btn btn-primary" onclick="javascript:cancle();" value="취소"></input>
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
	    
		function inserturl() {
			if(document.getElementById("business_name").value==""){
				alert("비즈니스명을 입력하세요");
				document.getElementById("business_name").focus();
				return false;
			}else if(document.getElementById("description").value==""){
				alert("설명을 입력하세요");
				document.getElementById("description").focus();
				return false;
			}else if(document.getElementById("url").value==""){
				alert("URL을 입력하세요");
				document.getElementById("url").focus();
				return false;
			}else{
				inserturl_proc();
			}
			

		}
		
		function inserturl_proc() {
			var data = $("form[name=insertform]").serialize();
			$.ajax({
				url: "/webmon/AjaxMessageRequest.do?action=inserturl",
			    type: 'POST', dataType: 'json',  data: data,
			    success: function(obj){			    	
			    	// 신규 URL 생성 성공 여부
	 		    	if(obj.STATUS == "S"){		    	
			    		document.insertform.submit();
			    	}else{
			    		alert("신규 URL 생성을 실패하였습니다.");
			    	}
			    },
			    error:function(){
			    	alert("요청 실패로 인하여 신규 URL 생성에 실패하였습니다.");
			    }
			});	// ajax end
		}
	    
	    </script>

		<!-- Custom Theme JavaScript -->
		<script src="/webmon/dist/js/sb-admin-2.js"></script>
		
		
</body>

</html>
