<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/select.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/tip-darkgray/tip-darkgray.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	    /*$("#user").validate({
	    	focusCleanup:true,//clear the error message when the error element get focus again. 
	    	onkeyup:false, 
	    	errorPlacement: function(error, element) { 
	    		
	    		showErrorMesssgeDiv(error,element); 
	    	},
	    	rules : {
	    		username : "required",
	    		realname : "required"
	    	},
	    	messages : {
	    		username : "请输入用户名",
	    		realname : "必填项"
	    	}
	    });*/
    $(".select1").uedSelect({
		width : 345			  
	});
    
    $(":text").each(function(index, element) {

	    $(element).poshytip({
	    	className: 'tip-darkgray',
	    	content: 'Hey, there! This is a tooltip.',
	    	showOn: 'none',
	    	alignTo: 'target',
	    	alignX: 'inner-left',
	    	offsetX: 0,
	    	offsetY: 5,
	    	showTimeout: 100
	    });
    });
    
});

function showErrorMesssgeDiv(error,element){
	element.poshytip('update',error);
	element.poshytip('show');
	element.poshytip('hideDelayed',5000);
}
</script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <c:url var="addAction" value="/user/save" ></c:url>
    <form:form action="${addAction }" commandName="user">
    <ul class="forminfo">
    <li><form:label path="username">用户名</form:label><form:input path="username" class="dfinput"/><form:errors path="username" /><i>标题不能超过30个字符</i></li>
    <li><form:label path="realname">真实姓名</form:label><form:input path="realname" class="dfinput"/><form:errors path="realname" /><i>*</i></li>
    <li><form:label path="password">密码</form:label><form:password path="password" class="dfinput"/><form:errors path="password" /><i>*</i></li>
    <li><label for="password2">确认密码</label><input type="password" name="password2" class="dfinput"/></li>
    <li><label>性别</label><cite><input name="" type="radio" value="" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="radio" value="" />女</cite></li>
    <li><form:label path="role">角色</form:label>
    	<div class="vocation"><form:select path="role" class="select1">
    		<form:option value="ROLE_ADMIN">ROLE_ADMIN</form:option>
    		<form:option value="ROLE_USER">ROLE_USER</form:option> 
    	</form:select></div><form:errors path="role" /><i>*</i></li>
    <li><form:label path="group.id">部门</form:label>
    	<div class="vocation"><form:select path="group.id" class="select1">
    		<!--<form:options items="${groupList }" itemValue="id" itemLabel="groupName"/>-->
    		<c:forEach items="${groupList }" var="group">
    		<form:option value="${group.id }">&nbsp;&nbsp;${group.groupName }</form:option>
    		<c:if test="${not empty group.child }">
	    	<c:forEach items="${group.child }" var="child1">
	    	<form:option value="${child1.id }">&nbsp;&nbsp;&nbsp;&nbsp;|---${child1.groupName }</form:option>
	    	</c:forEach>
	    	</c:if>
    		</c:forEach>  
    	</form:select></div><i>*</i></li>
    <li><form:label path="duty">职务</form:label><form:input path="duty" class="dfinput"/><i>多个关键字用,隔开</i></li>
    <li><label>&nbsp;</label><form:button class="btn">保存</form:button>
    </ul>
    </form:form>
    
    </div>
</body>
</html>