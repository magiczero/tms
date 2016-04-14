<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验方案设计</title>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/tip-darkgray/tip-darkgray.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.poshytip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#dingshu").hide();
    $('#dingshi').show();
    $('#xuguan').hide();
    
    $('#type').change(function(){
    	var $seltype = $('#schemeType').children('option:selected').val();
    	var $sel = $(this).children('option:selected').val();
    	selectChange($sel, $seltype);
    });
    
    $('#schemeType').change(function(){						//选择事件
		var $sel = $('#type').children('option:selected').val();
		var $seltype = $(this).children('option:selected').val();
		selectChange($sel, $seltype);
    });
    
    $("#scheme").validate({
    	focusCleanup:true,//clear the error message when the error element get focus again. 
    	onkeyup:false, 
    	errorPlacement: function(error, element) { 
    		
    		showErrorMesssgeDiv(error,element); 
    	}, 
    	rules : {
    		schemeName : {required:true, maxlength:50},
    		type : "required",
    		schemeType : "required",
    		sampleSize : "digits",
    		totalTime : {required:true,digits:true},
    		lowerLimit : {required:true, number:true},
    		producerRisk : {required:true,number : true, range : [1,50]},
    		useRisk : {required:true, number:true},
    		ratio : {number : true, range : [1,5]}
    	},
    	messages : {
    		schemeName : {
    			required : "请输入方案名称",
    			maxlength : "不能超过 {0}个字"},
    		type : "请选择方案类型",
    		schemeType : "请选择截尾方式",
    		sampleSize : "请填入整数",
    		totalTime : {required:"请填入内容", digits:"请填入整数"},
    		lowerLimit : {required:"请填入内容", number:"请填入数字"},
    		producerRisk : {required:"请填入内容",number:"请填入数字", range:"请填入{0}到{1}之间的数"},
    		useRisk : {required:"请填入内容", number:"请填入数字"},
    		ratio : {number:"请填入数字", range:"请填入{0}到{1}之间的数"}
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
})

//---------------document.ready end---------------//

function showErrorMesssgeDiv(error,element){
    	element.poshytip('update',error);
    	element.poshytip('show');
    	element.poshytip('hideDelayed',5000);
    }

    // sel1 ===== 方案类型     1、指数分布     2、二项分布     3、威布尔
    // sel2 ===== 截尾方式     1、定时截尾     2、定数截尾     3、序贯截尾
    //
    function selectChange(sel1, sel2) {
    	console.log(sel1+'+'+sel2);
    	var $txt1 = '';
		var $txt2 = '';
		var $txt3 = '';
		
		if(sel1 == 1) {
			
			if(sel2==1){
				//试验总时间T
				$('#totalTimeTd').html('');
				$('#totalTimeTd').append('<input type="text" name="totalTime" value="" id="totalTime"/>');
				$('#totalTimeLabelTd').html('');
				$('#totalTimeLabelTd').append('<label for="totalTime" id="totalTimeLabel">总试验时间T</label>');
	    		
	    		$txt1 = $('<input type="text" name="producerRisk" value="10" id="producerRisk"/>');
	    		$txt2 = $('<input type="text" name="useRisk" value="" id="useRisk"/>');
	    		$txt3 = $('<input type="text" name="ratio" value="3.0" id="ratio"/>');
	    		
	    		$('#dingshi').show();
				$('#dingshu').hide();
				$('#xuguan').hide();
	    	} else if(sel2 == 2){
	    		//truncTime 截尾数
	    		$('#totalTimeTd').html('');
	    		$('#totalTimeTd').append('<input type="text" name="truncTime" value="" id="truncTime"/>');
	    		$('#totalTimeLabelTd').html('');
	    		$('#totalTimeLabelTd').append('<label for="truncTime" id="totalTimeLabel">截尾数r</label>');
	    		
	    		$txt1 = $('<select id="producerRisk" name="producerRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt2 = $('<select id="useRisk" name="useRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt3 = $('<select id="ratio" name="ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2">2</option><option value="3">3</option><option value="5">5</option><option value="10">10</option></select>');
	    		
	    		$('#dingshu').show();
				$('#dingshi').hide();
				$('#xuguan').hide();
	    	} else if(sel2 == 3) {		//序贯截尾
	    		if($('#totalTime')) $('#totalTime').remove();
	    		if($('#truncTime')) $('#truncTime').remove();
	    		if($('#totalTimeLabel')) $('#totalTimeLabel').remove();
	    		$('#totalTimeTd').append('&nbsp;');
	    		$('#totalTimeLabelTd').append('&nbsp;');
	    		
	    		$txt1 = $('<select id="producerRisk" name="producerRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt2 = $('<select id="useRisk" name="useRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt3 = $('<select id="ratio" name="ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2.0">2</option><option value="3.0">3</option></select>');
	    		
	    		$('#dingshu').hide();
				$('#dingshi').hide();
				$('#xuguan').show();
	    	}
			
			$('#producerRisk').remove();
			$('#producerRiskTd').append($txt1);
			$('#useRisk').remove();
			$('#useRiskTd').append($txt2);
			$('#ratio').remove();
			$('#ratioTd').append($txt3);
		} else if(sel1 == 2) {			//二项分布
			if(sel2==2){	//定数结尾
				$txt1 = $('<input type="text" name="producerRisk" value="" id="producerRisk"/>');
	    		$txt2 = $('<input type="text" name="useRisk" value="" id="useRisk"/>');
				$txt3 = $('<input type="text" name="ratio" size="10" id="ratio"/>');
				
				$('#producerRisk').remove();
				$('#producerRiskTd').append($txt1);
				$('#useRisk').remove();
				$('#useRiskTd').append($txt2);
				$('#ratio').remove();
				$('#ratioTd').append($txt3);
			} else if(sel2 == 3){		//序贯截尾
				$('#totalTimeLabelTd').html('');
				$('#totalTimeTd').html('');
				$('#lowerLimitTd').html('');
				$('#lowerLimitTd').append($('<select id="lowerLimit" name="lowerLimit" class="valid"><option value="0.8">0.8</option><option value="0.85">0.85</option><option value="0.9">0.9</option><option value="0.91">0.91</option><option value="0.91">0.91</option><option value="0.92">0.92</option><option value="0.93">0.93</option><option value="0.94">0.94</option><option value="0.95">0.95</option><option value="0.96">0.96</option><option value="0.97">0.97</option><option value="0.98">0.98</option><option value="0.99">0.99</option><option value="0.995">0.995</option><option value="0.999">0.999</option><option value="0.9995">0.9995</option></select>'));
				$('#producerRiskTd').html('');
				$('#producerRiskTd').append($('<select id="producerRisk" name="producerRisk" class="valid"><option value="5">5</option><option value="10">10</option><option value="20">20</option><option value="30">30</option></select>'));
				$('#useRiskTd').html('');
				$('#useRiskTd').append($('<select id="useRisk" name="useRisk" class="valid"><option value="5">5</option><option value="10">10</option><option value="20">20</option><option value="30">30</option></select>'));
				$('#ratioTd').html('');
				$('#ratioTd').append($('<select id="ratio" name="ratio" class="valid"><option value="1.5">1.5</option><option value="1.75">1.75</option><option value="2.0">2.0</option><option value="3.0">3.0</option></select>'));
			}
		} else { alert('未实现此功能');}
    }
    
  //生成方案
    function buildScheme() {
    	var $type = $('#type').val();
    	var $schemeType = $('#schemeType').val();
    	if($type == 1) {		//指数分布
    		if($schemeType == 1) {			//定时截尾
    			buildZhishuDingshi();
    			
    		} else if($schemeType == 2) {		//定数截尾
    			buildZhishuDingshu();
    			
    		} else if($schemeType == 3) {		//序贯截尾
    			buildXuguan();
    		}
    	} else if($type == 2) {				//二项分布
    		if($schemeType == 2) {		//定数截尾
    			buildErXiangDingshu();
    			//alert('此功能未完成');
    		} else if($schemeType == 3) {		//序贯截尾
    			alert('此功能未完成');
    		} else {
        		alert('无试验方案，请重新选择');
        	}
    	} else {
    		alert('不支持此操作');
    	}
    }
  
  //-------------------------指数定数------------------------------
	function buildZhishuDingshu() {
	  	//必填项
		var $lowerLimit = $('#lowerLimit').val();
		if($lowerLimit == '') {
    		$('#lowerLimit').poshytip('update','请填写最低可接受值');
    		$('#lowerLimit').poshytip('show');
    		$('#lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#lowerLimit').focus();
    		return false;
    	} else if(isNaN($lowerLimit)) {
    		$('#lowerLimit').poshytip('update','请填入数字');
    		$('#lowerLimit').poshytip('show');
    		$('#lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#lowerLimit').focus();
    		return false;
    	}
		<%-- 可选项--%>
    	var ratio = $('#ratio').val();		<%-- 鉴别比 --%>
    	var productor = $('#producerRisk').val();	<%-- 生产方风险 --%>
    	var user = $('#useRisk').val();			<%-- 使用方风险--%>
    	var	trunc = $('#truncTime').val();		<%-- 截尾数 --%>
    	
    	var arr1 = ['5', '5.0', '10', '10.0'];
    	var arr = ['1.5', '2', '2.0', '3', '3.0', '5', '5.0', '10', '10.0'];
    	var arr2 = ['10', '2', '6', '3', '8', '5', '4', '15', '18', '19', '23', '41', '52', '55', '67'];
    	
    	<%-- 4种方法生成方案 --%>
    	if(ratio!='' && productor!='' && user!='' && trunc=='') {
    		<%-- 判断输入的数据是否正确 --%>
    		if($.inArray(ratio, arr) == -1) {
        		$('#ratio').poshytip('update','请填写1.5, 2, 3, 5, 10中的一个数');
        		$('#ratio').poshytip('show');
        		$('#ratio').poshytip('hideDelayed',3000);
        		
        		$('#ratio').focus();
        		return false;
        	} 
    		if($.inArray(productor, arr1) == -1) {
        		$('#producerRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#producerRisk').poshytip('show');
        		$('#producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#useRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#useRisk').poshytip('show');
        		$('#useRisk').poshytip('hideDelayed',3000);
        		
        		$('#useRisk').focus();
        		return false;
        	} 
    		productor = productor / 100;
        	user = user / 100;
        	$.getJSON("${contextPath}/scheme-table/zhishu-dingshu/"+productor+"/"+user+"/"+ratio+"/end", function(data){
    			if(data == null){
					alert('未生成试验方案');
				} else {
					$('#dingshu tbody').empty();
					var $tbody = '';
					$.each(data, function (index, element) {
						if(index%2 == 0) {
							$tbody += '<tr class="odd">';
						} else {
							$tbody += '<tr>';
						}
						var panding = element.use2 * $lowerLimit;
						$tbody += '<td>'+element.productor1*100+'%</td><td>'+element.use1*100+'%</td><td>'+element.diffRatio+'</td><td>???</td><td>'+panding+' h</td><td>'+element.productor2+'</td></tr>';
					});
					$('#dingshu tbody').html($tbody);
				}
    		});
    	} else if(ratio=='' && productor!='' && user!='' && trunc=='') {
    		if($.inArray(productor, arr1) == -1) {
        		$('#save_selector_producerRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#save_selector_useRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
        	} 
    		productor = productor / 100;
        	user = user / 100;
        	
        	$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshu.action?productor="+productor+"&use="+user,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertDingshu(data1, lower);
    					
    				}
    			}
    		});
    	} else if(ratio=='' && productor=='' && user=='' && trunc!='') {
    		$('#save_selector_truncTime').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		if($.inArray(trunc, arr2) == -1) {
        		$('#save_selector_truncTime').poshytip('update','请填写 2,3,4,5,6,8,10,15,18,19,23,41,52,55,67中的一个数');
        		$('#save_selector_truncTime').poshytip('show');
        		$('#save_selector_truncTime').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_truncTime').focus();
        		return false;
        	} 
    		alert('第三种方法啊');
    	} else if(ratio!='' && productor=='' && user=='' && trunc=='') {
    		if($.inArray(ratio, arr) == -1) {
        		$('#save_selector_ratio').poshytip('update','请填写1.5, 2, 3, 5, 10中的一个数');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
        	} 
    		alert('第四种方法');
    	} else {
    		return false;
    		alert('输入的条件不足或过多，请重新输入');
    	}
	}
  
  //-------------------------指数分布定时截尾-----------------------------
    function buildZhishuDingshi() {
    	var $totalTime = $('#totalTime').val();
    	var $lowerLimit = $('#lowerLimit').val();
    	var $multiple = 0.0;
    	
    	if($totalTime == '') {		//第二种方案
    		var $productor = $('#producerRisk').val();
    		$('#useRisk').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		$('#producerRisk').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		if($productor == '') {
    			$('#producerRisk').poshytip('update','请填写生产方风险');
        		$('#producerRisk').poshytip('show');
        		$('#producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#producerRisk').focus();
        		return false;
    		} else if(isNaN($productor)) {
    			$('#producerRisk').poshytip('update','请填入数字');
        		$('#producerRisk').poshytip('show');
        		$('#producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#producerRisk').focus();
        		return false;
    		} else if($productor<=1 || $productor>=40) {
    			$('#producerRisk').poshytip('update','请填入1到40之间的数字');
        		$('#producerRisk').poshytip('show');
        		$('#producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#producerRisk').focus();
        		return false;
    		}
    		
    		var $user = $('#useRisk').val();
    		
    		if($user == '') {
    			$('#useRisk').poshytip('update','请填写使用方风险');
        		$('#useRisk').poshytip('show');
        		$('#useRisk').poshytip('hideDelayed',3000);
        		
        		$('#useRisk').focus();
        		return false;
    		} else if(isNaN($user)) {
    			$('#useRisk').poshytip('update','请填入数字');
        		$('#useRisk').poshytip('show');
        		$('#useRisk').poshytip('hideDelayed',3000);
        		
        		$('#useRisk').focus();
        		return false;
    		} else if($user<=1 || $user>=40) {
    			$('#useRisk').poshytip('update','请填入1到40之间的数字');
        		$('#useRisk').poshytip('show');
        		$('#useRisk').poshytip('hideDelayed',3000);
        		
        		$('#useRisk').focus();
        		return false;
    		}
    		
    		if($user>1 && $user<15) $user = 10;
    		else if($user>=15 && $user<25) $user = 20;
    		else if($user>=25 && $user<40) $user = 30;
    		
    		if($productor >1 && $productor <15) $productor = 10;
    		else if($productor>=15 && $productor <25) $productor = 20;
    		else if($productor>=25 && $productor <40) $productor = 30;
    		
    		$.getJSON("${contextPath}/scheme-table/zhishu-dingshi/"+$productor+"/"+$user, function(data){
    			if(data == null){
					alert('未生成试验方案');
				} else {
					//console.log(data);
					$('#dingshi tbody').empty();
					var $tbody = '';
					$.each(data, function (index, element) {
						if(index%2 == 0) {
							$tbody += '<tr class="odd">';
						} else {
							$tbody += '<tr>';
						}
						$tbody += '<td>'+element.schemeNum+'</td><td>'+element.productor1+'%</td><td>'+element.use1+'%</td><td>'+element.productor2+'%</td><td>'+element.use2+'%</td><td>'+element.diffRatio+'</td><td>'+element.testTime+'</td><td>'+element.rejection+'</td><td>'+element.receive+'</td></tr>';
					});
					$('#dingshi tbody').html($tbody);
				}
    		});
    		
    	} else if($totalTime != '' && $lowerLimit != '') {
    		if(isNaN($totalTime)) {
        		$('#save_selector_totalTime').poshytip('update','请填入数字');
        		$('#save_selector_totalTime').poshytip('show');
        		$('#save_selector_totalTime').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_totalTime').focus();
        		return false;
        	}
    		if(isNaN($totalTime)) {
        		$('#save_selector_lowerLimit').poshytip('update','请填入数字');
        		$('#save_selector_lowerLimit').poshytip('show');
        		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_lowerLimit').focus();
        		return false;
        	}
    		$multiple = $totalTime/$lowerLimit;
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshi1.action?multiple="+$multiple,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);

    					//$('#dingshi tr:not(:first)').remove();
    					//$('<tr><td>'+data1.schemeNum+'</td><td>'+data1.productor1+'%</td><td>'+data1.use1+'%</td><td>'+data1.productor2+'%</td><td>'+data1.use2+'%</td><td>'+data1.diffRatio+'</td><td>'+data1.testTime+'</td><td>'+data1.rejection+'</td><td>'+data1.receive+'</td></tr>').insertAfter($('#dingshi tr:eq(0)'));
    					$('#dingshi tbody').empty();
    					$('#dingshi tbody').html('<tr><td>'+data1.schemeNum+'</td><td>'+data1.productor1+'%</td><td>'+data1.use1+'%</td><td>'+data1.productor2+'%</td><td>'+data1.use2+'%</td><td>'+data1.diffRatio+'</td><td>'+data1.testTime+'</td><td>'+data1.rejection+'</td><td>'+data1.receive+'</td></tr>');
    					//$('#dingshi').show();
    					//$('#dingshu').hide();
    					
    				}
    			}
    		});
    	} else {
    		alert('输入的条件无法生成试验方案，请重新输入');
    	}
    	
    }
    //---------指数分布定时截尾--------------------//
</script>
<style type="text/css">
label { margin-right: 10px; padding-right: 10px; width: 150px; text-align: right; position: relative; }
fieldset { margin: 10px 0; padding: 15px 10px 15px 10px; border: #DDD 1px solid; }
legend{
color:#FFFFFF;
background-color:#0fcdf6;
padding:2px 5px 2px 5px;
}
input:focus { background-color: #FFC; border-color: #FC6; }
input {border-color: #a7b5bc #ced9df #ced9df #a7b5bc;
    border-style: solid;
    border-width: 1px;
    height:21px;
    margin:4px;
    text-indent:4px;}
select {border-color: #a7b5bc #ced9df #ced9df #a7b5bc;
    border-style: solid;
    border-width: 1px;
    height:21px;
    margin-left:4px;
    padding-left:4px;
    padding-right : 4px;}

.tablecondition{width:100%;}
/*td{  
padding:4px;  
} */
.tdtitle{width:96px; }
</style>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${project.box.name }</a></li>
    <li><a href="javascript:void(0);">${project.name }</a></li>
    <li><a href="javascript:void(0);">试验方案设计</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <c:url var="addAction" value="/scheme/save" ></c:url>
    <form:form action="${addAction }" commandName="scheme">
    <form:hidden path="id"/>
    <form:hidden path="project.id" value="${project.id }"/>
    <div class="formtitle"><span>基本信息</span></div>
    <div>
	    <form:label path="schemeName">方案名称&nbsp;<font style="color:red;">*</font></form:label><form:input path="schemeName"/>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <form:label path="type">方案类型&nbsp;<font style="color:red;">*</font></form:label>
	    <form:select path="type">
	    	<form:option value="1">指数分布试验方案</form:option>
	    	<form:option value="2">二项分布试验方案</form:option>
	    	<form:option value="3">威布尔分布试验方案</form:option>
	    </form:select>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <form:label path="schemeType">截尾方式&nbsp;<font style="color:red;">*</font></form:label>
	    <form:select path="schemeType">
	    	<form:option value="1">定时截尾</form:option>
	    	<form:option value="2">定数截尾</form:option>
	    	<form:option value="3">序贯截尾</form:option>
	    </form:select>
    </div>
    <fieldset>
    <legend>输入试验条件</legend>
    <table class="tablecondition" >
	    <tr>
		    <td class="tdtitle">
		    	<form:label path="sampleSize">试验样本量</form:label>
		    </td>
		    <td>
		    	<form:input path="sampleSize"/>
			</td>
		    <td class="tdtitle" id="totalTimeLabelTd">
		    	<form:label path="totalTime">总试验时间T</form:label>
		    </td>
		    <td id="totalTimeTd">
		    	<form:input path="totalTime"/>
		    </td>
		    <td class="tdtitle">
		    	<form:label path="lowerLimit">最低可接受值</form:label>
		    </td>
		    <td id="lowerLimitTd">
		    	<form:input path="lowerLimit"/>
			</td>
	    </tr>
    	<tr>
    		<td class="tdtitle">
    			<form:label path="producerRisk">生产方风险</form:label>
    		</td>
    		<td id="producerRiskTd">
    			<form:input path="producerRisk" />
    		</td>
    		<td class="tdtitle">
    			<form:label path="useRisk">使用方风险</form:label>
    		</td>
    		<td id="useRiskTd">
    			<form:input path="useRisk"/>
    		</td>
	    	<td class="tdtitle">
	    		<form:label path="ratio">鉴别比</form:label>
	    	</td>
	    	<td id="ratioTd">
	    		<form:input path="ratio" value="3.0"/>
	    	</td>
	    </tr>
    </table>
    
    </fieldset>
    <div><form:button class="btn">确认保存</form:button>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="button" class="btn" value="生成试验方案" onclick="buildScheme()"/></div>
    </form:form>
    <div class="rightinfo1">
    
    
    
    <table id="dingshi" class="tablelist">
    	<thead>
    	<tr>
        <th>方案号</th>
        <th>生产方风险（名义值）</th>
        <th>使用方风险（名义值）</th>
        <th>生产方风险（实际值）</th>
        <th>使用方风险（实际值）</th>
        <th>鉴别比</th>
        <th>试验时间(倍数)</th>
        <th>拒收故障数≥</th>
        <th>接收故障数≤</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <table id="dingshu" class="tablelist">
    	<thead>
    	<tr>
        <th>生产方风险</th>
        <th>使用方风险</th>
        <th>鉴别比</th>
        <th>样本量</th>
        <th>接收试验时间</th>
        <th>截尾数r</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <table id="xuguan" class="tablelist">
    	<thead>
    	<tr>
    	<th>方案号</th>
        <th>生产方风险</th>
        <th>使用方风险</th>
        <th>生产方风险（实际值）</th>
        <th>使用方风险（实际值）</th>
        <th>鉴别比</th>
        <th>判决标准与判决图</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    
    </div>
    
    </div>
    
</body>
</html>