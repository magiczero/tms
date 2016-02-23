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
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	    $("#project").validate({
	    	focusCleanup:true,//clear the error message when the error element get focus again. 
	    	onkeyup:false, 
	    	errorPlacement: function(error, element) { 
	    		
	    		showErrorMesssgeDiv(error,element); 
	    	},
	    	rules : {
	    		name : {required:true, maxlength:30},
	    		productName : {required:true, maxlength:30}
	    	},
	    	messages : {
	    		name : {required:"请填写项目名称", maxlength:"最多输入{0}个字"},
	    		productName : {required:"请填写产品名称", maxlength:"最多输入{0}个字"}
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
    <li><a href="#">首页</a></li>
    <li><a href="#">添加项目</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <c:url var="addAction" value="/project/save" ></c:url>
    <form:form action="${addAction }" commandName="project">
    <ul class="forminfo">
     <li><form:label path="name">项目姓名</form:label><form:input path="name" class="dfinput"/><form:errors path="name" /><i>*</i></li>
    <li>
    	<form:label path="box.id">所属项目</form:label><div class="vocation">
		<form:select path="box.id" class="select1">
			<form:options items="${boxList }" itemValue="id" itemLabel="name"/>
		</form:select></div>
	</li>
   
    <li><form:label path="productName">产品名称</form:label><form:input path="productName" class="dfinput"/><form:errors path="productName" /><i>*</i></li>
    <li><form:label path="reliaIndex">可靠性指标</form:label><form:input path="reliaIndex" class="dfinput"/></li>
    <li><form:label path="testType">试验类型</form:label>
    	<div class="vocation"><form:select path="testType" class="select1">
    		<form:option value="1">可靠性鉴定试验</form:option>
    		<form:option value="0">可靠性验收试验</form:option> 
    	</form:select></div><form:errors path="testType" /><i>*</i></li>
    <li><form:label path="testScheme">试验方案</form:label>
    	<div class="vocation"><form:select path="testScheme" class="select1">
    		<form:option value="1">指数分布统计试验方案</form:option>
    		<form:option value="0">二项分布统计试验方案</form:option> 
    		<form:option value="2">威布尔分布试验方案</form:option>
    	</form:select></div><form:errors path="testType" /><i>*</i></li>
    <li><form:label path="testData">试验数据</form:label><form:textarea path="testData" class="textinput"/></li>
    <li><form:label path="review">评估结果</form:label><form:textarea path="review" class="textinput"/></li>
    <li><label>&nbsp;</label><form:button class="btn">保存</form:button>
    </ul>
    </form:form>
    
    </div>
</body>
</html>