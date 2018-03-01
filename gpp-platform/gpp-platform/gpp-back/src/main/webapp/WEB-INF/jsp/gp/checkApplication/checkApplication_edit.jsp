<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					<!-- 检查申请 新增修改页面 -->
					<form action="checkApplication/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="LRR_ID" id="LRR_ID" value="${pd.LRR_ID}"/>		
						<input type="hidden" name="JCMXID" id="JCMXID" value="${pd.JCMXID}"/>	
						<input type="hidden" name="APPLY_DOCTOR_ID" id="APPLY_DOCTOR_ID" value="${pd.APPLY_DOCTOR_ID}"/>	
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>检查项目名称:</td>
									<td><input type="text" name="JCXMMC" id="JCXMMC" value="${pd.JCXMMC}" maxlength="255" placeholder="这里输入检查项目名称" title="检查项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>申请医生:</td>
								<td><input type="text" name="APPLY_DOCTOR" id="APPLY_DOCTOR" value="${pd.APPLY_DOCTOR}" readonly="readonly" maxlength="255" placeholder="这里输入申请医生" title="申请医生" style="width:98%;"/></td>
							</tr>
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>患者姓名:</td>
									<td>
										<input type="hidden" name="PATIENT_ID" id="PATIENT_ID" value="${pd.PATIENT_ID}" />
										<input type="text" name="PATIENT_NAME" id="PATIENT_NAME" value="${pd.PATIENT_NAME}" readonly="readonly" style="width: 88%"/>
										<a class="btn btn-mini btn-purple" onclick="choosePerson();">患者信息</a>
									</td>
							</tr>
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>门诊就诊流水号:</td>
									<td><input type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH}" maxlength="255" placeholder="这里输入门诊就诊流水号" title="门诊就诊流水号" style="width:98%;"/></td>
							</tr>
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>处方项目明细号码:</td>
									<td><input type="text" name="CFMXH" id="CFMXH" value="${pd.CFMXH}" maxlength="255" placeholder="这里输入处方项目明细号码" title="处方项目明细号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>检查时间:</td>
									<td>
									<input class="span10 date-picker" name="JC_TIME" id="JC_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.JC_TIME}" />' type="text" readonly="readonly" style="width:98%;" placeholder="检查时间" title="检查时间"/>
									</td>
							</tr>
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>检验医生:</td>
									<td>
										<input type="hidden" name="INSPECTION_DOCTOR_ID" id="INSPECTION_DOCTOR_ID" value="" />
										<input type="text" name="INSPECTION_DOCTOR" id="INSPECTION_DOCTOR" value="${pd.INSPECTION_DOCTOR}" readonly="readonly" style="width: 88%"/>
										<a class="btn btn-mini btn-purple" onclick="chooseCheckPerson();">检验医生</a>
									</td>
							</tr>
							<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">检验医生工号:</td>
									<td><input type="text" name="INSPECTION_DOCTOR_CODE" id="INSPECTION_DOCTOR_CODE" value="${pd.INSPECTION_DOCTOR_CODE}" maxlength="255" placeholder="检验医生工号" title="检验医生工号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>检查结果:</td>
								<td><input type="text" name="JCJG" id="JCJG" value="${pd.JCJG}" maxlength="255" placeholder="这里输入检查结果" title="检查结果" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">录入人姓名:</td>
								<td><input type="text" name="LRR_NAME" id="LRR_NAME" value="${pd.LRR_NAME}" readonly="readonly" maxlength="255" placeholder="这里输入录入人姓名" title="录入人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="BZ" id="BZ" value="${pd.BZ}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#JCXMMC").val()==""){
			$("#JCXMMC").tips({
				side:3,
	            msg:'请输入检查项目名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JCXMMC").focus();
			return false;
			}
			if($("#APPLY_DOCTOR").val()==""){
			$("#APPLY_DOCTOR").tips({
				side:3,
	            msg:'请输入申请医生',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#APPLY_DOCTOR").focus();
			return false;
			}
			if($("#PATIENT_NAME").val()==""){
			$("#PATIENT_NAME").tips({
				side:3,
	            msg:'请输入患者姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PATIENT_NAME").focus();
			return false;
			}
			if($("#JZLSH").val()==""){
			$("#JZLSH").tips({
				side:3,
	            msg:'请输入就诊流水号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JZLSH").focus();
			return false;
			}
			if($("#CFMXH").val()==""){
			$("#CFMXH").tips({
				side:3,
	            msg:'请输入处方明细号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#CFMXH").focus();
			return false;
			}
			if($("#JC_TIME").val()==""){
			$("#JC_TIME").tips({
				side:3,
	            msg:'请输入检查时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JC_TIME").focus();
			return false;
			}
			if($("#INSPECTION_DOCTOR").val()==""){
			$("#INSPECTION_DOCTOR").tips({
				side:3,
	            msg:'请输入检验医生',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INSPECTION_DOCTOR").focus();
			return false;
			}
			if($("#JCJG").val()==""){
			$("#JCJG").tips({
				side:3,
	            msg:'请输入检查结果',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JCJG").focus();
			return false;
			}
		
		  $("#Form").submit();
		}
		
		//选择患者		
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
		         	$("#PATIENT_ID").val(id);
		         	$("#PATIENT_NAME").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
		 
		 //选择检验医生
		 function chooseCheckPerson(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "检验医生信息";
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		  diag.OKEvent = function(){
	         var GEN_PRACTITIONER_ID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
	            if(GEN_PRACTITIONER_ID!=''){
	            	$("#INSPECTION_DOCTOR_ID").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value);
	            	$("#INSPECTION_DOCTOR_CODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
	                $("#INSPECTION_DOCTOR").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
	                $("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
	                diag.close();
	             }
	         };
		 diag.show();
		}
		
		$(function() {
				//日期框
				$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD HH:mm:ss '
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
			
		});
		
		</script>
</body>
</html>