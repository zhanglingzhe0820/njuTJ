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
<body onLoad="loadArrange()">
<div class="wrapper">
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand"  style="border-right:1px solid #dddddd" href="adminArrange.jsp">南京大学天健社</a>
		</div>
		<div>
			<a class="navbar-brand" href="adminArrange.jsp">活动统计</a>
		</div>
		<div>
			<a class="navbar-brand" href="admin.jsp">管理活动</a>
		</div>
		<div>
			<a class="navbar-brand" href="index.jsp">管理员登出</a>
		</div>
	</nav>
	<div>
		<div>
			<h1>活动统计</h1>
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
					for(i=0;i<events.length;i+=8){
						if(document.getElementById(events[i]+events[i+1])){
							addTable(events[i],events[i+1],events[i+2],events[i+3],events[i+4],events[i+5],events[i+6]);
						}
						else{
							createTable(events[i],events[i+1],events[i+7],events[i+2],events[i+3],events[i+4],events[i+5],events[i+6]);
						}
					}
				}
			}
		}
		
		xml.open("GET","/njuTJ/ArrangeServlet",true);
		xml.send();
	}
	
	function addTable(event,time,name,number,qq,phone,department){
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
		var table_tbody=document.getElementById(event+time);
		table_tbody.appendChild(table_tbody_tr);
		table_tbody_tr.appendChild(table_tbody_tr_td1);
		table_tbody_tr.appendChild(table_tbody_tr_td2);
		table_tbody_tr.appendChild(table_tbody_tr_td3);
		table_tbody_tr.appendChild(table_tbody_tr_td4);
		table_tbody_tr.appendChild(table_tbody_tr_td5);
	}
	
	function createTable(event,time,realName,name,number,qq,phone,department){
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
		panel_body.append(table);
		
		//table第一段
		var table_thead=document.createElement("thead");
		var table_thead_tr=document.createElement("tr");
		var table_thead_tr_1=document.createElement("th");
		table_thead_tr_1.style="width:20%";
		table_thead_tr_1.innerHTML="姓名";
		var table_thead_tr_2=document.createElement("th");
		table_thead_tr_2.style="width:20%";
		table_thead_tr_2.innerHTML="学号";
		var table_thead_tr_3=document.createElement("th");
		table_thead_tr_3.style="width:20%";
		table_thead_tr_3.innerHTML="QQ";
		var table_thead_tr_4=document.createElement("th");
		table_thead_tr_4.style="width:20%";
		table_thead_tr_4.innerHTML="手机";
		var table_thead_tr_5=document.createElement("th");
		table_thead_tr_5.style="width:20%";
		table_thead_tr_5.innerHTML="院系";
		table.appendChild(table_thead);
		table_thead.appendChild(table_thead_tr);
		table_thead_tr.appendChild(table_thead_tr_1);
		table_thead_tr.appendChild(table_thead_tr_2);
		table_thead_tr.appendChild(table_thead_tr_3);
		table_thead_tr.appendChild(table_thead_tr_4);
		table_thead_tr.appendChild(table_thead_tr_5);
		
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
		table.appendChild(table_tbody);
		table_tbody.appendChild(table_tbody_tr);
		table_tbody_tr.appendChild(table_tbody_tr_td1);
		table_tbody_tr.appendChild(table_tbody_tr_td2);
		table_tbody_tr.appendChild(table_tbody_tr_td3);
		table_tbody_tr.appendChild(table_tbody_tr_td4);
		table_tbody_tr.appendChild(table_tbody_tr_td5);
	}
</script>
</html>