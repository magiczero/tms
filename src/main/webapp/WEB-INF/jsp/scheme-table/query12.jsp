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
    <li><a href="#">定时试验方案简表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							<th rowspan="3">试验时间</th>
							<th colspan="2">判决故障数</th>
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							<th >拒收</th>
							<th >接收</th>
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							<th>（≥）</th>
							<th>（≤）</th>
						</tr>
        </thead>
        <tbody>
        <c:forEach items="${schemeTableList }" var="st">
        <tr>
        <td>${st.schemeNum }</td>
        <td>${st.productor1 }</td>
        <td>${st.use1 }</td>
        <td>${st.productor2 }</td>
        <td>${st.use2 }</td>
        <td>${st.diffRatio }</td>
        <td>${st.testTime }</td>
        <td>${st.rejection }</td>
        <td>${st.receive }</td>
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