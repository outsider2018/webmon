<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="mw.resource.ResourceInit"%>
<%@ page import="mw.user.dao.URLDataDAO"%>
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

<!-- Datatables CSS -->
<link href="/webmon/vendor/datatables/datatables.min.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<jsp:include page='../../navigation.jsp' flush='false' />
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
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!--  <div class="panel-heading">사용자 관리</div>  -->	
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover display" id="url-list">
                                <thead>
                                    <tr>
                                        <th>URL_NUMBER</th>
                                        <th>ENV_NAME</th>
                                        <th>DOMAIN_NAME</th>
                                        <th>BUSINESS_NAME</th>
                                        <th>SOLUCTION_NAME</th>
                                        <th>USE_FLAG</th>
                                        <th>DESCRIPTION</th>
                                        <th>URL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
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

	    <!-- DataTables JavaScript (SB Admin 2 Default)-->
	    <!-- 
	    <script src="/webmon/vendor/datatables/js/jquery.dataTables.min.js"></script>
	    <script src="/webmon/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	    <script src="/webmon/vendor/datatables-responsive/dataTables.responsive.js"></script>
	     -->
	     <!-- DataTables JavaScript (Add Buttons-1.5.1, Scroller-1.4.4, Select-1.2.5)-->
	    <script type="text/javascript" src="/webmon/vendor/datatables/datatables.min.js"></script>
	     
	    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	    <script>
	    
		$.ajax({
			url: "/webmon/AjaxMessageRequest.do?action=UrlList&env=PRD",
		    type: 'POST', dataType: 'json',
		    success: function(obj){		    	
		    	// UserList 요청 성공		    			    	
		    	var urlData = obj; 
		    	// JSON 객체 -> String 변환 처리
		    	//var userData = JSON.stringify(obj);
				
			    $(document).ready(function() {
			        var table = $('#url-list').DataTable({
			            responsive: true,
			            serverSide: false,
			            pageLength: 10,
			            ordering: false,
			            select: true,
			            dom: 'B<"wrapper"fr>t<"wrapper"ip>',
			            buttons: [
			            	{
			                	text: '신규',
			                	action: function(e, dt, node, config){
			                		location.href='./urlintfrm.jsp';
			                	},
			            	},
			            	{
			                	text: '수정',
			                	action: function(e, dt, node, config){
			                		alert("수정 : "+JSON.stringify(dt.row({selected:true}).data()));
			                	},
			                	enabled: false
			            	},
			            	{
			                	text: '삭제',
			                	action: function(e, dt, node, config){
			                		
		                		
			                		var table = $('#url-list').DataTable();
			                		
			                		var rows = table.rows('.selected').data();
			                		alert("삭제 : "+JSON.stringify(dt.row({selected:true}).data()));
			                		if (confirm("총"+rows.length+"건 삭제하시겠습니까??") == true){    //확인
			                			urldelete();
				                		var rows = table
			                		    .rows( '.selected' )
			                		    .remove()
			                		    .draw();				            			
			                		}else{   //취소
			                		    return;
			                		}
			                	},
			                	enabled: true
			            	}
			            ],
			            data: urlData,
			            columns: [
                            { data: 'URL_NUMBER' },	
                            { data: 'ENV_NAME' },	
                            { data: 'DOMAIN_NAME' },	
                            { data: 'BUSINESS_NAME' },
                            { data: 'SOLUCTION_NAME' },
                            { data: 'USE_YN' },	
                            { data: 'DESCRIPTION' },
                            { data: 'URL' }	
			            ]

			        });
			        
				    table.on( 'select deselect', function () {
				    	var selectedRows = table.rows( { selected: true } ).count();			
				        table.button( 1 ).enable( selectedRows === 1 );
				        table.button( 2 ).enable( selectedRows > 0 );
				    } );
			    }); //Datatable end
			    
			    
		    }, // ajax success end
		    
		    error:function(){
		    	document.write("<H3>URL 정보 로딩에 실패하였습니다.</H3>");
		    }
		});	// ajax end	    
	    
		
		function urldelete() {
			//var table = $('#url-list').DataTable();
			//var rows = table.rows('.selected').data();
			//alert("삭제 : "+JSON.stringify(rows).data());
			//var rows = JSON.stringify(temp);
			//alert("수행여부" + rows.stringify());
			//var remove = table.rows( '.selected' ).remove().draw();
			var array_temp=[2,4];
			var rows={"url_num":array_temp};
			
 			 $.ajax({
				url: "/webmon/AjaxMessageRequest.do?action=deleteurl",
			    type: 'POST', dataType: 'json',  data: rows,
			    success: function(obj){			    	
			  	// 신규 유저 생성 성공 여부
			  	var InsertSTATUS = obj.resultSet;
			  	console.log("InsertSTATUS : " + obj.STATUS);
	 		  	if(InsertSTATUS == "S"){		    	
			  		
			  	}else{
			  		alert("신규 유저 생성을 실패하였습니다.");
			  	}
			  },
			  error:function(){
			  	alert("요청 실패로 인하여 신규 유저 생성에 실패하였습니다.");
			  }
			});	// ajax end 
		}
		
	    </script>

		<!-- Custom Theme JavaScript -->
		<script src="/webmon/dist/js/sb-admin-2.js"></script>
		
		
</body>

</html>
