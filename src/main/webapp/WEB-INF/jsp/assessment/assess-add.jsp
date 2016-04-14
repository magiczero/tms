<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加可靠性评估</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/tip-darkgray/tip-darkgray.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#assessment").validate({
    	focusCleanup:true,//clear the error message when the error element get focus again. 
    	onkeyup:false, 
    	errorPlacement: function(error, element) { 
    		showErrorMesssgeDiv(error,element); 
    	},
    	rules : {
    		name : {required:true, maxlength:50},
    		sampleSize : {required:true, digits : true},
    		totalTime : {required:true, number:true},
    		faultNum : {digits:true},
    		fiducialUpper : {digits:true},
    		fiducialLower : {digits:true}
    	},
    	messages : {
    		name : {
    			required : "请输入评估名称",
    			maxlength : "不能超过 {0}个字"},
    		sampleSize : {required:"请输入样本量", digits:"请输入整数"},
    		totalTime : {required:"请输入试验总时间", number:"请输入数字"},
    		faultNum : {number:"请输入数字"},
    		fiducialUpper : {digits:"请输入数字"},
    		fiducialLower : {digits:"请输入数字"}
    	}
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
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${project.box.name }</a></li>
    <li><a href="javascript:void(0);">${project.name }</a></li>
    <li><a href="#">可靠性评估</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
     <c:url var="addAction" value="/assessment/save" ></c:url>
    <form:form action="${addAction }" commandName="assessment">
    <form:hidden path="project.id" value="${project.id }"/>
    <form:hidden path="id"/>
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><form:label class="title" path="name">评估名称<b>*</b></form:label><form:input path="name" class="dfinput"/><form:errors path="name"></form:errors><i>不能超过50个字</i></li>
    <li><form:label class="title" path="sampleSize">样本量<b>*</b></form:label><form:input path="sampleSize" class="dfinput"/><i>请填入数字</i></li>
    <li><form:label class="title" path="totalTime">试验总时间<b>*</b></form:label><form:input path="totalTime" class="dfinput"/><i>请填入数字</i></li>
    <li><form:label class="title" path="faultNum">失效数</form:label><form:input path="faultNum" class="dfinput"/><i>请填入数字</i></li>
	<li><form:label class="title" path="point">评估值点估计</form:label><form:input path="point" class="dfinput"/>	<i>不能超过50个字</i></li>
    <li><form:label class="title" path="fiducial">置信水平</form:label><form:input path="fiducial" class="dfinput"/><i>不能超过50个字</i></li>
    <li><form:label class="title" path="fiducialUpper">置信上限</form:label><form:input path="fiducialUpper" class="dfinput"/><i>请填入数字</i></li>
    <li><form:label class="title" path="fiducialLower">置信下限</form:label><form:input path="fiducialLower" class="dfinput"/><i>请填入数字</i></li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </form:form>
    </div>
    

</body>

</html>
