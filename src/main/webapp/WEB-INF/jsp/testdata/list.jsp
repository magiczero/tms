<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验数据列表</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
function del(id) {
	if(confirm('确定删除?')) {
		window.location = '${contextPath}/testdata/del/'+id;
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
    <li><a href="#">试验数据列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="${contextPath }/testdata/init-add/${project.id}"><span><img src="${contextPath }/resources/images/t01.png" /></span>添加</a></li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>试验数据名称</th>
        <th>故障名称</th>
        <th>发生时间</th>
        <th>故障现象</th>
        <th>故障原因</th>
        <th>解决措施</th>
        <th>故障类型</th>
        <th>日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dataList }" var="testdata" varStatus="status">
        <tr>
        <td>${status.index + 1}</td>
        <td>${testdata.dataName }</td>
        <td>${testdata.faultName }</td>
        <td>${fn:substring(testdata.faultWhile,0,10)}</td>
        <td>${testdata.phenomenon }</td>
        <td>${testdata.failureCause }</td>
        <td>${testdata.solutions }</td>
        <td>
        	<c:choose>
        		<c:when test="${testdata.faultType==1 }">AB</c:when>
        		<c:when test="${testdata.faultType==2 }">ANB</c:when>
        		<c:when test="${testdata.faultType==3 }">NAB</c:when>
        		<c:when test="${testdata.faultType==1 }">NANB</c:when>
        		<c:otherwise>AC</c:otherwise>
        	</c:choose>
        </td>
        <td><fmt:formatDate value="${testdata.createTime }" pattern="yyyy-MM-dd"/></td>
        <td><a href="${contextPath}/testdata/edit/${testdata.id }" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(${testdata.id });" class="tablelink"> 删除</a></td>
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