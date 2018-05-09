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

<%@ include file="./sessionCheck.jsp" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>KOS System - MW</title>

<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
		
		
		//ret = URLDataDAO.getURLList(conn, "PRD");
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
		
		HashMap<String,String> resultMap = new HashMap<String,String>();
		Iterator<HashMap> it_DOM01_Apache = resultList.iterator();
		Iterator<HashMap> it_DOM02_Apache = resultList.iterator();
		Iterator<HashMap> it_DOM03_Apache = resultList.iterator();
		Iterator<HashMap> it_DOM04_Apache = resultList.iterator();
		Iterator<HashMap> it_DOM01_WAS = resultList.iterator();
		Iterator<HashMap> it_DOM02_WAS = resultList.iterator();
		Iterator<HashMap> it_DOM03_WAS = resultList.iterator();
		Iterator<HashMap> it_DOM04_WAS = resultList.iterator();
		Iterator<HashMap> it_NEXA01 = resultList.iterator();
		Iterator<HashMap> it_NEXA02 = resultList.iterator();
		Iterator<HashMap> it_FMT = resultList.iterator();
		Iterator<HashMap> it_FILE = resultList.iterator();		
		Iterator<HashMap> it_ODA = resultList.iterator();		
%>

	<div id="wrapper">

		<jsp:include page='./navigation.jsp' flush='false' />
		<!-- Page Content -->
		<div id="page-wrapper">		
		<!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">PA3 PRD URL Check</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #01 - Apache
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_DOM01_Apache.hasNext()){
										        resultMap = (HashMap)it_DOM01_Apache.next();
										        if(resultMap.get("Group").equals("DOM01") && resultMap.get("Type").equals("APACHE")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #02 - Apache
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%;
										while(it_DOM02_Apache.hasNext()){
										        resultMap = (HashMap)it_DOM02_Apache.next();
										        if(resultMap.get("Group").equals("DOM02") && resultMap.get("Type").equals("APACHE")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
										        
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20" width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #03 - Apache
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%;
										while(it_DOM03_Apache.hasNext()){
										        resultMap = (HashMap)it_DOM03_Apache.next();
										        if(resultMap.get("Group").equals("DOM03") && resultMap.get("Type").equals("APACHE")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
										        
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #04 - Apache
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%;
										while(it_DOM04_Apache.hasNext()){
										        resultMap = (HashMap)it_DOM04_Apache.next();
										        if(resultMap.get("Group").equals("DOM04") && resultMap.get("Type").equals("APACHE")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
										        
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
			    <div class="panel panel-default">
			        <div class="panel-heading">
                    Order AP
                    </div>
                    <div class="panel-body">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #01 - WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_DOM01_WAS.hasNext()){
										        resultMap = (HashMap)it_DOM01_WAS.next();
										        if(resultMap.get("Group").equals("DOM01") && resultMap.get("Type").equals("WAS") || resultMap.get("Group").equals("DOM01") && resultMap.get("Type").equals("WEBTOB")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #02 - WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_DOM02_WAS.hasNext()){
										        resultMap = (HashMap)it_DOM02_WAS.next();
										        if(resultMap.get("Group").equals("DOM02") && resultMap.get("Type").equals("WAS") || resultMap.get("Group").equals("DOM02") && resultMap.get("Type").equals("WEBTOB")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #03 - WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_DOM03_WAS.hasNext()){
										        resultMap = (HashMap)it_DOM03_WAS.next();
										        if(resultMap.get("Group").equals("DOM03") && resultMap.get("Type").equals("WAS") || resultMap.get("Group").equals("DOM03") && resultMap.get("Type").equals("WEBTOB")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> Domain #04 - WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_DOM04_WAS.hasNext()){
										        resultMap = (HashMap)it_DOM04_WAS.next();
										        if(resultMap.get("Group").equals("DOM04") && resultMap.get("Type").equals("WAS") || resultMap.get("Group").equals("DOM04") && resultMap.get("Type").equals("WEBTOB")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><center>
													<img src=<% out.print(imageFileName); %> height="20"
														width="20">
												</center></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<!-- /.panel-body -->
				</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-desktop fa-fw"></i> NexaWeb Dom01
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_NEXA01.hasNext()){
										        resultMap = (HashMap)it_NEXA01.next();
										        if(resultMap.get("Group").equals("NEXA01")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><left>
												<img src=<% out.print(imageFileName); %> height="20"
													width="20"></left></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<i class="fa fa-desktop fa-fw"></i> NexaWeb Dom02
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_NEXA02.hasNext()){
										        resultMap = (HashMap)it_NEXA02.next();
										        if(resultMap.get("Group").equals("NEXA02")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><left>
												<img src=<% out.print(imageFileName); %> height="20"
													width="20"></left></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">				
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-print fa-fw"></i> FMT WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_FMT.hasNext()){
										        resultMap = (HashMap)it_FMT.next();
										        if(resultMap.get("Group").equals("FMT")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><left>
												<img src=<% out.print(imageFileName); %> height="20"
													width="20"></left></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-floppy-o fa-fw"></i> File WAS
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_FILE.hasNext()){
										        resultMap = (HashMap)it_FILE.next();
										        if(resultMap.get("Group").equals("FILE")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><left>
												<img src=<% out.print(imageFileName); %> height="20"
													width="20"></left></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">				
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-lock fa-fw"></i> ODA
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Server Name</th>
											<th>status</th>
											<th>code</th>
										</tr>
									</thead>
									<tbody>
										<%
										while(it_ODA.hasNext()){
										        resultMap = (HashMap)it_ODA.next();
										        if(resultMap.get("Group").equals("ODA")){
											        if(resultMap.get("StatusCode").equals("200")){
											        	imageFileName="../images/green.png";
											        }else if(resultMap.get("StatusCode").equals("R")){
											        	imageFileName="../images/yellow.png";                        	
											        }else if(resultMap.get("StatusCode").equals("N")){
											        	imageFileName="../images/grey.png";
											        }else{
											                imageFileName="../images/red.png";
											        }
									%>
										<tr>
											<td><%= count %></td>
											<td><%= resultMap.get("Name") %></td>
											<td><left>
												<img src=<% out.print(imageFileName); %> height="20"
													width="20"></left></td>
											<td><%= resultMap.get("StatusCode") %></td>
										</tr>
										<%
					                			count++;
										        }// if end
									        }//while end
									        count=1;
									%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
			</div>
			<!-- /.row -->
				<!-- /.container-fluid -->

			<!-- -------------------------------------- Main Page End--------------------------------------------------------- -->
			</div>
			<!-- /#page-wrapper -->			
		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="../vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="../dist/js/sb-admin-2.js"></script>
</body>

</html>
