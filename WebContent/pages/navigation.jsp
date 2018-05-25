<!DOCTYPE html>
<html lang="ko">

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
		<a class="navbar-brand" href="index.jsp">KOS Middle Ware Monitoring & Management System</a>
	</div>
	<!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
         <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                 <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
             </a>
             <ul class="dropdown-menu dropdown-user">
<%
				if( session.getAttribute("group_name").equals("root")){
%>             
				 <li><a href="./index.jsp"><i class="fa fa-dashboard fa-fw"></i> Monitoring</a>
                 <li><a href="./root/user/userlist.jsp"><i class="fa fa-user fa-fw"></i> User Management</a>
                 </li>
                 <li class="divider"></li>
<%
				}	
%>                 
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
						Status Monitoring<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="./PRD_URLCheck.jsp">Production Zone</a></li>
						<!-- 
						<li><a href="./PRD_URLCheck.jsp" onclick="javascript:getURLList('PRD');">Production Zone</a></li>
						 -->
						<li><a href="#">TEST Zone<span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="#">SIT(SM)</a></li>
								<li><a href="#">SIT(HotFix)</a></li>						
							</ul> <!-- /.nav-third-level --></li>
					</ul> <!-- /.nav-second-level --></li>
					
				<!-- WAS Admin 링크 페이지 (group_name이 root, admin, monitor에 따라 메뉴 활성화 여부가 달라짐) -->
<%
				if( session.getAttribute("group_name").equals("root")||session.getAttribute("group_name").equals("admin")){
%>
				<li><a href="#"><i class="fa fa-wrench fa-fw"></i> Management Link
						<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="./KOS_OSB.jsp">WebLogic Admin Console</a></li>
						<li><a href="./KOS_JEUS.jsp">Jeus Admin Console</a></li>
					</ul> <!-- /.nav-second-level --></li>
<%					
				}
%>				

			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>