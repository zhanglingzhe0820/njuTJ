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
<body onload="load()">
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
			</li>
		</ul>
	</nav>
	
	<div class="panel-body">
		<div style="text-align:center">
			<div class="alert alert-info" style="text-align:center;" id="event_name"></div>
		</div>
    	<ul class="timeline">
  			<li>
            	<div class="timeline-badge" id="event_icon1">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title1">活动时间</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body1" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
             <li class="timeline-inverted">
            	<div class="timeline-badge" id="event_icon2">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title2">活动描述</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body2" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
             <li>
            	<div class="timeline-badge" id="event_icon3">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title3">活动时长描述</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body3" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
              <li class="timeline-inverted">
            	<div class="timeline-badge" id="event_icon4">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title4">活动负责人</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body4" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
              <li>
            	<div class="timeline-badge" id="event_icon5">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title5">活动群号</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body5" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
              <li class="timeline-inverted">
            	<div class="timeline-badge" id="event_icon6">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title6">活动人数限制</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body6" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
              <li>
            	<div class="timeline-badge" id="event_icon7">
                </div>
                <div class="timeline-panel">
                     <div class="timeline-heading">
                     	<h4 class="timeline-title" id="event_content_title7">活动注意事项</h4>
                     </div>
                     <div class="timeline-body" id="event_content_body7" style="white-space:pre-wrap;">
                        <p>xxx</p>
                     </div>
                 </div>
             </li>
    	</ul>
    </div>
</div>

<div style="text-align:center">
	<p class="footer" style="width:100%;position:fixed;z-index:-1;bottom:0;height:10%">
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
var number=7;
function load(){
	var i=0;
	for(i=0;i<number;i++){
		document.getElementById("event_icon"+(i+1)).style="background-color:"+randomColor();
	}
	
	var event=location.search.split("=")[1];
	var xml;
	var temp;
	var event;
	var title=document.createElement("h1");
	
	document.getElementById("event_name").appendChild(title);
	
	if(window.XMLHttpRequest){
		xml=new XMLHttpRequest();
	}
	else{
		xml=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xml.onreadystatechange=function(){
		if(xml.readyState==4&&xml.status==200){
			temp=xml.responseText;
			infos=temp.split("|");
			title.innerHTML=infos[0];
			if(infos.length>1){
				for(i=1;i<infos.length;i+=2){
					var index=Math.floor(i/2)+1;
					document.getElementById("event_content_title"+index).innerHTML=infos[i];
					document.getElementById("event_content_body"+index).innerHTML=infos[i+1];
				}
			}
			else{
				for(i=0;i<number;i++){
					document.getElementById("event_content_title"+(i+1)).innerHTML="";
					document.getElementById("event_content_body"+(i+1)).innerHTML="";
				}
			}
		}
	}
	
	xml.open("POST","/njuTJ/DescribeServlet",true);
	xml.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xml.send("&event="+event);
}

function randomColor(){
	var color="#";
	var hex="0123456789ABCDEF";
	for(var i=0;i<6;i++){
		color+=hex[Math.floor(Math.random()*16)];
	}
	return color;
}
</script>
</html>