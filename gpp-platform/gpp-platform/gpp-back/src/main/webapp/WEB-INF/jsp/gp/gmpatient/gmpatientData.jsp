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
						<!-- 检索  -->
						<form action="gmpatient/getPersonData.do" method="post" name="patientForm" id="patientForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="XM" value="${pd.XM }" placeholder="请输入姓名" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="birthStart" id="birthStart"  value="${pd.birthStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="出生日期起" title="出生日期开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="birthEnd" id="birthEnd"  value="${pd.birthEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="出生日期止" title="出生日期结束"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="XB" id="xb" data-placeholder="性别" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.XB == '0' }">selected</c:if> >未知性别</option>
									<option value="1" <c:if test="${pd.XB == '1' }">selected</c:if> >男</option>
									<option value="2" <c:if test="${pd.XB == '2' }">selected</c:if> >女</option>
									<option value="9" <c:if test="${pd.XB == '9' }">selected</c:if> >未说明性别</option>
								  	</select>
								</td>
								<td>
								<div class="nav-search">
								<span class="input-icon">
							   <input class="nav-search-input" autocomplete="off" type="text" name="JKKH" value="${pd.JKKH }" placeholder="请输入健康卡号" />
								</span>
								</div>
								</td>
								<td>
								<div class="nav-search">
								<span class="input-icon">
							   <input class="nav-search-input" autocomplete="off" type="text" name="ZJHM" value="${pd.ZJHM }" placeholder="请输入证件号码" />
								</span>
								</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" onclick="selectAll()" style="width:35px;">
									<label class="pos-rel">
									<span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">健康卡号</th>
									<th class="center">姓名</th>
									<th class="center">性别</th>	
									<th class="center">证件号码</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>出生日期</th>
									<th class="center">电话号码</th>
									<th class="center">居住地址</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty patientList}">
									<c:forEach items="${patientList}" var="patient" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='radio' name='ids' value="${patient.XM }" id="${patient.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${patient.JKKH }</td>
											<td class="center">${patient.XM }</td>
											<td class="center">
											<c:if test="${patient.XB == '0' }">未知性别</c:if>
											<c:if test="${patient.XB == '1' }">男</c:if>
											<c:if test="${patient.XB == '2' }">女</c:if>
											<c:if test="${patient.XB == '9' }">未说明性别</c:if>
											</td>
											<td class="center">${patient.ZJHM }</td>			
											<td class="center">${patient.CSRQ }
											</td>
											<td class="center">${patient.DHHM }</td>
											<td class="center">${patient.JZDZ }</td>
										</tr>
									</c:forEach>
									
								</c:when>
								
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-mini btn-success" onclick="choose();">确认选择</a>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
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
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//检索
		function searchs(){
			
			//检查日期
			function checkTime(){ 
				
			    var startTime=$("#birthStart").val();  
				
			    var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
			    
			    var endTime=$("#birthEnd").val();  
			    
			    var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
			    
			    if(end<start){  
			        return false;  
			    }  
			    return true;  
			} 
			if(!checkTime()){  
			    alert("出生日期止必须晚于出生日期起！");  
			    return;  
			}
			
			top.jzts();
			$("#patientForm").submit();
		}
	
		
		function choose(){
			var pid="";
			var pname="";
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					pid=document.getElementsByName('ids')[i].id;
					pname=document.getElementsByName('ids')[i].value;
				}
			}
			 var iframe = $("#_DialogFrame_0",parent.document);
				  	iframe.contents().find("#PATIENT_ID").val(pid);
				 	iframe.contents().find("#PATIENT_NAME").val(pname);
			        top.Dialog.close();
		}
		

		</script>
</html>
