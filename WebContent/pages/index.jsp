<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page language = "java" %>
<%@ page session="true" %>

<!DOCTYPE html>
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

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<jsp:include page='./navigation.jsp' flush='false' />
		<!-- Page Content -->		
		<div id="page-wrapper">				
		<!-- -------------------------------------- Main Page Start--------------------------------------------------------- -->
			<div class="row">
			&nbsp;
			</div>		
			<div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	<i class="fa fa-user"></i> Total URL List               
                        </div>
                        <!-- End panel-heading -->
                        <div class="panel-body">
                            <div class="row">               
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="totalUrl"></div>
                                </div>
                            </div>
                        </div>
                        <!-- End panel-body -->                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                        	<i class="fa fa-smile-o"></i> Good site
                        </div>
                        <!-- End panel-heading -->                        
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="goodsite"></div>
                                </div>
                            </div>
                        </div>
                        <!-- End panel-body --> 
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <i class="fa fa-frown-o"></i> Bad site
                        </div>
                        <!-- End panel-heading -->                        
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-9 text-right">
                                    <div class="huge"  id="badsite"></div>
                                </div>
                            </div>
                        </div>
                        <!-- End panel-body --> 
                    </div>
                </div>                
			</div>
			<!-- /.row -->
			
			<div class="row">
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-bar-chart-o"></i> 일자별 에러현황</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->


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

	    <script>
	    
		$.ajax({
			url: "/webmon/AjaxMessageRequest.do?action=totalUrl",
		    type: 'POST', dataType: 'json', data: "env=PRD",
		    success: function(obj){
		    	var totalUrl = obj.TOTALURL;
		    	$("#totalUrl").html(totalUrl);
		    }, // ajax success end
		    error:function(){
		    	$("#totalUrl").html("get Fail.");
		    }
		});	// ajax end
		
		$.ajax({
			url: "/webmon/AjaxMessageRequest.do?action=countSite",
		    type: 'POST', dataType: 'json', data: "env=200",
		    success: function(obj){
		    	var goodsite = obj.countURL;
		    	$("#goodsite").html(goodsite);
		    }, // ajax success end
		    error:function(){
		    	$("#goodsite").html("get Fail.");
		    }
		});	// ajax end
		
		$.ajax({
			url: "/webmon/AjaxMessageRequest.do?action=countSite",
		    type: 'POST', dataType: 'json', data: "env=-1",
		    success: function(obj){
		    	var badsite = obj.countURL;
		    	$("#badsite").html(badsite);
		    }, // ajax success end
		    error:function(){
		    	$("#badsite").html("get Fail.");
		    }
		});	// ajax end	  		
	    
	    </script>    

</body>

</html>
