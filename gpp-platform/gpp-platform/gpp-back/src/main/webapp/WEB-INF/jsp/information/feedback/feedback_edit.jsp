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
					<!-- 意见反馈 新增修改页面 -->
					<form action="feedback/edit.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">提交人：</td>
								<td><input type="text" name="TJR" id="TJR" value="${pd.TJR}" readonly="readonly" maxlength="50" placeholder="提交人"  title="提交人" style="width:98%;"/></td>
							</tr>
                            <tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">联系方式:</td>
								<td><input type="text" name="LXFS" id="LXFS" value="${pd.LXFS}" readonly="readonly" maxlength="50" placeholder="联系方式" title="联系方式" style="width:98%;"/></td>
							</tr>
							 <tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">内容:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" readonly="readonly" maxlength="50" placeholder="内容" title="内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">提交时间:</td>
								<td><input type="text" name="TJSJ" id="TJSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.TJSJ}" />' readonly="readonly" maxlength="255" placeholder="这里输入提交时间" title="提交时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">处理人：</td>
								<td colspan="3">
								<input type="text" name="CLR" id="CLR" value="${pd.CLR}" maxlength="50" placeholder="处理人"  title="处理人" style="width:98%;"/>
								</td>
							</tr>
							<tr>
	                             <td style="width:130px;text-align: right;padding-top: 13px;">处理内容:</td>
								<td colspan="3">
								<textarea rows="3" class="form-control" id="CLREMARK" name="CLREMARK" value="${pd.CLREMARK}" placeholder=""></textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">确定</a>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TEMPLATE_NAME").val()==""){
				$("#TEMPLATE_NAME").tips({
					side:3,
		            msg:'请输入模板名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_NAME").focus();
			return false;
			}
			if($("#TEMPLATE_TYPE").val()==""){
				$("#TEMPLATE_TYPE").tips({
					side:3,
		            msg:'请输入模板类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_TYPE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		
		</script>
</body>
</html>