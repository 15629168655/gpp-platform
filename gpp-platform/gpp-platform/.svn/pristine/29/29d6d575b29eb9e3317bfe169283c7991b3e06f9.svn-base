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
								<form action="task/${msg }.do" name="taskForm" id="taskForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								<input name="GMT_CREATED" id="GMT_CREATED"  value="${pd.GMT_CREATED}" type="hidden"   title="生成时间" />
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">任务名称 <span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="JOB_NAME" id="JOB_NAME" value="${pd.JOB_NAME }" maxlength="32" placeholder="这里输入任务名称" title="任务名称" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">任务内容</td>
											<td><input type="text" name="JOB_CONTENT" id="JOB_CONTENT" value="${pd.JOB_CONTENT }" maxlength="32" placeholder="这里输入任务内容" title="任务内容" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">任务类型 <span style="color:red; font-size:14px">*</span></td>
											<td>
											 <select class="form-control"  name="JOB_TYPE" id="JOB_TYPE" style="width:98%;">
											         <option value="" selected >请选择任务类型</option>
											         <c:forEach items="${pd.enumJobType}" var="type">
									                     <option value="${type.key}" <c:if test="${pd.JOB_TYPE == type.key}"> selected="selected" </c:if> >${type.value}</option>
                                                     </c:forEach>
		                                          </select>
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;" >任务来源 <span style="color:red; font-size:14px">*</span></td>
											<td>
											<select class="form-control"  name="JOB_SOURCE" id="JOB_SOURCE" style="width:98%;" disabled>
		                                         <c:forEach items="${pd.enumJobSource}" var="source">
                                                       <option value="${source.key}" <c:if test="${pd.JOB_SOURCE == source.key}"> selected="selected" </c:if> >${source.value}</option>
                                                 </c:forEach>
		                                     </select>
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">任务时间</td>
											<td><input class="span10 date-picker" name="GMT_JOB" id="GMT_JOB"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_JOB}" />' type="text" readonly="readonly" style="width:98%;" placeholder="任务时间" title="任务时间"/></
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">提醒时间</td>
											<td><input class="span10 date-picker" name="GMT_REMIND" id="GMT_REMIND"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_REMIND}" />' type="text" readonly="readonly" style="width:98%;" placeholder="提醒时间" title="提醒时间"/></
										</tr>
										<%-- <tr>
										<td style="width:100px;text-align: right;padding-top: 13px;">生成时间:</td>
										 <td><input name="GMT_CREATED" id="GMT_CREATED"  value="${pd.GMT_CREATED}" type="text"   title="生成时间" style="width:98%;" readonly/></td>
									  </tr> --%>
									<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">服务对象姓名</td>
									<td>
									    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${pd.MEMBER_ID}" />
										<input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="${pd.MEMBER_NAME}" readonly="readonly" style="width:78%;"/>
										<!-- <a class="btn btn-mini btn-purple" onclick="chooseResident();">居民菜单</a> -->
										<a class="btn btn-mini btn-purple" onclick="jmxxDate();">居民列表</a>
									</td>
								     </tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">任务状态 <span style="color:red; font-size:14px">*</span></td>
											<td>
										    <select class="form-control"  name="STATUS" id="STATUS" style="width:98%;" disabled>
											         <c:forEach items="${pd.enumTaskStatus}" var="status">
                                                        <option value="${status.key}" <c:if test="${pd.STATUS == status.key}"> selected="selected" </c:if> >${status.value}</option>
                                                     </c:forEach>
		                                     </select>
									      </td>
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
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
	
    });
	//保存
	function save(){
		if($("#JOB_NAME").val()==""){
			$("#JOB_NAME").tips({
				side:3,
	            msg:'请输入任务名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JOB_NAME").focus();
			return false;
		}
		if($("#JOB_TYPE").val()==""){
			$("#JOB_TYPE").tips({
				side:3,
	            msg:'请选择任务类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JOB_TYPE").focus();
			return false;
		}
		 
		//检查日期
		
		if($("#GMT_REMIND").val()!= "" && $("#GMT_JOB").val() != ""){
			var t1 = $("#GMT_REMIND").val();
			var t2 = $("#GMT_JOB").val();
			
			date1 = Number(t1.substr(0,10).replace('-', '').replace('-', ''));
			date2 = Number(t2.substr(0,10).replace('-', '').replace('-', ''));
			time1 = Number(t1.substr(11,5).replace(':', ''));
			time2 = Number(t2.substr(11,5).replace(':', ''));
			
			if(date1-date2>=0){
				if(date1-date2>0){
					$("#GMT_REMIND").tips({
						side:3,
			            msg:'提醒时间必须早于任务时间',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
				}
				if(date1-date2==0){
					if(time1-time2>0){
						$("#GMT_REMIND").tips({
							side:3,
				            msg:'提醒时间必须早于任务时间',
				            bg:'#AE81FF',
				            time:3
				        });
					return false;
					}
			    }
			}
		}

		 /* var member_nameSel=$("#member_id option:selected");
		 
		 alert(member_nameSel.val());   //拿到选中项的值

		 alert(member_nameSel.text());   //拿到选中项的文本 
		 
		 $("#member_name").val(member_nameSel.text()); */
		 
		  
			$("#taskForm").submit();
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
	
	//选择居民
	<%-- function chooseResident(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民信息";
		 diag.URL = '<%=basePath%>	task/getResidentData.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	} --%>
	
	
	//居民列表
	function jmxxDate(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民列表";
		 diag.URL = '<%=basePath%>agreementApply/getJMXX.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
            	var MEMBER_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
            	if(MEMBER_ID!=''){
            		$("#MEMBER_ID").val(MEMBER_ID);
                	$("#MEMBER_NAME").val(diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value);
                	diag.close();
            	}
         };
		 diag.show();
	}
</script>
</html>