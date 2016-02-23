<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目列表</title>
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
    <li><a href="javascript:void(0);">项目管理</a></li>
    <li><a href="#">试验项目列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="${contextPath }/project/init-add"><span><img src="${contextPath }/resources/images/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>试验项目名称</th>
        <th>试验对象</th>
        <th>可靠性指标</th>
        <th>试验类型</th>
        <th>试验方案</th>
        <th>试验数据</th>
        <th>评估结果</th>
        <th>日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectList }" var="project" varStatus="status">
        <tr>
        <td>${status.index + 1}</td>
        <td>${project.name }</td>
        <td>${project.productName }</td>
        <td>${project.reliaIndex }</td>
        <td><c:if test="${project.testType }">可靠性鉴定试验</c:if><c:if test="${!project.testType }">可靠性验收试验</c:if></td>
        <td>
        <c:choose><c:when test="${projectScheme==1 }">指数分布试验方案</c:when><c:when test="${projectScheme==0 }">二项分布试验方案</c:when><c:when test="${projectScheme==2 }">威布尔分布试验方案</c:when></c:choose>
        </td>
        <td>${project.testData }</td>
        <td>${project.review }</td>
        <td><fmt:formatDate value="${project.createTime }" pattern="yyyy-MM-dd"/></td>
        <td><a href="detail?projectid=${project.id }" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(${project.id });" class="tablelink"> 删除</a></td>
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