<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
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
		<a class="navbar-brand" href="../../index.jsp">KOS System - Middle Ware Administrator v1.0</a>
	</div>
	<!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
         <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                 <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
             </a>
             <ul class="dropdown-menu dropdown-user">
             	 <li><a href="../../index.jsp"><i class="fa fa-dashboard fa-fw"></i> DashBoard</a>
                 <li><a href="./userlist.jsp"><i class="fa fa-user fa-fw"></i> Management</a>
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
				<!-- 사용자 관리 -->
				<li><a href="../user/userlist.jsp"><i class="fa fa-dashboard fa-fw"></i>
						USER 관리</a>
				</li>
					
				<!-- WEB 체크 대상 URL 관리 -->
				<li><a href="#"><i class="fa fa-wrench fa-fw"></i> 
						URL 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="../url/urllist.jsp">PRD</a></li>
						<li><a href="#">SIT</a></li>
					</ul> <!-- /.nav-second-level --></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>