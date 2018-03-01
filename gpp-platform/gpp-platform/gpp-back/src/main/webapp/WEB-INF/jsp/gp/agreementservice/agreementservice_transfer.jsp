<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					<!-- 签约管理 转签页面 -->
					<form action="agreementService/totransfer.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议名称:</td>
								<td><input type="text" name="AGREEMENT_NAME" id="AGREEMENT_NAME" value="${pd.AGREEMENT_NAME}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								
								<td style="width:130px;text-align: right;padding-top: 13px;">签约医生:</td>
								<td>
								<input type="hidden" name="GEN_PRACTITIONER_ID" id="GEN_PRACTITIONER_ID" value="${pd.GEN_PRACTITIONER_ID}"/>  
								<input type="text" name="GEN_PRACTITIONER_NAME" id="GEN_PRACTITIONER_NAME" value="${pd.GEN_PRACTITIONER_NAME}" style="width:80%;"/>
									<a class="btn btn-mini btn-purple" onclick="docDate();">医生列表</a>
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约医生电话:</td>
								<td><input type="text" name="GEN_PRACTITIONER_PHONE" id="GEN_PRACTITIONER_PHONE" value="${pd.GEN_PRACTITIONER_PHONE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议开始时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_START" id="GMT_START" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.GMT_START}"/>'  type="text" data-date-format="yyyy-mm-dd" />
								</td>
							</tr>
							<tr>	
								<td style="width:130px;text-align: right;padding-top: 13px;">协议结束时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_END" id="GMT_END" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.GMT_END}"/>" type="text" data-date-format="yyyy-mm-dd"  />
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">转签原因:</td>
								<td>
									<textarea rows="4" class="form-control" id="REMARK" name="REMARK" placeholder="这里输入转签原因"></textarea>
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
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		//医生列表
		function docDate(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "医生列表";
//			 diag.URL = '<%=basePath%>agreementService/getDocData.do';
			 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
			 diag.Width = 850;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.OKEvent = function(){
		         	var id = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
		         	var name=diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value;
		         	if(id !=''){
						$("#GEN_PRACTITIONER_ID").val(id);
						$("#GEN_PRACTITIONER_NAME").val(name);
		         	}	
		         	diag.close();
		      };
			 diag.show();
		}
		</script>
</body>
</html>