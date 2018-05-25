<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KOS System - MW</title>

    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
    <!-- jQuery -->
    <script src="./vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./dist/js/sb-admin-2.js"></script>
	
    <script language="javascript">
	function login() {
		if(document.getElementById("user_id").value=="" || document.getElementById("password").value==""){
			alert("ID 또는 Password를 입력하세요");
			document.getElementById("user_id").focus();
			return false;
		}else{
			login_proc();	
		}

	}
	
	function login_proc() {
		var data = $("form[name=LoginForm]").serialize();
		$.ajax({
			url: "/webmon/AjaxMessageRequest.do?action=login",
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
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             login();
        }
	}



	</script>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form name="LoginForm" role="form" id="LoginForm" method="post" action="./pages/sessionProc.jsp">
                            <fieldset>
                                <div class="form-group">
                                    <input onkeyup="enterkey();" class="form-control" placeholder="ID" name="user_id" id="user_id" autofocus>
                                </div>
                                <div class="form-group">
                                    <input onkeyup="enterkey();" class="form-control" placeholder="Password" name="password" id="password" type="password" value="">
                                    <input type="hidden" name="user_name" id="user_name" value="">
                                    <input type="hidden" name="group_name" id="group_name" value="">                                    
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <!-- <a href="#" class="btn btn-lg btn-primary btn-block" onkeydown="javascript:if(event.keyCode==13){login();}" onclick="javascript:login();" >Login</a>  -->
                                
                                <!-- button 태크를 사용 시 class에서 기본적으로 submit() 옵션을 제거해야 함 -->
                                <!-- <button class="btn btn-lg btn-primary btn-block" onkeydown="javascript:if(event.keyCode==13){login();}" onclick="javascript:login();" >Login</button>  -->                                
                                <input type='button' class="btn btn-lg btn-primary btn-block" onclick="javascript:login();" value="Login"> 
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
