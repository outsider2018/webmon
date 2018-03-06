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
	background-color: #d9edf7;
	border-color: #bce8f1;
	border: 0
}
#col-2 {
	background-color: #dff0d8;
	border-color: #d6e9c6;
	border: 0
}
#col-3 {
	background-color: #f2dede;
	border-color: #ebccd1;
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

                <jsp:include page='./navigation.html' flush='false' />
                <div id="page-wrapper">
                <!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->

               <div class="col-lg-12">
                    <form id="loginForm" action="http://10.219.1.246:8180/webadmin/j_spring_security_check" method="post" name="loginForm">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            JEUS Web Admin Console
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
                                <li><a href="#TRN" data-toggle="tab">TRN</a>
                                </li>
                                <li><a href="#AIT" data-toggle="tab">AT</a>
                                </li>
                                <li><a href="#DEV" data-toggle="tab">DEV</a>
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
                                                    <b>Order AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.21:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.23:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordap03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.25:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordap05
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.27:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordap07
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Order Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.1.211:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.1.211:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ordcorp03
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>RDS AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.41:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rdsap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.43:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rdsap03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.45:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rdsap05
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.47:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rdsap07
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- First row end -->

                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                   <b>CDM AP</b> 
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.191:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.193:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmap03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.195:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmap05
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.197:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmap07
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>CDM Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.56:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.58:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2cdmcorp03
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>AUTH AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.151:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2authap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.153:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2authap03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.155:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2authap05
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.157:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2authap07
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Second row end -->

                                           <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>Billon AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.171:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billon01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.173:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billon03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.175:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billon05
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.6.177:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billon07
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Bill Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.21:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.23:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2billcorp03
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>Batch01~02 AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.3.61:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">batap01 (CDM)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.3.62:19001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">batap01 (AUTH)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.3.62:29001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">batap02 (ORD)
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Thrid row end -->

                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>Batch03~04 AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.3.63:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">batap03 (SBILL)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.3.64:19001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">batap04 (RDS)
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>BillAP / BillAR</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.41:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">billap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.43:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">billap03
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.51:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">billar01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.53:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">billar03
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>CDM / Bill / RDS FW</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.31:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">cdmfw01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.71:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">billfw01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.3.51:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rdsfw01
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fourth row end -->
                                            
                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>NEXA AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.131:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2distweb01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.6.135:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">prd2distweb05
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Anasp B2B/Siebel/Rater Batch</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.76:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">ansap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.86:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">bsblea01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.1.156:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">csblfw01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.219.33.61:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">rtcvanp-vip
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>B2B PO</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.1.91:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">bsblpo01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.219.1.93:9001/webadmin/j_spring_security_check,jeusadm,Prd@middle1" name="url">bsblpo03
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fifth row end -->
                                            
                                            <div class="row show-grid">
                                                <button type="button" class="btn btn-primary btn-lg" onclick="urlgo()">Move</button>
                                            </div>
                                </div>
                                
                                <!--  #################################### SIT ####################################-->                                
                                <div class="tab-pane fade" id="SIT">
                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>Order AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.71:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitordap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.72:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitordap02
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.158.223:9001/webadmin/j_spring_security_check,administrator,Sit3@middle1" name="url">sitordap03
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Order Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.157.133:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitordcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.157.149:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitordcorp02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>RDS AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.68:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitrdsap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.69:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitrdsap02
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- First row end -->
                                            
                                            <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                   <b>CDM AP</b> 
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.81:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2cdmap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.82:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2cdmap02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>CDM Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.155.157:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2cdmcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.155.158:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2cdmcorp02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>AUTH AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.108:9001/webadmin/j_spring_security_check,administrator,Sit2@middle1" name="url">sit2authap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.109:9001/webadmin/j_spring_security_check,administrator,Sit2@middle1" name="url">sit2authap02
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Second row end -->

                                           <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>Billon AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.81:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillon01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.82:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillon02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Bill Corp AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.157.161:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillcorp01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.157.162:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillcorp02
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>Batch01~02 AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.98:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbatap01 (CDM)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.98:19001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbatap01 (AUTH)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.99:29001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbatap02 (ORD)
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Thrid row end -->                                            

                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>Batch03~04 AP</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.218:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sitbatap03 (SBILL)
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.88:19001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sitbatap04 (RDS)
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>BillAP / BillAR</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.73:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.74:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillap02
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.76:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillar01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.77:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillar02
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>CDM / Bill / RDS FW</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.155.113:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2cdmfw01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.158:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitbillfw01
                                                        </div>
                                                        <div class="col-md-3">
                                                          <input type="radio" value="http://10.217.157.138:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">sitrdsfw01
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fourth row end -->

                                         <div class="row show-grid">
                                                <div class="col-md-4" id="col-1">
                                                    <b>NEXA AP / QABill</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.155.106:9001/webadmin/j_spring_security_check,administrator,Sit2@middle1" name="url">sit2distweb01
                                                        </div>
                                                        <div class="col-md-4">
                                                          <input type="radio" value="http://10.217.158.205:9001/webadmin/j_spring_security_check,jeusadm,Sit@middle1" name="url">qabillap01
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-2">
                                                    <b>Anasp B2B/Siebel/Rater Batch</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-3">
															<input type="radio" value="http://10.217.155.171:9001/webadmin/j_spring_security_check,administrator,Sit@middle1" name="url">sit2ansap01
                                                        </div>
                                                        <div class="col-md-3">
                                                          	<font color=red><b>check list</b></font>
                                                        </div>
                                                        <div class="col-md-3">
                                                          	<font color=red><b>check list</b></font>
                                                        </div>
                                                        <div class="col-md-3">
                                                          	<font color=red><b>check list</b></font>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-md-offset-0" id="col-3">
                                                    <b>B2B PO</b>
                                                    <div class="row show-grid">
                                                        <div class="col-md-4">
                                                          <font color=red><b>check list</b></font>
                                                        </div>
                                                        <div class="col-md-4">
                                                          <font color=red><b>check list</b></font>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Fifth row end -->                                            
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
        <script src="../vendor/raphael/raphael.min.js"></script>
        <script src="../vendor/morrisjs/morris.min.js"></script>
        <script src="../data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>