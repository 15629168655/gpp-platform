<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- 弹出门诊测血压新增页面 -->
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
						<form action="bloodPressure/${msg }.do" name="userForm" id="userForm" method="post">
							<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
							<input type="hidden" name="PATIENT_ID" id="patient_id" value="${pd.PATIENT_ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">患者姓名<span class="red">*</span>:</td>
									<td><input type="text" name="PATIENT_NAME" id="patient_name" value="${pd.PATIENT_NAME }"  onclick="luRu();" placeholder="点击这里录入患者姓名" title="患者姓名" readonly="readonly" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">测量时间:</td>
									<td><input class="span10 date-picker" name="MEASURING_TIME" id="measuring_time"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.MEASURING_TIME}" />' type="text" readonly="readonly" style="width:98%;" placeholder="执行时间" title="执行时间"/>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">高压:</td>
									<td><input type="text" name="HIGH_PRESSURE" id="high_pressure" value="${pd.HIGH_PRESSURE }" placeholder="这里输入高压值" maxlength="20" title="高压" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">低压:</td>
									<td><input type="text" name="LOW_PRESSURE" id="low_pressure" value="${pd.LOW_PRESSURE }" placeholder="这里输入低压值" maxlength="20" title="低压" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">是否正常:</td>
									<td>
									<select name="IS_NORMAL" id="IS_NORMAL" style="width:98%;" >
									<c:forEach items="${pd.EnumIsNormal}" var="item">
                                           	<option value="${item.key}" <c:if test="${pd.IS_NORMAL == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                       	 </c:forEach>
									</select>
									</td>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">是否用药:</td>
									<td>
									<select name="IS_MEDICATION" id="IS_MEDICATION" style="width:98%;" >
									<c:forEach items="${pd.enumBloodPressure}" var="item">
                                           	<option value="${item.key}" <c:if test="${pd.IS_MEDICATION == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                       	 </c:forEach>
									</select>
									</td>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	
	//保存
	function save(){
		if($("#patient_name").val()==""){
			$("#patient_name").tips({
				side:3,
	            msg:'请输入患者姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#patient_name").focus();
			return false;
		} else {
			$("#patient_name").val($.trim($("#patient_name").val()));
		}
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		
	}	
	
	//录入
	function luRu(){
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
		         	$("#patient_id").val(id);
		         	$("#patient_name").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	

</script>
</html>