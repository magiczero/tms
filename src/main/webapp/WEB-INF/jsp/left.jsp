<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/treeview.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.treeview.js"></script>

<script type="text/javascript">
$(function(){	
	$("#projecttree").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		toggle: function() {
			window.console && console.log("%o was toggled", this);
		}
	});
})	
</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>项目列表</div>
    <ul id="projecttree" class="filetree">
    <c:forEach items="${boxList }" var="box">
    
        <li><span class="folder">&nbsp;<a href="index.html" target="rightFrame">${box.name }</a></span>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <c:if test="${not empty box.projects }">
        	<ul>
        		<c:forEach items="${box.projects }" var="project">
        		<li><span class="folder">&nbsp;&nbsp;<a href="index.html" target="rightFrame">${project.name }</a></span>
        		<ul>
        		<li><span class="folder">&nbsp;<a href="${contextPath }/scheme/list/${project.id }" target="rightFrame">试验方案设计</a></span>
        		<c:if test="${not empty project.schemes }">
        			<ul>
        			<c:forEach items="${project.schemes }" var="scheme">
        			<li><span class="file">&nbsp;<a href="index.html" target="rightFrame">${scheme.schemeName }</a></span>
        			</li>
        			</c:forEach>
        			</ul>
        			</c:if>
        		</li>
        		
        		<li><span class="folder">&nbsp;<a href="index.html" target="rightFrame">试验数据管理</a></span>
        		<c:if test="${not empty project.datas }">
        			<ul>
        			<c:forEach items="${project.datas }" var="testdata">
        			<li><span class="file">&nbsp;<a href="index.html" target="rightFrame">${testdata.dataName }</a></span>
        			</li>
        			</c:forEach>
        			</ul></c:if>
        		</li>
        		
        		
        		<li><span class="folder">&nbsp;<a href="index.html" target="rightFrame">可靠性评估</a></span>
        		<c:if test="${not empty project.assessments }">
        			<ul>
        			<c:forEach items="${project.assessments }" var="assessment">
        			<li><span class="file">&nbsp;<a href="index.html" target="rightFrame">${assessment.name }</a></span>
        			</li>
        			</c:forEach>
        			</ul></c:if>
        		</li>
        		
				</ul>
        		</li>
        		</c:forEach>
        	</ul>
        </c:if>
        </sec:authorize>
        <sec:authorize access="!hasRole('ROLE_ADMIN')">
        <ul>
        <c:forEach items="${projectList }" var="project1">
        <c:if test="${project1.box.id == box.id }">
        <li><span><a href="index.html" target="rightFrame">${project1.name }</a></span>
        		</li></c:if>
        </c:forEach></ul>
        </sec:authorize>
        </li>
    </c:forEach>
        </ul> 
    
</body>
</html>