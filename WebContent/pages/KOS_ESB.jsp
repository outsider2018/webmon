<!DOCTYPE html>
<html lang="kr">

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

<style>

#col-1{
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}
#col-2 {
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}
#col-3 {
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}
#col-4 {
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}
#col-5 {
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}
#col-6 {
	background-color: #eeeeee;
	border-color: #eeeeee;
	border: 0
}

</style>
<script type="text/javascript">
function urlgo(){
        var count = document.all.url.length;
        var temp;
        for(var i=0;i<count;i++){
                if(document.all.url[i].checked == true){
                        temp = document.all.url[i].value;
                }
        }
        var url = temp.split(',');
        var rand_no = Math.random();
        rand_no = rand_no * 1000;
        rand_no = Math.ceil(rand_no);

        var newWin = window.open("",rand_no,"");
        document.loginForm.action=url[0];
        document.loginForm.j_username.value=url[1];
        document.loginForm.j_password.value=url[2];
        document.loginForm.method='POST';
        document.loginForm.target=rand_no;
        document.loginForm.submit();
}
</script>
</head>

<body>

        <div id="wrapper">

                <jsp:include page='./navigation.jsp' flush='false' />
                <div id="page-wrapper">
                <!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->

               <div class="col-lg-12">
                    <form id="loginForm" action="http://10.219.1.246:8180/webadmin/j_spring_security_check" method="post" name="loginForm">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ESB Web Admin Console
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <!-- ul class="nav nav-tabs"-->
                            <ul class="nav nav-pills">
                                <li class="active"><a href="#PRD" data-toggle="tab">PRD</a>
                                </li>
                                <li><a href="#SIT" data-toggle="tab">SIT</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="PRD">
                                <!--  #################################### PRD ####################################-->
                                <!-- 
                                			<div class="row show-grid">                                			
                                				<div class="alert alert-danger" align="center"><b>PRD</b></div>
                                			</div>
                                 -->
                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>ESB ODS</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.81:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.83:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.85:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.87:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-1">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.81:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.83:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.85:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.87:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-1">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.81:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.83:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.85:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.87:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- First row end -->

                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-2">
                                                   <b>ESB CORP</b> 
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Second row end -->

                                           <div class="row show-grid">
                                                <div class="col-md-4" id="col-3">
                                                    <b>ESB RDS</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.135:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.137:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.135:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.137:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.135:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.137:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Thrid row end -->

                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-4">
                                                    <b>ESB ODA</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.75:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.77:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-4">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.75:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.77:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-4">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.75:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.77:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fourth row end -->
                                            
                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-5">
                                                    <b>ESB B2C</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.115:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.117:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-5">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.115:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.117:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-5">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.115:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #3
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.117:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #4
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fifth row end -->
                                            
                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-6">
                                                    <b>ESB B2B</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-6">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-6">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #1
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">Dom #2
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- six row end -->
                                            
                                            <div class="row show-grid">
                                                <button type="button" class="btn btn-primary btn-lg" onclick="urlgo()">Move</button>
                                            </div>
                                </div>
                                
                                                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="SIT">
                                <!--  #################################### SIT ####################################-->
                                <!-- 
                                			<div class="row show-grid">                                			
                                				<div class="alert alert-danger" align="center"><b>PRD</b></div>
                                			</div>
                                 -->
                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>SIT ESB ODS</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.86:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.155.87:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-1">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.81:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.83:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-1">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.81:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.83:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- First row end -->

                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-2">
                                                   <b>SIT ESB CORP</b> 
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.61:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.63:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Second row end -->

                                           <div class="row show-grid">
                                                <div class="col-md-4" id="col-3">
                                                    <b>SIT ESB RDS</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.131:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.133:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Thrid row end -->

                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-4">
                                                    <b>SIT ESB ODA</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-4">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-4">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.71:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT HOTFIX
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.7.73:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">SIT SM
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fourth row end -->
                                            
                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-5">
                                                    <b>SIT ESB B2C</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/console/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-5">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-5">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.111:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.113:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">sit2esbb2c02
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fifth row end -->
                                            
                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-6">
                                                    <b>SIT ESB B2B</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/wls_mgr/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-6">
                                                    <b>SB Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/sbconsole/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-6">
                                                    <b>EM Console</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.101:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.103:7000/em/j_spring_security_check,weblogic,Prd@middle1" name="url">esbb2b02
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- six row end -->                                           
                                            <div class="row show-grid">
                                                <button type="button" class="btn btn-primary btn-lg" onclick="urlgo()">Move</button>
                                            </div>
                                </div>
                                
                                <div class="tab-pane fade" id="TRN">
                                    <h4>TRN</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="DEV">
                                    <h4>DEV</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <input type="hidden" value="" name="j_username">
                                        <input type="hidden" value="" name="j_password">
                                        </form>
                </div>
                <!-- /.col-lg-12 -->


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