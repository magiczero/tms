<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
		if(this.textContent=="系统设置") {
			window.parent.frames[1].location="${contextPath}/sys/left";
		} else if(this.textContent=="工作台" || this.textContent=="常用工具") {
			window.parent.frames[1].location="${contextPath}/left";
		}
	})	
	
	currentDate();
})	
/**获得当前日期**/
		function  currentDate(){
			var time = new Date();
			var myYear = time.getFullYear();
			var myMonth = time.getMonth()+1;
			var myDay = time.getDate();
			if(myMonth < 10){
				myMonth = "0" + myMonth;
			}
			//document.getElementById("yue_fen").innerHTML =  myYear + "." + myMonth;
			document.getElementById("day_day").innerHTML =  myYear + "." + myMonth + "." + myDay;
		}
</script>
</head>
<body style="background:url(<%=request.getContextPath() %>/resources/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img src="<%=request.getContextPath() %>/resources/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="${contextPath }/project/list" target="rightFrame" class="selected"><img src="${contextPath}/resources/images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="${contextPath}/resources/images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="${contextPath}/resources/images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="${contextPath}/tools"  target="rightFrame"><img src="${contextPath}/resources/images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="${contextPath}/resources/images/icon05.png" title="文件管理" onclick="abc();" /><h2>文件管理</h2></a></li>
    <li><a href="${contextPath}/user/list"  target="rightFrame"><img src="${contextPath}/resources/images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><a href="javascript:void(0);" id="day_day">关于</a></li>
    <li><a href="${contextPath }/logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><sec:authentication property="name"/></span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>

</body>
</html>