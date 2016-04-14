<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		window.location = '${contextPath}/assessment/del/'+id;
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
        <li><a href="${contextPath }/assessment/init-add/${project.id}"><span><img src="${contextPath }/resources/images/t01.png" /></span>添加</a></li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>评估名称</th>
        <th>样本量</th>
        <th>试验总时间</th>
        <th>失效数</th>
        <th>评估值点估计</th>
        <th>置信水平</th>
        <th>置信上限</th>
        <th>置信下限</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${assessList }" var="assessment" varStatus="status">
        <tr>
        <td>${status.index + 1}</td>
        <td>${assessment.name }</td>
        <td>${assessment.sampleSize }</td>
        <td>${assessment.totalTime}</td>
        <td>${assessment.faultNum }</td>
        <td>${assessment.point }</td>
        <td>${assessment.fiducial }</td>
        <td>${assessment.fiducialUpper }</td>
        <td>${assessment.fiducialLower }</td>
        <td><a href="${contextPath}/assessment/edit/${assessment.id }" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(${assessment.id });" class="tablelink"> 删除</a></td>
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