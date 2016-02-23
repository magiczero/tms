<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>常用工具</title>
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var iWidth=900; //弹出窗口的宽度
	var iHeight=600; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	
	function viewSchemeTable(type) {
		window.open ('${contextPath }/scheme-table/query-scheme/'+type,'newwindow'+type,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewDingshu() {
		window.open ('${contextPath }/scheme-table/queryDingshuScheme','newwindowDingshu','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewXuguan() {
		window.open ('${contextPath }/scheme-table/queryXuguanScheme','newwindowXuguan','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">常用工具</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>常用工具</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="javascript:viewSchemeTable(12);"><img src="${contextPath }/resources/images/i01.png"/></a><h2>定时截尾标准试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(31);"><img src="${contextPath }/resources/images/i02.png" /></a><h2>使用方风险β=10%的定时试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(32);"><img src="${contextPath }/resources/images/i02.png" /></a><h2>使用方风险β=20%的定时试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(33);"><img src="${contextPath }/resources/images/i02.png" /></a><h2>使用方风险β=30%的定时试验方案</h2></li>
    <li><a href="javascript:viewDingshu();"><img src="${contextPath }/resources/images/i03.png" /></a><h2>定数截尾标准试验方案</h2></li>
    <li><a href="javascript:viewXuguan();"><img src="${contextPath }/resources/images/i04.png" /></a><h2>序贯截尾标准试验方案</h2></li>
    </ul>
     
    </div>
    
    
    
    
    </div>


</body>
</html>