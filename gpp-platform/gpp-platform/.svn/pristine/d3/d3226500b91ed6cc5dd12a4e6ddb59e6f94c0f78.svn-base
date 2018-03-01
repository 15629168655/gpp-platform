<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
%>

<!DOCTYPE html>
<!-- 指标结果的范围新增与编辑-->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->


<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->

 <!--颜色控件 -->
 <!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/ace/css/chosen.css" />
		<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/ace/css/colorpicker.css"/>

		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

	<style>
        body{
            background-color: #000079;
        }
    </style>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<form action="indexResultRange/${msg }.do?" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" readonly="readonly" name="INDEX_ID" id="INDEX_ID" value="${pd.INDEX_ID }" placeholder="请输入ID" title="指标ID" style="width:98%;" />
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
				              	<table>
				              		<tr>
				              			<td style="width: 420px;">
				              				 <div class="tabable">
								                <ul class="nav nav-tabs" id="dis">
								                   
								                    <li id="disRecordTab">
								                        <a href="#disRecord" data-toggle="tab" style="cursor:pointer;">
								                        诊断记录:
								                        </a>
								                    </li>
								                    
								                    <li id="createDisTab">
								                        <a href="#createDis"  data-toggle="tab" style="cursor:pointer;">
								                          生成诊断
								                        </a>
								                    </li>
								                    
								                    <li id="addDisTab">
								                        <a href="#addDis"  data-toggle="tab" style="cursor:pointer;">
								                        添加诊断
								                        </a>
								                    </li>
								                </ul>
								
								                <div class="tab-content">
								                    <div id="disRecord" class="tab-pane">
								                   		<iframe name="disRecord" id="disRecordFrame"  src="<%=basePath%>indexDiseaseAdvice/list.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                    
								                    <div id="createDis" class="tab-pane">
								                       <iframe name="createDis" id="createDisFrame"  src="<%=basePath%>indexDiseaseAdvice/fDis.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                    
								                    <div id="addDis" class="tab-pane">
								                       <iframe name="addDis" id="addDisFrame"  src="<%=basePath%>indexDiseaseAdvice/createDis.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                </div>
								            </div>
				              			</td>
				              			<td style="width: 420px;">
				              				 <div class="tabable">
								                <ul class="nav nav-tabs" id="suggestion">
								                   
								                    <li id="screeningSuggestionTab">
								                        <a href="#screeningSuggestion" data-toggle="tab" style="cursor:pointer;">
								                          筛查建议
								                        </a>
								                    </li>
								                    
								                    <li id="createSuggestionTab">
								                        <a href="#createSuggestion"  data-toggle="tab" style="cursor:pointer;">
								                          生成建议
								                        </a>
								                    </li>
								                    
								                    <li id="emptySuggestionTab">
								                        <a href="#emptySuggestion"  data-toggle="tab" style="cursor:pointer;">
								                          添加建议
								                        </a>
								                    </li>
								                </ul>
								
								                <div class="tab-content">
								                    <div id="screeningSuggestion" class="tab-pane">
								                   		<iframe name="screeningSuggestion" id="screeningSuggestionFrame"  src="<%=basePath%>indexDiseaseAdvice/screeningAdvice.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                    
								                    <div id="createSuggestion" class="tab-pane">
								                       <iframe name="createSuggestion" id="createSuggestionFrame"  src="<%=basePath%>indexDiseaseAdvice/createAdvice.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                    
								                    <div id="emptySuggestion" class="tab-pane">
								                      	<iframe name=emptySuggestionTab id="emptySuggestionTabFrame"  src="<%=basePath%>indexDiseaseAdvice/addAdvice.do?RESIDENT_QUESTIONNAIRE_ID=${pd.QUES_ID}"  frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
								                    </div>
								                </div>
								            </div>
				              			</td>
				              		</tr>
				              	</table>
							</div>
						   <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</div>
						</div>
						</div>
					</form>
				</div>
						
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
				<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			    </a>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 颜色控件 -->
	<script src="static/ace/js/jquery-ui.custom.js"></script>
		
		<script src="static/ace/js/chosen.jquery.js"></script>
		
		<script src="static/ace/js/fuelux/fuelux.spinner.js"></script>
		
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
		<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
		
		<script src="static/ace/js/date-time/moment.js"></script>
		<script src="static/ace/js/date-time/daterangepicker.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
		<script src="static/ace/js/bootstrap-colorpicker.js"></script>
		
		<script src="static/ace/js/jquery.autosize.js"></script>
		<script src="static/ace/js/jquery.inputlimiter.1.3.1.js"></script>
		<script src="static/ace/js/jquery.maskedinput.js"></script>
		<script src="static/ace/js/bootstrap-tag.js"></script>

		<!-- ace scripts -->
		<script src="static/ace/js/ace/elements.scroller.js"></script>
		<script src="static/ace/js/ace/elements.colorpicker.js"></script>
		<script src="static/ace/js/ace/elements.fileinput.js"></script>
		<script src="static/ace/js/ace/elements.typeahead.js"></script>
		<script src="static/ace/js/ace/elements.wysiwyg.js"></script>
		<script src="static/ace/js/ace/elements.spinner.js"></script>
		<script src="static/ace/js/ace/elements.treeview.js"></script>
		<script src="static/ace/js/ace/elements.wizard.js"></script>
		<script src="static/ace/js/ace/elements.aside.js"></script>
		<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/ace/ace.ajax-content.js"></script>
		<script src="static/ace/js/ace/ace.touch-drag.js"></script>
		<script src="static/ace/js/ace/ace.sidebar.js"></script>
		<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
		<script src="static/ace/js/ace/ace.widget-box.js"></script>
		<script src="static/ace/js/ace/ace.settings.js"></script>
		<script src="static/ace/js/ace/ace.settings-rtl.js"></script>
		<script src="static/ace/js/ace/ace.settings-skin.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>	
					
<script type="text/javascript">
	$(top.hangge());

	

	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
});
	$(document).ready(function(){
    	$('#dis a:first').tab('show');
    	$('#suggestion a:first').tab('show');
    });
    
    $('#dis a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })
    $('#suggestion a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })
</script>
	
		
</html>