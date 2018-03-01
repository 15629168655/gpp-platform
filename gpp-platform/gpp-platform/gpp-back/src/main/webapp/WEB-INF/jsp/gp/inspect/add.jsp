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
						<form action="inspect/saveObject.do" name="userForm" id="userForm" method="post">
							
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">门诊处方明细号：</td>
									<td>
										<input type="text" id="CFMXH" name="CFMXH"  style="width: 350px"/>
									<!--<a class="btn btn-mini btn-purple" onclick="mzcf();">门诊处方明细</a>   -->	
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">门诊就诊流水号：</td>
									<td>
										<input type="text" id="JZLSH" name="JZLSH" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="mzjz();">门诊就诊菜单</a>
									</td>
								</tr>
								
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">患者姓名：</td>
									<td>
										<input type="hidden" name="PERSON_ID" id="PERSON_ID" value=""  style="width: 350px" />
										<input type="text" name="PERSON_NAME" id="PERSON_NAME" value=""  style="width: 350px" readonly="readonly"/> 
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">送检医生：</td>
									<td>
										<input type="hidden" id="SEND_DOC_ID" name="SEND_DOC_ID" />
										<input type="hidden" id="SEND_DOC_CODE" name="SEND_DOC_CODE" />
										<input type="text" id="SEND_DOC" name="SEND_DOC" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="docDate(1);">医生列表</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">送检时间：</td>
									<td><input class="span10 date-picker" type="text" name="SEND_TIME" id="SEND_TIME" value=""  style="width: 350px" readonly="readonly"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">检验医生：</td>
									<td>
										<input type="hidden" id="INSPECT_DOC_ID" name="INSPECT_DOC_ID"/>
										<input type="hidden" id="INSPECT_DOC_CODE" name="INSPECT_DOC_CODE"/>
										<input type="text" id="INSPECT_DOC" name="INSPECT_DOC" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="docDate(2);">医生列表</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">申请医生：</td>
									<td>
										<input type="hidden" id="APPLY_DOC_ID" name="APPLY_DOC_ID" readonly="readonly" style="width: 280px"/>
										<input type="text" id="APPLY_DOC" name="APPLY_DOC" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="docDate(3);">医生列表</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">检验项目名称：</td>
									<td><input type="text" name="INSPECT_PRO_NAME" id="INSPECT_PRO_NAME" value=""  style="width: 350px" /></td>
								</tr>
								<!--  
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">检验结果：</td>
									<td><input type="text" name="INSPECT_VALUE" id="INSPECT_VALUE" value=""  style="width: 350px" /></td>
								</tr>
								-->
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">标本类型：</td>
									<td><input type="text" name="BBLX" id="BBLX" value=""  style="width: 350px" /></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">备注说明：</td>
									<td><textarea type="text" name="REMARK" id="REMARK"  style="width: 350px"> </textarea></td>
								</tr>	
													
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
		if($("#CFMXH").val()==""){
			$("#CFMXH").tips({
				side:3,
	            msg:'请输入门诊处方明细号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CFMXH").focus();
			return false;
		} else {
			$("#diseases_name").val($.trim($("#diseases_name").val()));
		}
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//医生列表
	function docDate(msg){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "医生列表";
		 //1,送检；2，检验；3，申请
//		 diag.URL = '<%=basePath%>inspect/getDocData.do?msg='+msg;
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
         	var id = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
         	var name=diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value;
         	var code =diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value;
         	if(msg=='1'){
				$("#SEND_DOC_ID").val(id);
				$("#SEND_DOC").val(name);
				$("#SEND_DOC_CODE").val(code);
			}else if(msg=='2'){
				$("#INSPECT_DOC_ID").val(id);
				$("#INSPECT_DOC").val(name);
				$("#INSPECT_DOC_CODE").val(code);
			}else if(msg=='3'){
				$("#APPLY_DOC_ID").val(id);
				$("#APPLY_DOC").val(name);
			}  
         	diag.close();
      };
		 diag.show();
	}
	//门诊就诊列表
	function mzjz(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "门诊就诊流水";
		 diag.URL = '<%=basePath%>inspect/listMZLS.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
			 var LSH = diag.innerFrame.contentWindow.document.getElementById('_LSH').value;
	         var PID=diag.innerFrame.contentWindow.document.getElementById('_PID').value;
	         var PXM=diag.innerFrame.contentWindow.document.getElementById('_PXM').value;
	         if(LSH != ''){
					$("#JZLSH").val(LSH);
					$("#PERSON_ID").val(PID);
					$("#PERSON_NAME").val(PXM);
	         }
	         
			 diag.close();
		 }
		 diag.show();
	}
</script>
</html>