<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404</title>
<link href="${contextPath}/resources/css/error_404.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>

<script type="text/javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script> 
</head>

<body style="background:#edf6fa;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">页面不存在</a></li>
    </ul>
    </div>
    
    <div class="error">
    
    <h2>非常遗憾，您访问的页面不存在！</h2>
    <p>看到这个提示，就自认倒霉吧!</p>
    <!--<div class="reindex"><a href="main.html" target="_parent">è¿åé¦é¡µ</a></div>-->
    
    </div>


</body>
</html>