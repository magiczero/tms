<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>定时试验方案简表</title>
<link href="${contextPath }/resources/css/style3.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/resources/js/jquery.js"></script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">常用工具</a></li>
    <li><a href="#">使用方风险β=${subtype }%的定时试验方案</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    
    <table class="tablelist"><caption>使用方风险β=${subtype }%的定时试验方案</caption>
    	<thead>
    	<tr>
							<th rowspan="2">方案号</th>
							<th colspan="2">判决故障数</th>
							<th rowspan="2">总试验时间</th>
							<th rowspan="2">MTBF的观测值</th>
							<th colspan="3">鉴别比d</th>
						</tr>
					<tr>
							
							<th>接收</th>
							<th>拒收</th>
							<th>α=30%</th>
							<th>α=20%</th>
							<th>α=10%</th>
						</tr>
        </thead>
        <tbody>
        <c:forEach items="${schemeTableList }" var="st">
        <tr>
        <td>${st.schemeNum }</td>
        <td>${st.receive }</td>
        <td>${st.rejection }</td>
        <td>${st.testTime }</td>
        <td>${st.mtbf }</td>
        <td>${st.productor3 }</td>
        <td>${st.productor2 }</td>
        <td>${st.productor1 }</td>
        </tr> 
        </c:forEach>
              
        </tbody>
    </table>
    
    
    </div>
     <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    

</body>
</html>