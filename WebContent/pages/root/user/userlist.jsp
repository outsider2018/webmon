<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="mw.resource.ResourceInit"%>
<%@ page import="mw.user.dao.URLDataDAO"%>
<%@ page import="mw.user.db.DBConnector"%>
<%@ page import="mw.url.CheckURL"%>
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

<%
		
		Connection conn = DBConnector.getConnection();
		Object ret = null;
		
		ret = URLDataDAO.getURLList(conn, "PRD");
		System.out.println(ret.toString());
		//JSONArray joa = new JSONArray(ret);
		
		
		ArrayList <String> test = null;
		
		
		//System.out.println("Size : " + joa.length());
		
		//for(i=1,ret.toString().length())
		//ConvertJson conJson = new ConvertJson();
		//jsonArr = conJson.daoObjectToJSONArray(ret);
		//System.out.println(jsonArr);
		
        String imageFileName="";
		int count = 1;
		ArrayList<HashMap> resultList = new ArrayList<HashMap>();
		CheckURL chk = new CheckURL();
		
		resultList = chk.checkUrl(ResourceInit.urlListPRD_PA3_ALL);
		//resultList = chk.checkUrl(jsonArr);
		
%>

	<div id="wrapper">

		<jsp:include page='/pages/navigation.jsp' flush='false' />
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
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="user-list">
                                <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 1.0</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 1.5</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 2.0</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 3.0</td>
                                        <td>Win 2k+ / OSX.3+</td>
                                        <td class="center">1.9</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Camino 1.0</td>
                                        <td>OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Camino 1.5</td>
                                        <td>OSX.3+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Netscape 7.2</td>
                                        <td>Win 95+ / Mac OS 8.6-9.2</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Netscape Browser 8</td>
                                        <td>Win 98SE+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>

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

	    <!-- DataTables JavaScript -->
	    <script src="/webmon/vendor/datatables/js/jquery.dataTables.min.js"></script>
	    <script src="/webmon/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	    <script src="/webmon/vendor/datatables-responsive/dataTables.responsive.js"></script>
	    
	    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	    <script>
	    $(document).ready(function() {
	        $('#user-list').DataTable({
	            responsive: true
	        });
	    });
	    </script>

		<!-- Custom Theme JavaScript -->
		<script src="/webmon/dist/js/sb-admin-2.js"></script>
		
		
</body>

</html>
