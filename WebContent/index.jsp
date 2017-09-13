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
	
	<style>
		#board{
			border:solid 5px blue;
			border-radius:20px;
			-moz-border-radius:20px;
			border-radius:20px;
			-webkit-border-radius:20px;
			padding:20px;
			width:100%
		}
	</style>

<title>南京大学天健社</title>

</head>
<body onLoad="load()">
<div class="wrapper">
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand"  style="border-right:1px solid #dddddd" href="index.jsp">南京大学天健社</a>
		</div>
		<div>
			<a class="navbar-brand" href="index.jsp">报名活动</a>
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
	<div class="fullwidthbanner-container">
		<div class="fullwidthbanner">
			<div id="board">
				<h3 style="text-align:center">公告栏</h3>
				<p style="text-align:center">招新<br>
				<p style="text-align:center">部门设置：活动部 全媒体 人资部 公关部 项目部</p><br>
				<p style="text-align:center">13号宣讲</p><br>
				<p style="text-align:center">16、17面试</p><br>
				<p style="text-align:center">17年公益路漫漫</p><br>
				<p style="text-align:center"></p><br>
				<p style="text-align:center">服务社会，奉献爱心</p><br>
				<p style="text-align:center">推己及人，薪火相传</p><br>
			</div>
		</div>
	</div>
	<div>
		<div>
			<h1>报名活动</h1>
			<hr>
		</div>
	</div>
	
	<div>
		<div style="text-align:center">
           	<h2>志愿者活动</h2>
        </div>
        <hr>
	</div>
	
	<div id="volunteer">
    </div>
    
    <div>
		<div style="text-align:center">
           	<h2>內建活动</h2>
        </div>
        <hr>
	</div>
	
	<div id="inner">
	</div>
</div> 

	
<div style="text-align:center">
	<p class="footer" style="width:100%;position:fixed;z-index:0;bottom:0;height:10%">
		<small>
			Version 0.0.6<br>
		</small>
		<small>
			@Powered by Surevil & NJU TJ
		</small>
	</p>
</div>
</body>
<script>
	function load(){
		var xml;
		var xmlHttp;
		var cookies=document.cookie.split(";");
		var number;
		var i;
		var temp;
		var event;
		
		if(window.XMLHttpRequest){
			xml=new XMLHttpRequest();
		}
		else{
			xml=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xml.onreadystatechange=function(){
			if(xml.readyState==4&&xml.status==200){
				if(xml.responseText!="none"&&xml.responseText!=""&&xml.responseText!="error"){
					temp=xml.responseText;
					events=temp.split("|");
					for(i=0;i<events.length;i+=4){
						addPanel(events[i],events[i+3],events[i+1]);
						if(events[i+2]=="0"){
							document.getElementById(events[i]+"Do").className="btn btn-success disabled";
							document.getElementById(events[i]+"Undo").className="btn btn-danger disabled pull-right";
						}
					}
				}
			}
		}
		
		xml.open("GET","/njuTJ/AmountServlet",false);
		xml.send();
		
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}
		else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				if(xmlHttp.responseText!="none"&&xmlHttp.responseText!=""&&xmlHttp.responseText!="error"){
					var events=xmlHttp.responseText.split("|");
					for(i=0;i<events.length;i++){
						document.getElementById(events[i]).className="panel panel-green";
					}
				}
			}
		}
		
		for(i=0;i<cookies.length;i++){
			temp=cookies[i].split("=");
			if(temp[0]=="njuTJ"){
				if(temp[1]=="none"){
					break;
				}
				else{
					number=temp[1].split("_")[2];
					xmlHttp.open("POST","/njuTJ/LoadServlet",true);
					xmlHttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
					xmlHttp.send("number="+number);
				}
				break;
			}
		}
	}
	
	function register(id){
		var xmlHttp;
		var cookies=document.cookie.split(";");
		var number;
		var i;
		var temp;
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}
		else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				if(xmlHttp.responseText=="success"){
					document.getElementById(id).className="panel panel-green";
					document.getElementById(id+"Number").innerHTML=parseInt(document.getElementById(id+"Number").innerHTML)+1;
				}
				else if(xmlHttp.responseText=="already"){
					document.getElementById(id).className="panel panel-green";
					alert("请勿重复报名");
				}
				else{
					alert("报名失败，请稍后重试");
				}
			}
		}
		
		for(i=0;i<cookies.length;i++){
			temp=cookies[i].split("=");
			if(temp[0]=="njuTJ"){
				if(temp[1]=="none"){
					alert("请先登录");
				}
				else{
					number=temp[1].split("_")[2];
					xmlHttp.open("POST","/njuTJ/RegisterServlet",true);
					xmlHttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
					xmlHttp.send("event="+id+"&"+"number="+number);
				}
				break;
			}
		}
		if(i==cookies.length){
			alert("请先登录");
		}
	}
	
	function drop(id){
		if(document.getElementById(id).className=="panel panel-green"){
			var xmlHttp;
			var cookies=document.cookie.split(";");
			var number;
			var i;
			var temp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}
			else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					if(xmlHttp.responseText=="success"){
						if(id[0]=="_"){
							document.getElementById(id).className="panel panel-yellow";
						}
						else{
							document.getElementById(id).className="panel panel-primary";
						}
						document.getElementById(id+"Number").innerHTML=document.getElementById(id+"Number").innerHTML-1;
					}
					else if(xmlHttp.responseText=="fail"){
						alert("您未报名");
					}
					else{
						alert("退选失败，请稍后重试");
					}
				}
			}
			
			for(i=0;i<cookies.length;i++){
				temp=cookies[i].split("=");
				if(temp[0]=="njuTJ"){
					if(temp[1]=="none"){
						alert("请先登录");
					}
					else{
						number=temp[1].split("_")[2];
						xmlHttp.open("POST","/njuTJ/DropServlet",true);
						xmlHttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
						xmlHttp.send("event="+id+"&"+"number="+number);
					}
					break;
				}
			}
			if(i==cookies.length){
				alert("请先登录");
			}
		}
	}
	
	function addPanel(event,realName,num){
		var whole=document.createElement("div");
		whole.className="col-lg-3 col-md-6";
		whole.style="z-index:1";
		
		var panel=document.createElement("div");
		if(event[0]!="_"){
			panel.className="panel panel-primary";//设置颜色
		}
		else{
			panel.className="panel panel-yellow";
		}
		panel.id=event;	//设置id
		
		//第一块div
		var heading=document.createElement("div");
		heading.className="panel-heading";
		var heading_row=document.createElement("div");
		heading_row.className="row";
		var row1=document.createElement("div");
		row1.className="col-xs-3";
		var row1i=document.createElement("i");
		row1i.className="fa fa-cutlery fa-5x";
		var row2=document.createElement("div");
		row2.className="col-xs-9 text-right";
		var row2p=document.createElement("div");
		row2p.innerHTML=realName;
		var row3=document.createElement("div");
		row3.className="col-xs-9 text-right";
		var row3Number=document.createElement("div");
		row3Number.id=event+"Number";//设置活动+number
		row3Number.className="huge";
		row3Number.innerHTML=num;//设置活动人数
		var row3p=document.createElement("div");
		row3p.innerHTML="报名人数";
		panel.appendChild(heading);
		heading.appendChild(heading_row);
		heading_row.appendChild(row1);
		heading_row.appendChild(row2);
		heading_row.appendChild(row3);
		row1.appendChild(row1i);
		row2.appendChild(row2p);
		row3.appendChild(row3Number);
		row3.appendChild(row3p);
		
		//第二块div
		var more=document.createElement("a");
		more.href="#";//详细信息页面
		var footer1=document.createElement("div");
		footer1.className="panel-footer";
		var footer1_span1=document.createElement("span");
		footer1_span1.className="pull-left";
		footer1_span1.innerHTML="详细信息";
		var footer1_span2=document.createElement("span");
		footer1_span2.className="pull-right";
		var footer1_span2_i=document.createElement("i");
		footer1_span2_i.className="fa fa-arrow-circle-right";
		var footer1_div=document.createElement("div");
		footer1_div.className="clearfix";
		more.appendChild(footer1);
		footer1.appendChild(footer1_span1);
		footer1.appendChild(footer1_span2);
		footer1.appendChild(footer1_div);
		footer1_span2.appendChild(footer1_span2_i);
		
		//第三块div
		var footer2=document.createElement("div");
		footer2.className="panel-footer";
		var footer2_button1=document.createElement("button");
		footer2_button1.id=event+"Do";
		footer2_button1.type="button";
		footer2_button1.className="btn btn-success";
		footer2_button1.addEventListener("click",function(){register(event)},false);//报名
		footer2_button1.innerHTML="报名";
		var footer2_button2=document.createElement("button");
		footer2_button2.id=event+"Undo";
		footer2_button2.type="button";
		footer2_button2.className="btn btn-danger pull-right";
		footer2_button2.addEventListener("click",function(){drop(event)},false);;//退选
		footer2_button2.innerHTML="退选";
		var footer2_div=document.createElement("div");
		footer2_div.className="clearfix";
		footer2.appendChild(footer2_button1);
		footer2.appendChild(footer2_button2);
		footer2.appendChild(footer2_div);
		
		//最终集成
		whole.appendChild(panel);
		panel.appendChild(heading);
		panel.appendChild(more);
		panel.appendChild(footer2);
		
		if(event[0]!="_"){
			document.getElementById("volunteer").appendChild(whole);
		}
		else{
			document.getElementById("inner").appendChild(whole);
		}
	}
</script>
</html>