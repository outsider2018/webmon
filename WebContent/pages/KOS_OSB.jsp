<!DOCTYPE html>
<html lang="ko">

<head>

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

<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
            
            var monitoringFlag = (window.location.search.substring(1) == "true")?true:false;
            
            var timeoutms = 10000;
            
            var readyState = ["READYSTATE_UNINITIALIZED", "READYSTATE_LOADING", "READYSTATE_LOADED", "READYSTATE_INTERACTIVE", "READYSTATE_COMPLETE"];
            
            
            function autoRefresh(divId, loc){
                
                var serverLocation;
                
                if(divId.split("_")[divId.split("_").length -1] == "A"){
                    // serverLocation = "http://" + loc + "/console/images/recording.gif";
                    serverLocation = "http://" + loc + "/console";
                    // serverLocation = "http://" + loc + "/console/jsp/common/portletrefresh.jsp?pageLabel=CoreServerServerTablePage&validate=false&refreshOnly=true&region=defaultRegion&dummy=0.8117053750902414";
                }else{
                    serverLocation = "http://" + loc + "/HealthCheck";
                }
                
                var val = $("#" + divId).text();
                $("#" + divId).css("background-color", "gray");
                var startTime = Date.now();

                $.ajax({
                    type: "GET",
                    url: serverLocation,
                    timeout: timeoutms,
                    success: function(response, status, xhr) {
                        var ts = Date.now() - startTime;
                        $("#" + divId).text(val);
                        $("#" + divId).attr("title", $("#" + divId).attr("title").split("-")[0] + "-" + ts + "ms");
                        if(ts > 1000){
                            $("#" + divId).css("background-color", "yellow");
                        }else{
                            $("#" + divId).css("background-color", "blue");
                        }
                    },
                    error: function(xhr, status, errorThrown){
                        
                        if(errorThrown == ""){
                            $("#" + divId).attr("title", $("#" + divId).attr("title").split("-")[0] + "-" + readyState[xhr.status]);
                            $("#" + divId).css("background-color", "red");
                        }else{
                            $("#" + divId).attr("title", $("#" + divId).attr("title").split("-")[0] + "-" + errorThrown.toUpperCase());
                            $("#" + divId).css("background-color", "#e9967a");
                        }
                        
                    }
                });
            }
            
            function monitoring(divId, loc){
                
                if(monitoringFlag){
                    $("#" + divId).css("font-size", "7pt");
                    $("#" + divId).css("padding", "2px");
                    $("#" + divId).attr("title", loc);
                    $("#" + divId).attr("align", "center");
    
                    autoRefresh(divId, loc);
                    setInterval("autoRefresh('" + divId + "', '" + loc + "')", 6000000);
                }else{
                    $("#" + divId).hide();
                }
            }
            function urlgo(){
                var count = document.all.url.length;
                var temp;
                for(var i=0;i<count;i++){
									if(document.all.url[i].checked == true){
										temp = document.all.url[i].value;
									}
								}
                var url = temp.split(',');
                document.loginForm.action=url[0];
                document.loginForm.j_username.value=url[1];
                document.loginForm.j_password.value=url[2];
                document.loginForm.method='POST';
                document.loginForm.submit();
						}
						
        </script>
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<jsp:include page='./navigation.jsp' flush='false' />
		<!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->
		<!-- Page Content -->
		<div id="page-wrapper">

			<H3>&nbsp;KOS ESB Server List</H3>
			<form id="loginData" action="/console/j_security_check" method="post"
				name="loginData" onclick="submit()">
				<div class="col-lg-4">
					<div class="table-responsive table-bordered">
						<table border=1 class="table">
							<tr>
								<td colspan=2 align="center" title="localhost"><b>localhost</b>
								</td>
								<td><A
									href="http://localhost:7101/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://localhost:7101/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>
							<tr height="2">
								<td colspan="5"></td>
							</tr>
							<tr>
								<td rowspan=2 align="center"><b>SBX</b></td>
								<td title="sbxesboda01">ordaDom01</td>
								<td><A
									href="http://10.217.136.50:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.50:7000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="sbxesbods01,52">ordsDom01</td>
								<td><A
									href="http://10.217.136.51:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.51:7000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>
							<tr>
								<td rowspan=2 align="center"><b>Pre-Verification</b></td>
								<td title="10.217.157.133">ordaDom01</td>
								<td><A
									href="http://10.217.157.133:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td>sbconsole</td>
							</tr>
							<tr>
								<td title="10.217.157.128">ordsDom01</td>
								<td><A
									href="http://10.217.157.128:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.157.128:7000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>
							<tr height="2">
								<td colspan="5"></td>
							</tr>


							<tr>
								<td colspan=2 align="center" title="devcmvalap01"><b>Pre-Build</b>
								</td>
								<td><A
									href="http://10.217.136.105:7001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.105:7001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td colspan=2 align="center" title="10.217.157.253"><b>POC</b>
								</td>
								<td><A
									href="http://10.217.157.253:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.157.253:7000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>
							<tr>
								<td align="center"><b>ICISAdapter</b></td>
								<td colspan=4 align="center"><A title="sbxesbods01"
									href="http://sbxesbods01:8001/ICISAdaptorWeb/com/loginForm.jsp">SBX_ESB</a></td>
							</tr>
							<tr height="2">
								<td colspan="5"></td>
							</tr>
							<tr>
								<td align="center"><b>Deployments</b></td>
								<td colspan=2 align="center"><A title="10.217.136.100"
									href="http://10.217.136.100:8081/jenkins/">Jenkins</a></td>
								<td colspan=2 align="center"><A title="10.217.136.100"
									href="http://10.217.136.100:8080/nexus/#welcome">Nexus</a></td>
							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=6 align="center"><b>DEV</b></td>
								<td title="devesbods01">DEV_ORD_ESB</td>
								<td><A
									href="http://10.217.136.125:7001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.125:7001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>
							<tr>
								<td title="devesboda01">DEV_ASYNC_ESB</td>
								<td><A
									href="http://10.217.136.126:7001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="devesbb2c01">DEV_B2C_ESB</td>
								<td><A
									href="http://10.217.136.127:7001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.127:7001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesbb2b01">b2beDom01</td>
								<td><A
									href="http://10.217.136.128:7001/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.128:7001/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesbcorp01">DEV_CORP_ESB</td>
								<td><A
									href="http://10.217.136.129:7001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.129:7001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesbrds01">rdseDom01</td>
								<td><A
									href="http://10.217.136.130:7001/wls_mgr/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.130:7001/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=4 align="center"><b>DEV2</b></td>
								<td title="dev2esbods01">ordsDom01</td>
								<td><A
									href="http://10.217.136.217:7000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.217:7000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="dev2esboda01">ordaDom01</td>
								<td><A
									href="http://10.217.136.216:7000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="dev2esbrds01">rdseDom01</td>
								<td><A
									href="http://10.217.136.218:7000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.218:7000/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="dev2esbcorp01">crpeDom01</td>
								<td><A
									href="http://10.217.136.23:7000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.23:7000/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>
							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=6 align="center"><b>UT</b></td>
								<td title="devesbods01">UT_ORD_ESB</td>
								<td><A
									href="http://10.217.136.125:27001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.125:27001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesboda01">UT_ASYNC_ESB</td>
								<td><A
									href="http://10.217.136.126:27001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="devesbb2c01">UT_B2C_ESB</td>
								<td><A
									href="http://10.217.136.127:27001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.127:27001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>
							</tr>
							<tr>
								<td title="devesbb2b01">b2beUTDom01</td>
								<td><A
									href="http://10.217.136.128:27001/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.128:27001/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesbcorp01">UT_CORP_ESB</td>
								<td><A
									href="http://10.217.136.129:27001/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.129:27001/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="devesbrds01">rdseUTDom01</td>
								<td><A
									href="http://10.217.136.130:27001/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.130:27001/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>
							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=4 align="center"><b>UT2</b></td>
								<td title="dev2esbods01">ordsUTDom01</td>
								<td><A
									href="http://10.217.136.217:8000/console/j_security_check?j_username=weblogic&j_password=welcome1">console</a></td>
								<td><A
									href="http://10.217.136.217:8000/servicebus/j_security_check?j_username=weblogic&j_password=welcome1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="dev2esboda01">ordaUTDom01</td>
								<td><A
									href="http://10.217.136.216:8000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>

							<tr>
								<td title="dev2esbcorp01">crpeUTDom01</td>
								<td><A
									href="http://10.217.136.129:8000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.129:8000/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="dev2esbrds01">rdseUTDom01</td>
								<td><A
									href="http://10.217.136.130:8000/console/j_security_check?j_username=weblogic&j_password=Dev2@middle1">console</a></td>
								<td><A
									href="http://10.217.136.130:8000/servicebus/j_security_check?j_username=weblogic&j_password=Dev2@middle1">sbconsole</a></td>
							</tr>

						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<div class="table-responsive table-bordered">
						<table cellspacing="0" cellpadding=4 class="table">
							<tr>
								<td rowspan=12 align="center" style="width: 60px;"><b>SIT</b>
								</td>
								<td title="sitesbods01">ordsDom01</td>
								<td><A
									href="http://10.217.157.96:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.96:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbods02">ordsDom02</td>
								<td><A
									href="http://10.217.157.97:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.97:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesboda01">ordaDom01</td>
								<td><A
									href="http://10.217.157.93:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="sitesboda02">ordaDom02</td>
								<td><A
									href="http://10.217.157.94:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td>sbconsole</td>
							</tr>
							<tr>
								<td title="sitesbb2c01">b2ceDom01</td>
								<td><A
									href="http://10.217.157.88:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.88:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbb2c02">b2ceDom02</td>
								<td><A
									href="http://10.217.157.89:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.89:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbb2b01">b2beSIT2Dom01</td>
								<td><A
									href="http://10.217.157.86:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.86:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbb2b02">b2beSIT2Dom02</td>
								<td><A
									href="http://10.217.157.87:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.87:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbcorp01">crpeDom01</td>
								<td><A
									href="http://10.217.157.98:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.98:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbcorp02">crpeDom02</td>
								<td><A
									href="http://10.217.157.99:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.99:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbrds01">rdseDom01</td>
								<td><A
									href="http://10.217.157.91:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.91:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sitesbrds02">rdseDom02</td>
								<td><A
									href="http://10.217.157.92:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.157.92:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=11 align="center"><b>SIT2</b></td>
								<td title="sit2esbods01">ordsDom01</td>
								<td><A
									href="http://10.217.155.86:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.86:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sit2esbods02">ordsDom02</td>
								<td><A
									href="http://10.217.155.87:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.87:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sit2esboda01">ordaDom01</td>
								<td><A
									href="http://10.217.155.91:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="sit2esboda02">ordaDom02</td>
								<td><A
									href="http://10.217.155.92:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>

							<tr>
								<td title="sit2esbb2c01">b2ceDom01</td>
								<td><A
									href="http://10.217.155.188:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.188:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="sit2esbb2c02">b2ceDom02</td>
								<td><A
									href="http://10.217.155.189:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.189:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="sit2esbb2b01">b2beDom01</td>
								<td><A
									href="http://10.217.155.186:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.186:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="sit2esbb2b02">b2beDom02</td>
								<td><A
									href="http://10.217.155.187:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.187:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>

							<tr>
								<td title="sit2esbcorp01">crpeDom01</td>
								<td><A
									href="http://10.217.155.173:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.173:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="sit2esbcorp02">crpeDom02</td>
								<td><A
									href="http://10.217.155.174:7000/console/j_security_check?j_username=weblogic&j_password=Sit@middle1">console</a></td>
								<td><A
									href="http://10.217.155.174:7000/servicebus/j_security_check?j_username=weblogic&j_password=Sit@middle1">sbconsole</a></td>

							</tr>


							<tr height="2">
								<td colspan="5"></td>
							</tr>


							<tr>
								<td rowspan=4 align="center"><b>AT</b></td>
								<td title="atesbods01,52">ordsDom01</td>
								<td><A
									href="http://10.217.158.150:7000/console/j_security_check?j_username=weblogic&j_password=At@middle1">console</a></td>
								<td><A
									href="http://10.217.158.150:7000/servicebus/j_security_check?j_username=weblogic&j_password=At@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="atesboda01,49">ordaDom01</td>
								<td><A
									href="http://10.217.158.151:7000/console/j_security_check?j_username=weblogic&j_password=At@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="atesbcorp01,47">crpeDom01</td>
								<td><A
									href="http://10.217.158.153:7000/console/j_security_check?j_username=weblogic&j_password=At@middle1">console</a></td>
								<td><A
									href="http://10.217.158.153:7000/servicebus/j_security_check?j_username=weblogic&j_password=At@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="atesbrds01,54">rdseDom01</td>
								<td><A
									href="http://10.217.155.53:7000/console/j_security_check?j_username=weblogic&j_password=At@middle1">console</a></td>
								<td><A
									href="http://10.217.155.53:7000/servicebus/j_security_check?j_username=weblogic&j_password=At@middle1">sbconsole</a></td>

							</tr>

							<tr height="2">
								<td colspan="5"></td>
							</tr>

							<tr>
								<td rowspan=12 align="center"><b>TRN</b></td>
								<td title="trnesbods01,202">ordsDom01</td>
								<td><A
									href="http://10.217.157.201:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td><A
									href="http://10.217.157.201:7000/servicebus/j_security_check?j_username=weblogic&j_password=Trn@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="trnesboda01">ordaDom01</td>
								<td><A
									href="http://10.217.157.198:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td>sbconsole</td>

							</tr>
							<tr>
								<td title="trnesbb2c01,194">b2ceDom01</td>
								<td><A
									href="http://10.217.157.193:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td><A
									href="http://10.217.157.193:7000/servicebus/j_security_check?j_username=weblogic&j_password=Trn@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="trnesbb2b01,192">b2beDom01</td>
								<td><A
									href="http://10.217.157.191:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td><A
									href="http://10.217.157.191:7000/servicebus/j_security_check?j_username=weblogic&j_password=Trn@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="trnesbcorp01,204">crpeDom01</td>
								<td><A
									href="http://10.217.157.203:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td><A
									href="http://10.217.157.203:7000/servicebus/j_security_check?j_username=weblogic&j_password=Trn@middle1">sbconsole</a></td>

							</tr>
							<tr>
								<td title="trnesbrds01,197">rdseDom01</td>
								<td><A
									href="http://10.217.157.196:7000/console/j_security_check?j_username=weblogic&j_password=Trn@middle1">console</a></td>
								<td><A
									href="http://10.217.157.196:7000/servicebus/j_security_check?j_username=weblogic&j_password=Trn@middle1">sbconsole</a></td>
							</tr>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-3">   
          <div class="table-responsive table-bordered">              
          <table cellspacing='0' cellpadding='4' class="table">
              <tr>
                  <td rowspan=10 align="center" style="width:60px;">
                      <b>PRD</b>
                  </td>
                  <td title="esbb2c01,112">b2ceDom01</td>
                  <td><A href="http://10.219.3.111:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.111:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                
              </tr>
              <tr>
                  <td title="esbb2c03,114">b2ceDom02</td>
                  <td><A href="http://10.219.3.113:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.113:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                 
              </tr>
              <tr>
                  <td title="esbb2c05,116">b2ceDom03</td>
                  <td><A href="http://10.219.3.115:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.115:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                 
              </tr>
              <tr>
                  <td title="esbb2c07,108">b2ceDom04</td>
                  <td><A href="http://10.219.3.117:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.117:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                 
              </tr>
              <tr>
                  <td title="esbb2b01,02">b2beDom01</td>
                  <td><A href="http://10.219.3.101:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.101:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                
              </tr>
              <tr>
                  <td title="esbb2b03,104">b2beDom02</td>
                  <td><A href="http://10.219.3.103:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.103:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                
              </tr>
              <!--
              <tr>
                  <td title="esbcorp01,222">crpeDom01</td>
                  <td><A href="http://esbcorp01:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://esbcorp01:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
           
              </tr>
              <tr>
                  <td title="esbcorp03,224">crpeDom02</td>
                  <td><A href="http://esbcorp03:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://esbcorp03:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
            
              </tr>
              -->
              <tr>
                  <td title="esbrds01,132">rdseDom01</td>
                  <td><A href="http://10.219.3.131:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.131:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
               
              </tr>
              <tr>
                  <td title="esbrds03,134">rdseDom02</td>
                  <td><A href="http://10.219.3.133:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.133:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                
              </tr>
              <tr>
                  <td title="esbrds05,136">rdseDom03</td>
                  <td><A href="http://10.219.3.135:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.135:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                 
              </tr>
              <tr>
                  <td title="esbrds07,138">rdseDom04</td>
                  <td><A href="http://10.219.3.137:7000/wls_mgr/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.3.137:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
             
              </tr>
              
              <tr height="2"><td colspan="5"></td></tr>
              
              <tr>
                  <td rowspan=18 align="center">
                      <b>PRD2</b>
                  </td>
                  <td title="prd2esbods01,82">ordsDom01</td>
                  <td><A href="http://10.219.7.81:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.81:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
              
              </tr>
              <tr>
                  <td title="prd2esbods03,84">ordsDom02</td>
                  <td><A href="http://10.219.7.83:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.83:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
                
              </tr>
              <tr>
                  <td title="prd2esbods05,86">ordsDom03</td>
                  <td><A href="http://10.219.7.85:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.85:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
              
              </tr>
              <tr>
                  <td title="prd2esbods07,88">ordsDom04</td>
                  <td><A href="http://10.219.7.87:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.87:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
             
              </tr>
              <tr>
                  <td title="prd2esboda01">ordaDom01</td>
                  <td><A href="http://10.219.7.71:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td>sbconsole</td>
              </tr>
              <tr>
                  <td title="prd2esboda03">ordaDom02</td>
                  <td><A href="http://10.219.7.73:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td>sbconsole</td>
              </tr>
              <tr>
                  <td title="prd2esboda05">ordaDom03</td>
                  <td><A href="http://10.219.7.75:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td>sbconsole</td>
              </tr>
              <tr>
                  <td title="prd2esboda07">ordaDom04</td>
                  <td><A href="http://10.219.7.77:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td>sbconsole</td>
              </tr>
           
              <tr>
                  <td title="prd2esbcorp01,110">crpeDom01</td>
                  <td><A href="http://10.219.7.61:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.61:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
               
              </tr>
              <tr>
                  <td title="prd2esbcorp03,112">crpeDom02</td>
                  <td><A href="http://10.219.7.63:7000/console/j_security_check?j_username=weblogic&j_password=Prd@middle1">console</a></td>
                  <td><A href="http://10.219.7.63:7000/servicebus/j_security_check?j_username=weblogic&j_password=Prd@middle1">sbconsole</a></td>
               
              </tr>
          </table>
          </div>
          <!-- /.table-responsive --> 
       </div>
      <!-- /.col-lg-4 -->                   
		</form>

<p id="wmsg" style="color:gray;">&nbsp;※ Google Chrome에 최적화 되어 있습니다.  Chrome실행시 「--disable-web-security」 option 적용이 필요합니다.</p>
<script>
    if(!monitoringFlag){
        $("#wmsg").hide();
    }
</script>
        </div>
        <!-- /#page-wrapper -->
        <!-- -------------------------------------- Main Page End--------------------------------------------------------- -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <!-- 
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>
 	-->
 	
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    </body>
</html>


