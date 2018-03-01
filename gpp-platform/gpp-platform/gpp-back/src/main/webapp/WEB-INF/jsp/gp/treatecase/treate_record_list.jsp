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
<!-- 居民信息页面 -->
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
						<!-- 检索  -->
						<form action="treateCaseRecord/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="user_name" type="text" name="user_name" value="${pd.user_name }" placeholder="居民姓名" />
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="mi_card" type="text" name="mi_card" value="${pd.mi_card }" placeholder="医保卡号" />
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="id_number" type="text" name="id_number" value="${pd.id_number }" placeholder="身份证号" />
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="sign_apply_time" id="sign_apply_time"  value="${pd.sign_apply_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="签约日期" title="签约日期"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="is_sign" id="is_sign" data-placeholder="协议状态" style="vertical-align:top;width: 120px;">
									<option style="width: 120px;" value="">签约状态</option>
									<option value="0" <c:if test="${pd.is_sign == '0' }">selected</c:if> >未签约</option>
									<option value="1" <c:if test="${pd.is_sign == '1' }">selected</c:if> >待审核</option>
									<option value="2" <c:if test="${pd.is_sign == '2' }">selected</c:if> >已签约</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="processing_status" id="processing_status" data-placeholder="加急状态" style="vertical-align:top;width: 120px;">
									<option style="width: 120px;" value="">加急状态</option>
									<option value="1" <c:if test="${pd.PROCESSING_STATUS == '1' }">selected</c:if> >立即</option>
									<option value="2" <c:if test="${pd.PROCESSING_STATUS == '2' }">selected</c:if> >优先</option>
									<option value="3" <c:if test="${pd.PROCESSING_STATUS == '3' }">selected</c:if> >尽快</option>
									<option value="4" <c:if test="${pd.PROCESSING_STATUS == '4' }">selected</c:if> >普通</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="zdrq" id="zdrq" data-placeholder="重点人群" style="vertical-align:top;width: 120px;">
									<option style="width: 120px;" value="">重点人群</option>
									<option value="1" <c:if test="${pd.ZDRQ == '1' }">selected</c:if> >是</option>
									<option value="2" <c:if test="${pd.ZDRQ == '2' }">selected</c:if> >否</option>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<div class="col-xs-6" contentEditable="true">
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">姓名</th>
									<th class="center">性别</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>出生日期</th>
									<th class="center">重点人群</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty jmxxList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${jmxxList }" var="jmxxList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${jmxxList.USER_AGENT_ID }" id="${user.USER_AGENT_ID }" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class='center' style="width: 30px;"  onclick="showCase('${jmxxList.USER_AGENT_ID}')">${vs.index+1}</td>
											
											<td class='center' style="width: 140px;"  onclick="showCase('${jmxxList.USER_AGENT_ID}')">
												${jmxxList.USER_NAME }
											</td>
											<td style="width: 60px;" class="center"  onclick="showCase('${jmxxList.USER_AGENT_ID}')">
												<c:if test="${jmxxList.SEX == '1' }"><span>男</span></c:if>
												<c:if test="${jmxxList.SEX == '2' }"><span>女</span></c:if>
											</td>
											<td class="center"  onclick="showCase('${jmxxList.USER_AGENT_ID}')"><fmt:formatDate pattern="yyyy-MM-dd"  value="${jmxxList.BIRTHDAY_TIME }"/></td>
											<td class="center" onclick="showCase('${jmxxList.USER_AGENT_ID}')" >
												<c:if test="${jmxxList.ZDRQ == '2' }"><span>否</span></c:if>
												<c:if test="${jmxxList.ZDRQ == '1' }"><span>是</span></c:if>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						 	
						</div>
						<div  class="col-xs-6" contentEditable="true">
 							<table id="showCaseRecord" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
 								<thead>
									<tr>
										<th class="center" style="width:35px;">
											<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
										</th>
										<th class="center" style="width:50px;">序号</th>
										<th class="center">方案名称</th>
										<th class="center">人群类型</th>
										<th class="center">状态</th>
										<th class="center">方案医生</th>
										<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>方案时间</th>
									</tr>
								</thead>
								<tbody>
									<tr></tr>
								</tbody>
 							</table>
 						</div>
 						
						</form>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();">
												<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增
										</a>
										<!-- <a class="btn btn-mini btn-success" onclick="add();">新增</a> -->
									</c:if>
									<c:if test="${QX.del == 1 }">
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
									</c:if>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
		});
		
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
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#user_name").val("");
			$("#mi_card").val("");
			$("#id_number").val("");
			$("#sign_apply_time").val("");
			$("#is_sign").find("option:selected").attr("selected",false);
			$("#is_sign").find("option[text='']").attr("selected",true);
			$("#processing_status").find("option:selected").attr("selected",false);
			$("#processing_status").find("option[text='']").attr("selected",true);
		}
		//给居民添加治疗方案
		function add() {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="给居民添加治疗方案";
			 diag.URL = '<%=basePath%>treateCase/addCase.do';
			 diag.Width = 800;
			 diag.Height = 1000;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		//显示详情
		function showCase(RESIDENT_ID) {
			$.ajax({
				type:"post",
				url : '<%=basePath%>treateCaseRecord/dataCase?RESIDENT_ID='+RESIDENT_ID,
				data: {"RESIDENT_ID":RESIDENT_ID},
				datatype:"json",
				success:function(data){
					if(data.varList.length != 0){
						$("#showCaseRecord tbody").html("");
						var tddata = data.varList;//治疗方案列表
						var length = tddata.length;
						for(var i = 0; i < length; i ++) {
							var residentType;
							if(tddata[i].PEOPLE_TYPE == 0) {
								residentType = "糖尿病";
							}
							else if(tddata[i].PEOPLE_TYPE == 1) {
								residentType = "高血压";
							}
							else if(tddata[i].PEOPLE_TYPE == 2) {
								residentType = "心脏病";
							}
							else if(tddata[i].PEOPLE_TYPE == 3) {
								residentType = "脑卒中";
							}
							else if(tddata[i].PEOPLE_TYPE == 4) {
								residentType = "肺结核";
							}
							var state;
							if(tddata[i].IMPL_STATE == 0) {
								state = "未执行";
							}
							else if(tddata[i].IMPL_STATE == 1){
								state = "执行中";
							}
							else {
								state = "完结";
							}
							item = "<tr>"+
							    "<td class='center' style='width: 30px;' ><label><input type='checkbox' name='ids' value='"+tddata[i].TREATE_ID+"' id='"+tddata[i].TREATE_ID+"' class='ace'/><span class='lbl'></span></label></td>"+
								"<td class='center'>"+(i+1)+"</td>"+
								"<td class='center' onclick=\"showInfo('" +tddata[i].CASE_ID+"')\">"+//治疗类型
									tddata[i].CASE_NAME+
								"</td>"+
								"<td class='center' onclick=\"showInfo('" +tddata[i].CASE_ID+"')\">"+//居民类型
									residentType+
								"</td>"+
								"<td class='center' onclick=\"showInfo('" +tddata[i].CASE_ID+"')\">"+//方案状态
									state+
								"</td>"+
								"<td class='center' onclick=\"showInfo('" +tddata[i].CASE_ID+"')\">"+//方案医生姓名
									tddata[i].PROVIDER_NAME+
								"</td>"+
								"<td class='center' onclick=\"showInfo('" +tddata[i].CASE_ID+"')\">"+//方案开始时间
									tddata[i].START_TIME+
								"</td>"+
								"</tr>";
							$("#showCaseRecord tbody").append(item);
						}
					}
					else {
						$("#showCaseRecord tbody").html("");
						item="<tr class='main_info'><td colspan='100' class='center' >没有相关诊疗方案</td></tr>";
						$("#showCaseRecord").append(item);
					}
						
				}
				})
		}
		
		function showInfo(CASE_ID) {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="方案内容";
			 diag.URL = '<%=basePath%>treateCaseRecord/caseInfo.do?CASE_ID='+CASE_ID;
			 diag.Width = 800;
			 diag.Height = 1000;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		
		
		

		


		</script>
</html>

