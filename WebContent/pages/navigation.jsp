<!DOCTYPE html>
<html lang="ko">

<script>
function getURLList(env) {	
	//var data = {"env_name":"PRD"};
	var data = {"env_name":env};
	//console.log("data : " + data);
	//var data = JSON.stringify(obj);
	//var data = JSON.parse(obj);
	alert(data);
	$.ajax({
		url: "/webmon/AjaxMessageRequest.do?action=login",
	    type: 'POST', dataType: 'json',  data: data,
	    success: function(obj){	    
	    	alert("PRD URL Check start!!");
	    }	    
	});	// ajax end

}

</script>

<!-- Navigation -->

<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.jsp">KOS System - Middle Ware Administrator v1.0</a>
	</div>
	<!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
         <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                 <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
             </a>
             <ul class="dropdown-menu dropdown-user">
                 <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                 </li>
                 <li class="divider"></li>
                 <li><a href="/webmon/logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                 </li>
             </ul>
             <!-- /.dropdown-user -->
         </li>
         <!-- /.dropdown -->
     </ul>
     <!-- /.navbar-top-links -->    
            


	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">

				<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
						URL Check<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="./PRD_URLCheck.jsp">Production Zone</a></li>
						<!-- 
						<li><a href="./PRD_URLCheck.jsp" onclick="javascript:getURLList('PRD');">Production Zone</a></li>
						 -->
						<li><a href="#">TEST Zone<span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="#">SIT(SM)</a></li>
								<li><a href="#">SIT(HotFix)</a></li>
								<li><a href="#">SIT(SI ìì )</a></li>
								<li><a href="#">TRN</a></li>
								<li><a href="#">CAT</a></li>
								<li><a href="#">BAT</a></li>								
							</ul> <!-- /.nav-third-level --></li>
						<li><a href="#">DEV Zone</a> <!-- /.nav-third-level --></li>
					</ul> <!-- /.nav-second-level --></li>
					
				<!-- WAS Admin 링크 페이지 (group_name이 root, admin, monitor에 따라 메뉴 활성화 여부가 달라짐) -->
				<li><a href="#"><i class="fa fa-wrench fa-fw"></i> WAS
						Admin page link<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="./KOS_OSB.jsp">WebLogic Admin</a></li>
						<li><a href="./KOS_JEUS.jsp">JEUS Admin</a></li>
					</ul> <!-- /.nav-second-level --></li>
				<!-- SSL 인증서 만료일 체크 페이지 -->
				<li><a href="#"><i class="fa fa-files-o fa-fw"></i> SSL
						Certification Expire Check<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">Production Zone</a></li>
						<li><a href="#">Test Zone</a></li>
					</ul> <!-- /.nav-second-level --></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>