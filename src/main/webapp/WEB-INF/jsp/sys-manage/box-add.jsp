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
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/select-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	    $("#box").validate({
	    	focusCleanup:true,//clear the error message when the error element get focus again. 
	    	onkeyup:false, 
	    	errorPlacement: function(error, element) { 
	    		
	    		showErrorMesssgeDiv(error,element); 
	    	},
	    	rules : {
	    		name : {required:true, maxlength:30},
	    		explain : {maxlength:30}
	    	},
	    	messages : {
	    		name : {required:"请输入名称", maxlength:"最多输入{0}个字"},
	    		explain : {maxlength:"最多输入{0}个字"}
	    	}
	    });
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
    <li><a href="#">系统管理</a></li>
    <li><a href="#">添加BOX</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <c:url var="addAction" value="/box/save" ></c:url>
    <form:form action="${addAction }" commandName="box">
    <ul class="forminfo">
    <li><form:label path="name">名称</form:label><form:input path="name" class="dfinput"/><form:errors path="name" /><i>标题不能超过30个字符</i></li>
    <li><form:label path="remark">说明</form:label><form:textarea path="remark" class="textinput"/><i>多个关键字用,隔开</i></li>
    <li><label>&nbsp;</label><form:button class="btn">保存</form:button>
    </ul>
    </form:form>
    
    </div>
</body>
</html>