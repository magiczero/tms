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
<title>部门管理</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/treeview.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.treeview.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// third example
	$("#grouptree").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		toggle: function() {
			window.console && console.log("%o was toggled", this);
		}
	});
	
	$(".select1").uedSelect({
		width : 345			  
	});
});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">工作台</a></li>
    </ul>
    </div>
    
    
    <div class="mainbox">
    
    <div class="mainleft">
    
    
    <div class="leftinfo">
    <div class="listtitle">添加新部门</div>
    <div style="height:15px;"></div>
        <c:url var="addAction" value="/group/save" ></c:url>
    <form:form action="${addAction }" commandName="group">
    <ul class="forminfo">
    <li><form:label path="groupName">部门名称</form:label><form:input path="groupName" class="dfinput"/><form:errors path="groupName" /><i>标题不能超过30个字符</i></li>
    <li><form:label path="parentGroup.id">上级部门</form:label>
    	<div class="vocation"><form:select path="parentGroup.id" class="select1">
    		<form:option value="">无</form:option> 
    		<c:forEach items="${groupList }" var="group">
    		<form:option value="${group.id }">&nbsp;&nbsp;${group.groupName }</form:option>
    		<c:if test="${not empty group.child }">
	    	<c:forEach items="${group.child }" var="child1">
	    	<form:option value="${child1.id }">&nbsp;&nbsp;&nbsp;&nbsp;|---${child1.groupName }</form:option>
	    	</c:forEach>
	    	</c:if>
    		</c:forEach>
    	</form:select></div><i>*</i></li>
    <li><form:label path="explain">说明（备注）</form:label>
    <form:textarea path="explain" class="textinput"/>
    </li>
    <li><label>&nbsp;</label><form:button class="btn">保存</form:button>
    </ul>
    </form:form>
    <div class="maintj">  
    </div>
    
    </div>
    <!--leftinfo end-->
    
    
    <div class="leftinfos">
    
   
    <div class="infoleft">
    
    <div class="listtitle"><a href="#" class="more1">更多</a>待办事项</div>    
    <ul class="newlist">
    <li><a href="#">上海自贸区今日正式挂牌成立</a><b>10-09</b></li>
    <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a><b>10-08</b></li>
    <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a><b>10-09</b></li>
    <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a><b>10-06</b></li>
    <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a><b>10-05</b></li>
    <li><a href="#">中央巡视组：重庆对一把手监督不到位</a><b>10-04</b></li>
    <li><a href="#">囧!悍马没改好成华丽马车(图)</a><b>10-03</b></li>
    </ul>   
    
    </div>
    
    
    <div class="inforight">
    <div class="listtitle"><a href="#" class="more1">添加</a>常用工具</div>
    <!-- 
    <ul class="tooli">
    <li><span><img src="images/d01.png" /></span><p><a href="#">信息资料</a></p></li>
    <li><span><img src="images/d02.png" /></span><p><a href="#">编辑</a></p></li>
    <li><span><img src="images/d03.png" /></span><p><a href="#">记事本</a></p></li>
    <li><span><img src="images/d04.png" /></span><p><a href="#">任务日历</a></p></li>
    <li><span><img src="images/d05.png" /></span><p><a href="#">图片管理</a></p></li>
    <li><span><img src="images/d06.png" /></span><p><a href="#">交易</a></p></li>
    <li><span><img src="images/d07.png" /></span><p><a href="#">档案袋</a></p></li>    
    </ul>
    -->
    </div>
    
    
    </div>
    
    
    </div>
    <!--mainleft end-->
    
    
    <div class="mainright">
    
    
    <div class="dflist">
    <div class="listtitle">部门列表</div>    
    <!-- <ul class="newlist">
    <li><a href="#">上海自贸区今日正式挂牌成立</a></li>
    <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a></li>
    <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a></li>
    <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a></li>
    <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a></li>
    <li><a href="#">中央巡视组：重庆对一把手监督不到位</a></li>
    <li><a href="#">囧!悍马没改好成华丽马车(图)</a></li>
    <li><a href="#">澳门黄金周加派稽查人员监察出租车违规行为</a></li>
    <li><a href="#">香港环境局长吁民众支持政府扩建堆填区</a></li> 
    </ul> -->
    <ul id="grouptree" class="treeview-red">
    	<c:forEach items="${groupList }" var="group">
    	<li><span>${group.groupName }</span>
    	<c:if test="${not empty group.child }">
    	<ul>
    	<c:forEach items="${group.child }" var="child1">
    	<li><span>${child1.groupName }</span></li>
    	</c:forEach>
    	</ul>
    	</c:if>
    	</li>
    	</c:forEach>
    </ul>        
    </div>
    
    
    <div class="dflist1">
    <div class="listtitle"><a href="#" class="more1">更多</a>信息统计</div>    
    <ul class="newlist">
    <li><i>会员数：</a></i>2535462</li>
    <li><i>文档数：</a></i>5546</li>
    <li><i>普通文章：</a></i>2315</li>
    <li><i>软件：</a></i>1585</li>
    <li><i>评论数：</a></i>5342</li>    
    </ul>        
    </div>
    
    

    
    
    </div>
    <!--mainright end-->
    
    
    </div>



</body>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>