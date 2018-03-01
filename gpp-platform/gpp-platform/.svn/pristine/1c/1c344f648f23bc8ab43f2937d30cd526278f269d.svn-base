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
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


%>
<!-- 随访记录新增和修改页面 -->
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
								<form action="taskinfo/${msg }.do" name="Form" id="Form" method="post">
								<input type="hidden" name=GUID id="GUID" value="${pd.GUID}"/>
									<div id="zhongxin" style="padding-top: 10px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">定时任务名称<span class="red">*</span>:</td>
											<td><input type="text" name="JOBNAME" id="JOBNAME" value="${pd.JOBNAME}" maxlength="20" placeholder="定时任务名称" title="定时任务名称" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">定时任务class<span class="red">*</span>:</td>
											<td><input type="text" name="JOBCLASS" id="JOBCLASS" value="${pd.JOBCLASS}" maxlength="100" placeholder="定时任务class" title="定时任务class" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">是否开启<span class="red">*</span>:</td>
											 <td>
											  	<select name="ZT" id="ZT" style="width:98%;">
											         <option value="" selected >请选择</option>
										               <option value="1" <c:if test="${pd.ZT == 1}"> selected="selected" </c:if> >启用</option> 
				                                        <option value="0" <c:if test="${pd.ZT == 0}"> selected="selected" </c:if> >禁用</option> 
											     </select>
											   </td>
										</tr>
							            <tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">执行频率<span class="red">*</span>:</td>
											   <td>
											  	<select name="JOBTID" id="JOBTID" style="width:98%;">
											         <option value="" selected >请选择</option>
										             <c:forEach items="${timemap}" var="item">
										             <option value="${item.key}" <c:if test="${pd.JOBTID == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										    <tr>
										    
											<td style="width:120px;text-align: right;padding-top: 13px;">定时任务描述:</td>
											
											<td><input type="text" name="DES" id="DES" value="${pd.DES}" maxlength="20" placeholder="定时任务描述" title="定时任务描述" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    }

	);
	//保存
	function save(){

		if($("#JOBNAME").val()==""){
			$("#JOBNAME").tips({
				side:3,
	            msg:'请录入定时任务名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JOBNAME").focus();
			return false;
		}
		
		if($("#JOBCLASS").val()==""){
			$("#JOBCLASS").tips({
				side:3,
	            msg:'请录入class',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JOBCLASS").focus();
			return false;
		}
		
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请选中状态',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#STATUS").focus();
			return false;
		}
		
		if($("#TIMEDES").val()==""){
			$("#TIMEDES").tips({
				side:3,
	            msg:'请选中执行频率',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TIMEDES").focus();
			return false;
		}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
	}

	
	$(function() {
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
	

	
</script>
</html>