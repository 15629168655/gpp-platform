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
						<form action="zzKnowledgeBase/saveEdit.do" name="userForm" id="userForm" method="post">
							<input type="hidden" name="ID" id="id" value="${data.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">请选择症状：</td>
									<td>
										<input type="hidden" id="class_code" name="CLASS_CODE" value="${data.CLASS_CODE }"/>
										<input type="text" id="class_name" name="CLASS_NAME" value="${data.CLASS_NAME }" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="treeDialog();">症状菜单</a>
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">是否推荐：</td>
									<td>
										<label><input name="IS_RECOMMEND" type="radio" value="1" <c:out value="${data.IS_RECOMMEND==1?'checked':''}"/> />推荐</label>
										<label><input name="IS_RECOMMEND" type="radio" value="0" <c:out value="${data.IS_RECOMMEND==0?'checked':''}"/> />不推荐</label>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">症状内容：</td>
									<td><textarea type="text" name="REMARK" id="remark"style="width: 350px" value="">${data.REMARK}</textarea></td>
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
	//保存
	function save(){
		if($("#class_name").val()==""){
			$("#class_name").tips({
				side:3,
	            msg:'请选择症状名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#agreement_name").focus();
			return false;
		} else {
			$("#diseases_name").val($.trim($("#diseases_name").val()));
		}
		
		if($("#remark").val()==""){
			$("#remark").tips({
				side:3,
	            msg:'请输入症状内容',
	            bg:'#AE81FF',
	            time:2
	        });
			return false;
		} 
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//症状菜单
	function treeDialog(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "症状菜单";
		 diag.URL = '<%=basePath%>zzKnowledgeBase/getTreeData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	}
</script>
</html>