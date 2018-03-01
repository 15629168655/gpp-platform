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
	<link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
	<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
										
					<form action="departments/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DEPARTMENTS_ID" id="DEPARTMENTS_ID" value="${pd.DEPARTMENTS_ID}"/>
						<input type="hidden" name="msg" id="msg" value="${msg}"/>
						<input type="hidden" name="add_success" id="add_success" value="${pd.success}"/>
						<input type="hidden" name="ISLEAF" id="ISLEAF" value="${pd.ISLEAF}" />
						<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/>
						<input type="hidden" name="OLD_PARENT_DEP_ID" id="OLD_PARENT_DEP_ID" value="${pd.PARENT_DEP_ID}" />
						<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
						    <tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">科室标识:</td>
								<td><input type="text" name="DEP_ID" id="DEP_ID" value="${pd.DEP_ID}" maxlength="50" placeholder="科室标识" title="科室标识" style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">工作地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="200" placeholder="工作地址" title="工作地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">科室名称:</td>
								<td><input type="text" name="DEP_NAME" id="DEP_NAME" value="${pd.DEP_NAME}" maxlength="100" placeholder="科室名称" title="科室名称" style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">工作联系方式:</td>
								<td><input type="text" name="TELECOM" id="TELECOM" value="${pd.TELECOM}" maxlength="100" placeholder="工作联系电话" title="工作联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">科室角色名称:</td>
								<td><input type="text" name="DEP_ROLE_NAME" id="DEP_ROLE_NAME" value="${pd.DEP_ROLE_NAME}" maxlength="100" placeholder="科室角色名称" title="科室角色名称" style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">上级科室标识:</td>
								<td><input type="text" name="PARENT_DEP_ID" id="CHOOSE_DEP_ID" value="${pd.PARENT_DEP_ID}" maxlength="50" placeholder="上级科室标识" readonly="readonly" title="上级科室标识" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">科室类别编码:</td>
								<td><input type="text" name="DEP_TYPE_CODE" id="DEP_TYPE_CODE" value="${pd.DEP_TYPE_CODE}" maxlength="50" placeholder="科室类别编码" title="科室类别编码"   style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">上级科室名称:</td>
								<td><input type="text" name="PARENT_DEP_NAME" id="CHOOSE_DEP_NAME" value="${pd.CHOOSE_DEP_NAME}" maxlength="100" placeholder="上级科室名称" readonly="readonly" title="上级科室名称"   style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">科室类别名称:</td>
								<td><input type="text" name="DEP_TYPE_NAME" id="DEP_TYPE_NAME" value="${pd.DEP_TYPE_NAME}" maxlength="100" placeholder="科室类别名称" title="科室类别名称"  style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">角色状态:</td>
							    <td>
									<select name="ROLE_STATUS" title="角色状态" style="width:98%;">
									<option value="1" <c:if test="${pd.ROLE_STATUS == '1' }">selected</c:if> >正常</option>
									<option value="0" <c:if test="${pd.ROLE_STATUS == '0' }">selected</c:if> >注销</option>
									<option value="2" <c:if test="${pd.ROLE_STATUS == '2' }">selected</c:if> >其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">委拖人ID:</td>
								<td><input type="text" name="AUTHOR_ID" id="AUTHOR_ID" value="${pd.AUTHOR_ID}" maxlength="50" placeholder="委拖人ID" title="委拖人ID" style="width:98%;"/></td>
							
								<td style="width:125px;text-align: right;padding-top: 13px;">角色有效期间:</td>
								<td><input type="text" name="EFFECTIVE_TIME_LOW" id="EFFECTIVE_TIME_LOW" value="${pd.EFFECTIVE_TIME_LOW}" maxlength="20" placeholder="角色有效期间(20100101)" title="角色有效期间(20100101)" style="width:98%;"/></td>
							</tr>
							<tr>	
								<td style="width:125px;text-align: right;padding-top: 13px;">委拖人名称:</td>
								<td><input type="text" name="AUTHOR_NAME" id="AUTHOR_NAME" value="${pd.AUTHOR_NAME}" maxlength="50" placeholder="委拖人名称" title="委拖人名称" style="width:98%;"/></td>
							
								<td style="width:125px;text-align: right;padding-top: 13px;">角色有效期间:</td>
								<td><input type="text" name="EFFECTIVE_TIME_HIGH" id="EFFECTIVE_TIME_HIGH" value="${pd.EFFECTIVE_TIME_HIGH}" maxlength="20" placeholder="角色有效期间(20501231)" title="角色有效期间(20501231)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">委拖人科室标识:</td>
								<td><input type="text" name="AUTHOR_DEP_ID" id="AUTHOR_DEP_ID" value="${pd.AUTHOR_DEP_ID}" maxlength="50" placeholder="委拖人科室标识" title="委拖人科室标识" style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">注册时间:</td>
								<td><input class="span10 date-picker" name="CREATION_TIME" id="CREATION_TIME" value="${pd.CREATION_TIME}" type="text" data-date-format="yyyy-mm-dd" placeholder="注册时间(20130116112855)" title="注册时间(20130116112855)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">委拖人科室名称:</td>
								<td><input type="text" name="AUTHOR_DEP_NAME" id="AUTHOR_DEP_NAME" value="${pd.AUTHOR_DEP_NAME}" maxlength="100" placeholder="委拖人科室名称" title="委拖人科室名称" style="width:98%;"/></td>
							
								<td style="width:125px;text-align: right;padding-top: 13px;">所属机构标识:</td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="50" placeholder="所属机构标识" readonly="readonly" title="所属机构标识" style="width:98%;"/></td>
							
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">委拖人科室联系人:</td>
								<td><input type="text" name="AUTHOR_DEP_CONTACTS" id="AUTHOR_DEP_CONTACTS" value="${pd.AUTHOR_DEP_CONTACTS}" maxlength="50" placeholder="委拖人科室联系人" title="委拖人科室联系人" style="width:98%;"/></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">是否是树叶节点:</td>
							    <td><input type="text" name="ISLEAF" id="ISLEAF" value="${pd.ISLEAF}" maxlength="50" placeholder="默认是叶节点，值为1" readonly="readonly" title="叶节点" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save('${pd.DEP_ID}');">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
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
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 删除时确认窗口 -->
	<!--  script src="static/ace/js/bootbox.js"></script>-->
	<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			
			//注册上级科室标识和上级科室名称输入框监听函数
			//document.getElementById("PARENT_DEP_ID").onclick = chooseSJKS;
			//document.getElementById("CHOOSE_DEP_NAME").onclick = chooseSJKS;
			var org_code = $("#ORG_CODE").val();
			$("#CHOOSE_DEP_ID").click(function(){  
				chooseSJKS(org_code);
			});
			
			$("#CHOOSE_DEP_NAME").click(function(){  
				chooseSJKS(org_code);
			});
		
			if($("#DEP_ID").val() != ""){
				$("#DEP_ID").attr("readonly","readonly");
				$("#DEP_ID").css("color","gray");
			}
			//if($("#msg").val()=="save"){
				//$("#anniu").hide();
			//}
		});
		 
		
		//保存
		function save(DEP_ID){
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if ($("#DEP_ID").val() == "" || $("#DEP_ID").val()=="此科室标识已存在!" ) {
				_msg = '请输入科室标识';
				selector = $("#DEP_ID");
			}else if ($("#DEP_NAME").val() == "") {
				selector = $("#DEP_NAME");
				_msg = '请输入科室名称';
			}else if ($("#CHOOSE_DEP_ID").val() == "") {
				selector = $("#CHOOSE_DEP_ID");
				_msg = '请选择上级科室标识';
			}
			else if ($("#CHOOSE_DEP_NAME").val() == "") {
				selector = $("#CHOOSE_DEP_NAME");
				_msg = '请选择上级科室名称';
			}else if ($("#TELECOM").val() != ""&& !(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#TELECOM").val())) ){
				    selector = $("#TELECOM");
				   _msg = '请输入正确联系电话';
			}
			
			if(_msg != ''){
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});
			}else if($("#DEPARTMENTS_ID").val()==""){
				hasDEP_ID();
			}
			else if($("#DEPARTMENTS_ID").val()!=""){
					if(DEP_ID != $("#DEP_ID").val()){
						hasDEP_ID();
					}else{
						if (PARENT_DEP_ID != $("#CHOOSE_DEP_ID").val()) {
							$('#add_success').val("edit_PARENT_DEP_ID");
						}
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
				    }
			}
		}
		
		//上级科室弹窗
		function chooseSJKS(ORG_CODE){
			top.jzts();
			var Title = "请选择上级科室标识";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>/departments/chooseKS.do?ORG_CODE='+ORG_CODE;
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}
		
		//判断科室标识是否存在
		function hasDEP_ID(){
			var DEP_ID = $("#DEP_ID").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>departments/hasDEP_ID.do',
				data: {DEP_ID:DEP_ID},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}else{
						$("#DEP_ID").css("background-color","#D16E6C");
						setTimeout("$('#DEP_ID').val('此科室标识已存在!')",500);
					}
				}
			});
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			}).next().on(ace.click_event, function () {
				$(this).prev().focus();
			});
		});
		</script>
</body>
</html>