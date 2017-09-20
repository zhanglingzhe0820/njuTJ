<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
<div>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand"  style="border-right:1px solid #dddddd" href="">南京大学天健社</a>
		</div>
		<div>
			<a class="navbar-brand" href="adminArrange.jsp">活动统计</a>
		</div>
		<div>
			<a class="navbar-brand" href="admin.jsp">活动管理</a>
		</div>
		<div>
			<a class="navbar-brand" href="index.jsp">管理员登出</a>
		</div>
	</nav>
	
	<div style="height:100px"></div>
	
	<div class="fullwidthbanner-container">
		<div style="width:30%;margin:0 auto">
			<div class="fullwidthbanner">
				<div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 style="text-align:center">添加志愿者活动</h4>
                        </div>
                        <div class="panel-body">
                        <div class="alert alert-danger">
                              添加失败，请检查输入是否正确并稍后再试
                            </div>
                            <form action="addVolunteerEvent.action" role="form">
                                <div class="form-group">
                                    <input class="form-control" placeholder="活动名称" name="realName" type="text" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="英文名称（小于50个字符）" name="event" type="text" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="现进行次数" name="recentTime" type="text" value="1">
                                </div>
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="确定添加">
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
</body>
</html>