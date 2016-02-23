<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验方案</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
function del(id) {
	if(confirm('确定删除?')) {
		//window.location = 'del?projectid='+id;
		//window.parent.leftFrame.reload();
		window.parent.frames[1].location.reload();
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${project.box.name }</a></li>
    <li><a href="javascript:void(0);">${project.name }</a></li>
    <li><a href="#">试验方案管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="${contextPath }/scheme/add/${project.id}"><span><img src="${contextPath }/resources/images/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>方案名称</th>
        <th>方案类型</th>
        <th>截尾方式</th>
        
        <th>录入日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${schemeList }" var="scheme" varStatus="status">
        <tr>
        <td>${status.index + 1}</td>
        <td>${scheme.schemeName }</td>
        <td><c:choose><c:when test="${scheme.type==1 }">指数分布试验方案</c:when><c:when test="${scheme.type==0 }">二项分布试验方案</c:when><c:when test="${scheme.type==2 }">威布尔分布试验方案</c:when></c:choose></td>
        <td><c:choose><c:when test="${scheme.schemeType==1 }">定时截尾</c:when><c:when test="${scheme.schemeType==2 }">定数截尾</c:when><c:otherwise>序贯截尾</c:otherwise></c:choose></td>
        <td><fmt:formatDate value="${scheme.createTime }" pattern="yyyy-MM-dd"/></td>
        <td><a href="detail?projectid=${scheme.id }" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(${scheme.id });" class="tablelink"> 删除</a></td>
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