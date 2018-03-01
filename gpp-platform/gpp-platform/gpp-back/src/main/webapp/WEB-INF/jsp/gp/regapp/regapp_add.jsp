<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<% 
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	java.util.Date currentTime = new java.util.Date();//得到当前系统时间
	
	String nowtime = formatter.format(currentTime); //将日期时间格式化 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="static/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-datetimepicker.css" />
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
						<form action="regapp/save.do" name="userForm" id="userForm" method="post">
								<input type="hidden" id="ORG_CODE" name="ORG_CODE" />
								<input type="hidden" id="DEPTCODE" name="DEPTCODE" />
								<input type="hidden" id="DEPTNAME" name="DEPTNAME" />
								<input type="hidden" id="DOCTORCODE" name="DOCTORCODE" />
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">患者姓名：</td>
									<td>
										<input type="hidden" name="PERSON_ID" id="PERSON_ID" value="" />
										<input type="text" name="PERSON_NAME" id="PERSON_NAME" value="" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="choosePerson();">患者菜单</a>
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">医生姓名：</td>
									<td>
										<input type="text" id="DOCTORNAME" name="DOCTORNAME" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="docDate();">医生列表</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">预约时间：</td>
									<td><input class="span10 date-picker" type="text" name="APPLYTIME" id="APPLYTIME" value=""  style="width: 350px" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">预约</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	$(function(){
		//日期框
		$('.date-picker').datetimepicker({
			        format:'YYYY-MM-DD HH:mm:ss '
		    }).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	});
	//保存
	function save(){
		if($("#PERSON_NAME").val()==""){
			$("#PERSON_NAME").tips({
				side:3,
	            msg:'请选择患者',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PERSON_NAME").focus();
			return false;
		} else {
			$("#PERSON_NAME").val($.trim($("#PERSON_NAME").val()));
		}
		if($("#DOCTORNAME").val()==""){
			$("#DOCTORNAME").tips({
				side:3,
	            msg:'请选择患者',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DOCTORNAME").focus();
			return false;
		} else {
			$("#DOCTORNAME").val($.trim($("#DOCTORNAME").val()));
		}
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//医生列表
	function docDate(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "医生列表";
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
         	var ORG_CODE = diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value;
         	var DEP_ID = diag.innerFrame.contentWindow.document.getElementById('DEP_ID').value;
         	var DEP_NAME = diag.innerFrame.contentWindow.document.getElementById('DEP_NAME').value;
         	var docname=diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value;
         	var doccode =diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value;
			$("#ORG_CODE").val(ORG_CODE);
			$("#DEPTCODE").val(DEP_ID);
			$("#DEPTNAME").val(DEP_NAME);
			$("#DOCTORNAME").val(docname);
			$("#DOCTORCODE").val(doccode);
         	diag.close();
      };
		 diag.show();
	}
	function choosePerson(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "患者信息";
		 diag.URL = '<%=basePath%>	autoRegister/getPersonData.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('pid').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('xm').value;
	         	if(id !=''){
		         	$("#PERSON_ID").val(id);
		         	$("#PERSON_NAME").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
</script>
</html>