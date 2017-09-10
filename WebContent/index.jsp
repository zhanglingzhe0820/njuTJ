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
			<a class="navbar-brand" href="login.jsp">管理员登录</a>
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
				<p style="text-align:center">部门设置：活动部 全媒体 人资部 公关部 项目部</p>
				...<br>
				...<br>
				...<br>
				...<br>
				...<br>
				...<br>
				...<br>
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
	
	<div>
	<div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="minJian">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>传承之民间手工艺进校园</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="minJianNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("minJian");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("minJian");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="tanFang">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>传承之探访南大老教授</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="tanFangNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("tanFang");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("tanFang");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="shiBo">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>传承之南京市博物馆讲解员</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="shiBoNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("shiBo");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("shiBo");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="fengZheng">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>风筝节活动</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="fengZhengNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("fengZheng");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("fengZheng");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="shiTang">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>食堂微公益</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="shiTangNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("shiTang");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("shiTang");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="heYuan">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>和园老人探访</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="heYuanNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("heYuan");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("heYuan");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="lanTian">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>蓝天之下</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="lanTianNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("lanTian");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("lanTian");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    <div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-primary" id="duanWu">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-fire   fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>端午节活动</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="duanWuNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("duanWu");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("duanWu");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
    
    </div>
    
    <div>
		<div style="text-align:center">
           	<h2>內建活动</h2>
        </div>
        <hr>
	</div>
	
	<div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-yellow" id="_luYing">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-glass fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>玄武湖露营</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="_luYingNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("_luYing");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("_luYing");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
	
	<div class="col-lg-3 col-md-6" style="z-index:1">
                    <div class="panel panel-yellow" id="_shaoKao">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cutlery fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>羊山公园烧烤</div>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="_shaoKaoNumber">26</div>
                                    <div>报名人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-success" onClick='register("_shaoKao");'>报名</button>
                            <button type="button" class="btn btn-danger pull-right" onClick='drop("_shaoKao");'>退选</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
    </div>
</div> 

	
<div style="text-align:center">
	<p class="footer" style="width:100%;position:fixed;z-index:0;bottom:0;height:10%">
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
					for(i=0;i<events.length;i+=2){
						document.getElementById(events[i]+"Number").innerHTML=events[i+1];
					}
				}
			}
		}
		
		xml.open("GET","/njuTJ/AmountServlet",true);
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
</script>
</html>