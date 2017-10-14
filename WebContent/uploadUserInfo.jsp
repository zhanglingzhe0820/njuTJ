<%@ page language="java" contentType="text/html; charset=Utf-8"
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
	
	<script src="resources/vendor/xlsxjs/xlsx.js"></script>
	
	<script src="resources/vendor/xlsxjs/jszip.js"></script>
	
	<script src="resources/vendor/xlsxjs/cpexcel.js"></script>
	
	<script src="resources/vendor/xlsxjs/xlsx.core.min.js"></script>
	
<title>南京大学天健社</title>
<style>
		#board{
			border:dashed 5px grey;
			border-radius:20px;
			-moz-border-radius:20px;
			border-radius:20px;
			-webkit-border-radius:20px;
			padding:20px;
			width:100%;
			height:25vw;
			text-align:center;
			vertical-align:middle
		}
		#board:hover{
			border:dashed 5px black;
		}
		#board:hover #plus{
			color:black;
		}
		#plus{
			margin-top:10.5%;
			width:100%;
			color:grey;
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
	<div>
		<div class="panel-body">
			<div>
				<div class="alert alert-default" style="text-align:center"><h2>上传文件</h2></div>
			</div>
			<div class="fullwidthbanner-container">
				<div class="fullwidthbanner">
					<div id="board" onclick="document.getElementById('file').click();" ondrop="setFile(event);" ondragend="dragEnd(event);" ondragover="setBoardBlack(event);" ondragenter="setBoardBlack(event);" ondragleave="setBoardGrey(event);">
						<input type="file" id="file" onchange="saveFile(this)" style="display:none">
						<i class="fa fa-plus fa-5x" id="plus"></i>
					</div>
				</div>
			</div>
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
function load(){
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

function dragEnd(event){
	event.preventDefault();
}

function setFile(event){
	event.preventDefault();
	document.getElementById("file").files=event.dataTransfer.files;
}
function setBoardBlack(event){
	event.preventDefault();
	document.getElementById("board").style="border:dashed 5px black;";
	document.getElementById("plus").style="color:black;";
}
function setBoardGrey(event){
	event.preventDefault();
	document.getElementById("board").style="border:dashed 5px grey;";
	document.getElementById("plus").style="color:grey;";
}

function saveFile(obj){
	var file=obj.files[0];
	var reader=new FileReader();
	var tempData;
	var data;
	reader.onload= function(e){
		tempData=e.target.result;
		data=XLSX.read(tempData,{
			type:'binary'
		});
		read(data.Sheets.Sheet1);
	}
	reader.readAsBinaryString(file);
}

function read(sheet){
	var result="";
	var department="理事";
	var position="社长";
	var i=3;
	while(sheet['A'+i]||sheet['B'+i]){
		if(!sheet['B'+i]){
			department=sheet['A'+i].v;
			i++;
			continue;
		}
		if(sheet['A'+i]){
			position=sheet['A'+i].v;
		}
		result+=readOneLine(sheet,department+position,i)+"@#";
		i++;
	}
	result=result.substring(0,result.length-2);
	
	//向服务器发送信息
	var xml;
	var temp;
	
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
				alert("导入成功");
			}
			else{
				alert("导入失败，请检查表格式，或稍后再试");
			}
		}
	}
	
	xml.open("POST","/njuTJ/UploadUserInfoServlet",true);
	xml.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xml.send("&userInfo="+result);
}

function readOneLine(sheet,title,line){
	var columns=['B','D','G','I','J']//添加学号列
	var result=title;
	for(var i=0;i<columns.length;i++){
		result+="|"+sheet[columns[i]+line].v;
	}
	return result;
}

</script>
</html>