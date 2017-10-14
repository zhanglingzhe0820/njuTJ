<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<style>
		#board{
			border:solid 5px blue;
			border-radius:20px;
			-moz-border-radius:20px;
			border-radius:20px;
			-webkit-border-radius:20px;
			padding:20px;
			width:100%;
			white-space:pre-wrap;
			text-align:center
		}
</style>
</head>
<body onload="load();">
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
			<a class="navbar-brand" href="adminLogout.action">管理员登出</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
					<i class="fa fa-wrench fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-users">
					<li><a href="uploadUserInfo.jsp"><i class="fa fa-upload fa-fw"></i> 导入用户信息</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
		<div class="fullwidthbanner-container">
			<div class="fullwidthbanner">
				<div id="board">
<h2>公告栏</h2>
<div id="posterContent">
天健社
部门设置：活动部 全媒体 人资部 公关部 项目部
17志愿者群一群（已满）:
658573828
17志愿者群二群：
112303768
17年公益路漫漫
				
服务社会，奉献爱心
推己及人，薪火相传
</div>
<button type="button" class="btn btn-default btn-lg" onclick="posterButton()" id="posterButton">修改</button>
			</div>
		</div>
	</div>
	<div >
		<div>
			<div>
				<h1>活动管理</h1>
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
    
    	<div style="height:1000px">
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
function posterButton(){
	if(document.getElementById("posterButton").innerHTML=="提交"){
		submitPoster();
	}
	else{
		modifyPoster();
	}
}

function modifyPoster(){
	var value=document.getElementById("posterContent").innerHTML;
	var postArea=document.createElement("textarea");
	postArea.id="posterContent";
	postArea.className="form-control";
	postArea.style="text-align:center;height:expression((this.scrollHeight>150)?'150px':(this.scrollHeight+5)+'px');overflow:auto;";
	postArea.innerHTML=value;
	document.getElementById("board").replaceChild(postArea,document.getElementById("posterContent"));
	document.getElementById("posterButton").innerHTML="提交";
}

function submitPoster(){
	var xml;
	var temp;
	var content=document.getElementById("posterContent").value;
	
	if(window.XMLHttpRequest){
		xml=new XMLHttpRequest();
	}
	else{
		xml=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xml.onreadystatechange=function(){
		if(xml.readyState==4&&xml.status==200){
			temp=xml.responseText;
			if(temp=="success"){
				alert("提交成功");
				var postArea=document.createElement("div");
				postArea.id="posterContent";
				postArea.innerHTML=content;
				document.getElementById("board").replaceChild(postArea,document.getElementById("posterContent"));
				document.getElementById("posterButton").innerHTML="修改";
			}
			else{
				alert("提交失败，请稍后重试");
			}
		}
	}
	
	xml.open("POST","/njuTJ/UpdateWholeInfoServlet",true);
	xml.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xml.send("kind=poster"+"&content="+content);
}

var icons=["fa fa-cutlery","fa fa-flash","glyphicon glyphicon-glass","glyphicon glyphicon-asterisk","glyphicon glyphicon-tower","glyphicon glyphicon-fire",
	"glyphicon glyphicon-piggy-bank","fa fa-code","fa fa-flag","fa fa-magnet","fa fa-magic","fa fa-rocket","fa fa-heart","fa fa-star","fa fa-puzzle-piece",
	"fa fa-shield","fa fa-bullseye","fa fa-ticket","fa fa-compass","fa fa-bomb","fa fa-delicious","glyphicon glyphicon-cloud","glyphicon glyphicon-cog","fa fa-tint","fa fa-adjust","fa fa-map-maker"];
	function load(){
		var xml;
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
					for(i=0;i<events.length;i+=5){
						addPanel(events[i],events[i+3],events[i+1],events[i+4]);
						if(events[i+2]=="0"){
							document.getElementById(events[i]+"Do").className="btn btn-success ";
							document.getElementById(events[i]+"Undo").className="btn btn-danger disabled pull-right";
							document.getElementById(events[i]+"Do").disable=false;
							document.getElementById(events[i]+"Undo").disable=true;
							document.getElementById(events[i]+"Time").type=false;
						}
						else{							
							document.getElementById(events[i]+"Do").className="btn btn-success disabled";
							document.getElementById(events[i]+"Undo").className="btn btn-danger pull-right";
							document.getElementById(events[i]+"Do").disable=true;
							document.getElementById(events[i]+"Undo").disable=false;
							document.getElementById(events[i]+"Time").readOnly=true;
						}
					}
					addPlus("志愿者");
					addPlus("內建");
				}
			}
		}
		
		xml.open("GET","/njuTJ/AmountServlet",true);
		xml.send();
		
		//加载公告栏内容
		var xmlHttp;
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}
		else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				if(xmlHttp.responseText!="none"&&xmlHttp.responseText!=""&&xmlHttp.responseText!="error"){
					temp=xmlHttp.responseText;
					document.getElementById("posterContent").innerHTML=temp;
				}
			}
		}
		
		xmlHttp.open("POST","/njuTJ/LoadWholeInfoServlet",true);
		xmlHttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xmlHttp.send("kind=poster");
		
		//验证登录
		var cookies=document.cookie.split(";");
		for(i=0;i<cookies.length;i++){
			temp=cookies[i].split("=");
			if(temp[0]=="njuTJAdmin"){
				if(temp[1]=="none"){
					window.location.href="/njuTJ/index.jsp";
				}
				break;
			}
		}
		if(i==cookies.length){
			window.location.href="/njuTJ/index.jsp";
		}
	}
	
	function startRegister(event){
		var xml;
		var xmlHttp;
		var number;
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
				if(xml.responseText=="success"){
					document.getElementById(event+"Do").className="btn btn-success disabled";
					document.getElementById(event+"Undo").className="btn btn-danger pull-right";
					document.getElementById(event+"Do").disable=true;
					document.getElementById(event+"Undo").disable=false;
					document.getElementById(event+"Time").readOnly=true;
				}
			}
		}
		
		xml.open("POST","/njuTJ/StartRegisterServlet",true);
		xml.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xml.send("recentTime="+document.getElementById(event+"Time").value+"&event="+event);
	}
	
	function stopRegister(event){
		var xml;
		var xmlHttp;
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
				if(xml.responseText=="success"){
					document.getElementById(event+"Do").className="btn btn-success";
					document.getElementById(event+"Undo").className="btn btn-danger disabled pull-right";
					document.getElementById(event+"Do").disable=false;
					document.getElementById(event+"Undo").disable=true;
					document.getElementById(event+"Time").readOnly=false;
				}
			}
		}
		
		xml.open("POST","/njuTJ/StopRegisterServlet",true);
		xml.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xml.send("recentTime="+document.getElementById(event+"Time").value+"&event="+event);
	}
	
	function addPanel(event,realName,num,time){
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
		row1i.className=icons[Math.floor(Math.random()*(icons.length))]+" fa-5x";
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
		more.href="/njuTJ/adminDetail.jsp?event="+event;//详细信息页面
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
		var footerInput=document.createElement("div");
		footerInput.className="panel-footer";
		footerInput.style="text-align:center";
		var smallp1=document.createElement("small");
		smallp1.innerHTML="第";
		var input=document.createElement("input");
		input.id=event+"Time";
		input.type="text";
		input.style="width:10%";
		input.value=time;
		var smallp2=document.createElement("small");
		smallp2.innerHTML="次活动";
		footerInput.appendChild(smallp1);
		footerInput.appendChild(input);
		footerInput.appendChild(smallp2);
		
		//第四块div
		var footer2=document.createElement("div");
		footer2.className="panel-footer";
		var footer2_button1=document.createElement("button");
		footer2_button1.id=event+"Do";
		footer2_button1.type="button";
		footer2_button1.className="btn btn-success";
		footer2_button1.addEventListener("click",function(){startRegister(event)},false);//开启报名
		footer2_button1.innerHTML="开启报名";
		var footer2_button2=document.createElement("button");
		footer2_button2.id=event+"Undo";
		footer2_button2.type="button";
		footer2_button2.className="btn btn-danger pull-right";
		footer2_button2.addEventListener("click",function(){stopRegister(event)},false);//停止报名
		footer2_button2.innerHTML="停止报名";
		var footer2_div=document.createElement("div");
		footer2_div.className="clearfix";
		footer2.appendChild(footer2_button1);
		footer2.appendChild(footer2_button2);
		footer2.appendChild(footer2_div);
		
		//最终集成
		whole.appendChild(panel);
		panel.appendChild(heading);
		panel.appendChild(more);
		panel.appendChild(footerInput);
		panel.appendChild(footer2);
		
		if(event[0]!="_"){
			document.getElementById("volunteer").appendChild(whole);
		}
		else{
			document.getElementById("inner").appendChild(whole);
		}
	}
	
	function addPlus(kind){
		var whole=document.createElement("div");
		whole.className="col-lg-3 col-md-6";
		whole.style="z-index:1";
		
		var panel=document.createElement("div");
		panel.className="panel panel-default";
		
		var panel_heading=document.createElement("div");
		panel_heading.className="panel-heading";
		
		var heading_a=document.createElement("a");
		if(kind=="志愿者"){
			heading_a.href="addVolunteerEvent.jsp";
		}
		else{
			heading_a.href="addInnerEvent.jsp";
		}
		
		var heading_a_row=document.createElement("div");
		heading_a_row.className="row";
		
		var heading_a_row_div=document.createElement("div");
		heading_a_row_div.className="col-xs-9 text-center";
		heading_a_row_div.style="width:100%;";
		
		var heading_a_row_div_i=document.createElement("i");
		heading_a_row_div_i.className="glyphicon glyphicon-plus";
		heading_a_row_div_i.style="font-size:10em;color:grey;";
		
		var panel_footer=document.createElement("div");
		panel_footer.className="panel-footer";
		panel_footer.style="text-align:center";
		
		var footer_alert=document.createElement("div");
		footer_alert.className="alert alert-default";
		
		var footer_alert_big=document.createElement("big");
		footer_alert_big.innerHTML="添加"+kind+"活动";
		footer_alert_big.style="font-weight:900";
		
		whole.appendChild(panel);
		panel.appendChild(panel_heading);
		panel.appendChild(panel_footer);
		
		panel_heading.appendChild(heading_a);
		heading_a.appendChild(heading_a_row);
		heading_a_row.appendChild(heading_a_row_div);
		heading_a_row_div.appendChild(heading_a_row_div_i);
		
		panel_footer.appendChild(footer_alert);
		footer_alert.appendChild(footer_alert_big);
		
		if(kind=="志愿者"){
			document.getElementById("volunteer").appendChild(whole);
		}
		else{
			document.getElementById("inner").appendChild(whole);
		}
	}
	
</script>
</html>