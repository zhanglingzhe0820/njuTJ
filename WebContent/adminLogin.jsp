<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap Core CSS -->
	<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="resources/vendor/sb-admin-2/sb-admin-2.min.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="resources/vendor/jquery/jquery.min.js"></script>

	<script src="resources/vendor/metisMenu/metisMenu.min.js"></script>

	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="resources/vendor/sb-admin-2/sb-admin-2.min.js"></script>
<title>南京大学天健社</title>

</head>
<body onload="load();">
<div class="wrapper">
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand"  style="border-right:1px solid #dddddd" href="">南京大学天健社</a>
		</div>
		<div>
			<a class="navbar-brand" href="index.jsp">报名活动</a>
		</div>
		<div>
			<a class="navbar-brand" href="arrange.jsp">活动统计</a>
		</div>
		<div>
			<a class="navbar-brand" href="index.jsp">招新报名</a>
		</div>
		<div>
			<a class="navbar-brand" href="adminLogin.jsp">管理员登录</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
					<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-users">
					<li><a href="login.jsp"><i class="fa fa-sign-in fa-fw"></i> 登录</a>
					</li>
					<li><a href="SignUp.jsp"><i class="fa fa-list-alt fa-fw"></i> 注册</a>
					</li>
					<li><a href="logout.action"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
					</li>
				</ul>
				<!-- /.dropdown-user -->
			</li>
		</ul>
	</nav>
	
	<div style="height:150px"></div>
	
	<div class="fullwidthbanner-container">
		<div style="width:30%;margin:0 auto">
			<div class="fullwidthbanner">
				<div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 style="text-align:center">管理员登录</h4>
                        </div>
                        <div class="panel-body">
                            <form action="adminLogin.action" role="form">
                                <div class="form-group">
                                    <input class="form-control" placeholder="账号" name="username" type="text" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="登录">
                            </form>
                        </div>
                        <div class="panel-footer">
                           <p style="text-align:right"> 南京大学天健社 宣</p>
                        </div>
                    </div>
			</div>
		</div>
	</div>
</div>

<div style="text-align:center">
	<p class="footer" style="width:100%;position:fixed;z-index:0;bottom:0;height:10%">
		<small>
			Version 0.1.6<br>
		</small>
		<small>
			@Powered by Surevil & NJU TJ
		</small>
	</p>
</div>

</body>
<script>
function load(){
	//验证登录
	var cookies=document.cookie.split(";");
	for(i=0;i<cookies.length;i++){
		temp=cookies[i].split("=");
		if(temp[0]=="njuTJAdmin"&&temp[1]=="login"){
			window.location.href="/njuTJ/adminArrange.jsp";
			break;
		}
	}
}
</script>
</html>