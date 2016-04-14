<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验数据列表</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/select.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/tip-darkgray/tip-darkgray.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/select-ui.min.js"></script>
<script src="${contextPath}/resources/js/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#testdata").validate({
    	focusCleanup:true,//clear the error message when the error element get focus again. 
    	onkeyup:false, 
    	errorPlacement: function(error, element) { 
    		showErrorMesssgeDiv(error,element); 
    	},
    	rules : {
    		dataName : {required:true, maxlength:50},
    		faultName : {required:true, maxlength : 20},
    		faultWhile : {required:true}
    	},
    	messages : {
    		dataName : {
    			required : "请输入项目名称",
    			maxlength : "不能超过 {0}个字"},
    		faultName : {required:"请输入故障名称",maxlength:"不能超过 {0}个字"},
    		faultWhile : {required:"请输入故障时间"}
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
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${project.box.name }</a></li>
    <li><a href="javascript:void(0);">${project.name }</a></li>
    <li><a href="#">试验数据管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
     <c:url var="addAction" value="/testdata/save" ></c:url>
    <form:form action="${addAction }" commandName="testdata">
    <form:hidden path="project.id" value="${project.id }"/>
    <form:hidden path="id"/>
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><form:label class="title" path="dataName">试验数据名称<b>*</b></form:label><form:input path="dataName" class="dfinput"/><form:errors path="dataName"></form:errors><i>不能超过50个字</i></li>
    <li><form:label class="title" path="faultName">故障名称<b>*</b></form:label><form:input path="faultName" class="dfinput"/><i>不能超过20个字</i></li>
    <li><form:label class="title" path="faultWhile">故障发生时间<b>*</b></form:label><form:input readonly="true" path="faultWhile" onclick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss'})" class="dfinput"/></li>
    <li><form:label class="title" path="phenomenon">故障现象</form:label><form:input path="phenomenon" class="dfinput"/><i>不能超过50个字</i></li>
	<li><form:label class="title" path="failureCause">故障原因</form:label><form:input path="failureCause" class="dfinput"/>	<i>不能超过50个字</i></li>
    <li><form:label class="title" path="solutions">解决措施</form:label><form:input path="solutions" class="dfinput"/><i>不能超过50个字</i></li>
    <li><form:label class="title" path="faultType">故障类型</form:label>
	    <div class="vocation">
		    <form:select path="faultType" class="select1">
		    	<form:option value="1">AB</form:option>
		    	<form:option value="2">ANB</form:option>
		    	<form:option value="3">NAB</form:option>
		    	<form:option value="4">NANB</form:option>
		    	<form:option value="5">AC</form:option>
		    </form:select>
	    </div>
	</li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </form:form>
    </div>
    

</body>

</html>
