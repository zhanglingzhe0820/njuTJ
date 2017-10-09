<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body onLoad="loadArrange()">
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
	<div>
		<div>
			<h1>活动统计</h1>
			<hr>
		</div>
	</div>
	
	<div>
		<div style="text-align:center">
           	<h3>时长搜索</h3>
        </div>
        <div>
        	<input id="searchText" class="form-control" placeholder="学号或姓名" name="username" type="text" value="" oninput="search();"/>
        </div>
        <hr>
	</div>
	
	<div id="search">
		<div class="panel panel-info">
			<div class="panel-heading">搜索结果</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="searchTable" style="width: 100%;">
					<thead>
						<tr>
							<th style="width: 18%;">姓名</th>
							<th style="width: 18%;">学号</th>
							<th style="width: 54%;">活动</th>
							<th style="width: 10%;">时长</th>
						</tr>
					</thead>
					<tbody id="searchResult">
					</tbody>
				</table>
			</div>
			<div class="panel-footer" style="text-align: right;" id="totalLength">总时长：0.0</div>
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
			Version 0.1.1<br>
		</small>
		<small>
			@Powered by Surevil & NJU TJ
		</small>
	</p>
</div>
</body>
<script>
	function search(){
		var i=0;
		clearChild();
		var condition=document.getElementById("searchText").value;
		var allTbodyTags=document.getElementsByTagName("tbody");
		for(i=0;i<allTbodyTags.length;i++){
			if(allTbodyTags[i].id!="searchResult"){
				var trs=allTbodyTags[i].getElementsByTagName("tr");
				for(var j=0;j<trs.length;j++){
					var cells=trs[j].cells;
					for(var k=0;k<cells.length;k++){
						if(cells[k].innerHTML.indexOf(condition)==-1?false:true){
							var name=cells[0].innerHTML;
							var number=cells[1].innerHTML;
							var event=allTbodyTags[i].parentNode.parentNode.parentNode.getElementsByClassName("panel-heading")[0].innerHTML;
							var timeLength=cells[5].innerHTML;
							addSearchResult(name,number,event,timeLength);
							break;
						}
					}
				}
			}
		}
		if(condition==""){
			clearChild();
		}
		setTotalLength();
	}
	
	function clearChild(){
		var toRemove=document.getElementById("searchResult");
		toRemove.parentNode.removeChild(toRemove);
		var tbody=document.createElement("tbody");
		tbody.id="searchResult";
		document.getElementById("searchTable").appendChild(tbody);
	}
	
	function setTotalLength(){
		var searchBody=document.getElementById("searchResult");
		var count=0.0;
		var trs=searchBody.getElementsByTagName("tr");
		if(trs!=null&&trs.length!=0){
			for(var j=0;j<trs.length;j++){
				count+=parseFloat(trs[j].cells[3].innerHTML);
			}
		}
		document.getElementById("totalLength").innerHTML="总时长:"+count;
	}
	
	function addSearchResult(name,number,event,timeLength){
		var table_tbody_tr=document.createElement("tr");
		var table_tbody_tr_td1=document.createElement("td");
		table_tbody_tr_td1.innerHTML=name;
		var table_tbody_tr_td2=document.createElement("td");
		table_tbody_tr_td2.innerHTML=number;
		var table_tbody_tr_td3=document.createElement("td");
		table_tbody_tr_td3.innerHTML=event;
		var table_tbody_tr_td4=document.createElement("td");
		table_tbody_tr_td4.innerHTML=timeLength;
		var table_tbody=document.getElementById("searchResult");
		table_tbody.appendChild(table_tbody_tr);
		table_tbody_tr.appendChild(table_tbody_tr_td1);
		table_tbody_tr.appendChild(table_tbody_tr_td2);
		table_tbody_tr.appendChild(table_tbody_tr_td3);
		table_tbody_tr.appendChild(table_tbody_tr_td4);
	}
	
	function loadArrange(){
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
					for(i=0;i<events.length;i+=9){
						if(document.getElementById(events[i]+events[i+1])){
							addTable(events[i],events[i+1],events[i+2],events[i+3],events[i+4],events[i+5],events[i+6],events[i+7]);
						}
						else{
							createTable(events[i],events[i+1],events[i+8],events[i+2],events[i+3],events[i+4],events[i+5],events[i+6],events[i+7]);
						}
					}
				}
			}
		}
		
		xml.open("GET","/njuTJ/ArrangeServlet",true);
		xml.send();
		
	}
	
	function addTable(event,time,name,number,qq,phone,department,timeLength){
		var table_tbody_tr=document.createElement("tr");
		var table_tbody_tr_td1=document.createElement("td");
		table_tbody_tr_td1.innerHTML=name;
		var table_tbody_tr_td2=document.createElement("td");
		table_tbody_tr_td2.innerHTML=number;
		var table_tbody_tr_td3=document.createElement("td");
		table_tbody_tr_td3.innerHTML=qq;
		var table_tbody_tr_td4=document.createElement("td");
		table_tbody_tr_td4.innerHTML=phone;
		var table_tbody_tr_td5=document.createElement("td");
		table_tbody_tr_td5.innerHTML=department;
		var table_tbody_tr_td6=document.createElement("td");
		table_tbody_tr_td6.innerHTML=timeLength;
		var table_tbody=document.getElementById(event+time);
		table_tbody.appendChild(table_tbody_tr);
		table_tbody_tr.appendChild(table_tbody_tr_td1);
		table_tbody_tr.appendChild(table_tbody_tr_td2);
		table_tbody_tr.appendChild(table_tbody_tr_td3);
		table_tbody_tr.appendChild(table_tbody_tr_td4);
		table_tbody_tr.appendChild(table_tbody_tr_td5);
		table_tbody_tr.appendChild(table_tbody_tr_td6);
	}
	
	function createTable(event,time,realName,name,number,qq,phone,department,timeLength){
		var panel=document.createElement("div");
		panel.className="panel panel-info";
		var panel_body=document.createElement("div");
		panel_body.className="panel-body";
		var panel_heading=document.createElement("div");
		panel_heading.className="panel-heading";
		panel_heading.innerHTML=realName+":第 "+time+" 次";
		var panel_footer=document.createElement("div");
		panel_footer.className="panel-footer";
		panel_footer.style="text-align:right";
		panel_footer.innerHTML="服务社会，奉献爱心，推己及人，薪火相传";
		
		panel.appendChild(panel_heading);
		panel.appendChild(panel_body);
		panel.appendChild(panel_footer);
		
		if(event[0]!="_"){
			document.getElementById("volunteer").appendChild(panel);
		}
		else{
			document.getElementById("inner").appendChild(panel);
		}
		
		var table=document.createElement("table");
		table.className="table table-striped table-bordered table-hover dataTable no-footer dtr-inline";
		table.style="width:100%";
		panel_body.appendChild(table);
		
		//table第一段
		var table_thead=document.createElement("thead");
		var table_thead_tr=document.createElement("tr");
		var table_thead_tr_1=document.createElement("th");
		table_thead_tr_1.style="width:18%";
		table_thead_tr_1.innerHTML="姓名";
		var table_thead_tr_2=document.createElement("th");
		table_thead_tr_2.style="width:18%";
		table_thead_tr_2.innerHTML="学号";
		var table_thead_tr_3=document.createElement("th");
		table_thead_tr_3.style="width:18%";
		table_thead_tr_3.innerHTML="QQ";
		var table_thead_tr_4=document.createElement("th");
		table_thead_tr_4.style="width:18%";
		table_thead_tr_4.innerHTML="手机";
		var table_thead_tr_5=document.createElement("th");
		table_thead_tr_5.style="width:18%";
		table_thead_tr_5.innerHTML="院系";
		var table_thead_tr_6=document.createElement("th");
		table_thead_tr_6.style="width:10%";
		table_thead_tr_6.innerHTML="时长";
		table.appendChild(table_thead);
		table_thead.appendChild(table_thead_tr);
		table_thead_tr.appendChild(table_thead_tr_1);
		table_thead_tr.appendChild(table_thead_tr_2);
		table_thead_tr.appendChild(table_thead_tr_3);
		table_thead_tr.appendChild(table_thead_tr_4);
		table_thead_tr.appendChild(table_thead_tr_5);
		table_thead_tr.appendChild(table_thead_tr_6);
		
		//table第二段
		var table_tbody=document.createElement("tbody");
		table_tbody.id=event+time;
		var table_tbody_tr=document.createElement("tr");
		var table_tbody_tr_td1=document.createElement("td");
		table_tbody_tr_td1.innerHTML=name;
		var table_tbody_tr_td2=document.createElement("td");
		table_tbody_tr_td2.innerHTML=number;
		var table_tbody_tr_td3=document.createElement("td");
		table_tbody_tr_td3.innerHTML=qq;
		var table_tbody_tr_td4=document.createElement("td");
		table_tbody_tr_td4.innerHTML=phone;
		var table_tbody_tr_td5=document.createElement("td");
		table_tbody_tr_td5.innerHTML=department;
		var table_tbody_tr_td6=document.createElement("td");
		table_tbody_tr_td6.innerHTML=timeLength;
		table.appendChild(table_tbody);
		table_tbody.appendChild(table_tbody_tr);
		table_tbody_tr.appendChild(table_tbody_tr_td1);
		table_tbody_tr.appendChild(table_tbody_tr_td2);
		table_tbody_tr.appendChild(table_tbody_tr_td3);
		table_tbody_tr.appendChild(table_tbody_tr_td4);
		table_tbody_tr.appendChild(table_tbody_tr_td5);
		table_tbody_tr.appendChild(table_tbody_tr_td6);
		
	}
</script>
</html>