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
					
					<form action="departmentinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DEPARTMENTINFO_ID" id="DEPARTMENTINFO_ID" value="${pd.DEPARTMENTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:90px;text-align: right;padding-top: 13px;">科室名称:</td>
								<td><input type="text" name="DEP_NAME" id="DEP_NAME" value="${pd.DEP_NAME}" maxlength="100" placeholder="请选择科室名称" title="科室名称" readonly="readonly" style="width:98%;background-color: #ffffff !important;cursor: pointer"/></td>
							
								<td style="width:90px;text-align: right;padding-top: 13px;">科室编码:</td>
								<td><input type="text" name="DEP_CODE" id="DEP_CODE" value="${pd.DEP_CODE}" maxlength="50" placeholder="请选择科室编码" title="科室编码" readonly="readonly" style="width:98%;background-color: #ffffff !important;cursor: pointer"/></td>
							</tr>
							<tr>
								<td style="width:90px;text-align: right;padding-top: 13px;">医护人员数:</td>
								<td><input type="number" name="NURSE_NUM" id="NURSE_NUM" value="${pd.NURSE_NUM}" maxlength="32" placeholder="这里输入医护人员数" title="医护人员数" style="width:98%;"/></td>
							
								<td style="width:90px;text-align: right;padding-top: 13px;">在岗数:</td>
								<td><input type="number" name="ON_GUARD_NUM" id="ON_GUARD_NUM" value="${pd.ON_GUARD_NUM}" maxlength="32" placeholder="这里输入在岗数" title="在岗数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:90px;text-align: right;padding-top: 13px;">床位数:</td>
								<td><input type="number" name="BED_NUM" id="BED_NUM" value="${pd.BED_NUM}" maxlength="32" placeholder="这里输入床位数" title="床位数" style="width:98%;"/></td>
							
								<td style="width:90px;text-align: right;padding-top: 13px;">空置床位数:</td>
								<td><input type="number" name="FREE_BED_NUM" id="FREE_BED_NUM" value="${pd.FREE_BED_NUM}" maxlength="32" placeholder="这里输入空置床位数" title="空置床位数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:90px;text-align: right;padding-top: 13px;">负责人:</td>
								<td><input type="text" name="PERSON_IN_CHARGE" id="PERSON_IN_CHARGE" value="${pd.PERSON_IN_CHARGE}" maxlength="50" placeholder="这里输入负责人" title="负责人" style="width:98%;"/></td>
							
								<td style="width:90px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="50" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
							
								<td style="width:90px;text-align: right;padding-top: 13px;">排序号:</td>
								<td><input type="number" name="SORT_NUM" id="SORT_NUM" value="${pd.SORT_NUM}" maxlength="32" placeholder="这里输入排序号" title="排序号" style="width:98%;"/></td>
						
								<td style="width:90px;text-align: right;padding-top: 13px;">医院编码:</td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="50" placeholder="这里输入医院编码" title="医院编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:90px;text-align: right;vertical-align: middle">简介:</td>
								<%--<td><input type="text" name="DESCRIBTION" id="DESCRIBTION" value="${pd.DESCRIBTION}" maxlength="255" placeholder="这里输入简介" title="简介" style="width:98%;"/></td> --%>
								<td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;" name="DESCRIBTION" id="DESCRIBTION" rows="3" maxlength="255" placeholder="这里输入简介" title="简介">${pd.DESCRIBTION}</textarea>
                                </td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save('${pd.DEP_CODE}');">保存</a>
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

		$("#DEP_NAME").click(function(){
			top.jzts();
			var Title = "请选择科室名称";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>departmentinfo/chooseDep.do?ORG_CODE='+$("#ORG_CODE").val();
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		});

		$("#DEP_CODE").click(function(){
			top.jzts();
			var Title = "请选择科室编码";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>departmentinfo/chooseDep.do?ORG_CODE='+$("#ORG_CODE").val();
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		})

		//保存
		function save(DEP_CODE) {
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if ($("#DEP_CODE").val() == "" || $("#DEP_CODE").val()=="此科室编码已存在!") {
				_msg = '请输入科室编码';
				selector = $("#DEP_CODE");
			}else if ($("#DEP_NAME").val() == "") {
				selector = $("#DEP_NAME");
				_msg = '请输入科室名称';
			}else if ($("#NURSE_NUM").val() == "") {
				selector = $("#NURSE_NUM");
				_msg = '请输入医护人员数';
			}else if ($("#ON_GUARD_NUM").val() == "") {
				selector = $("#ON_GUARD_NUM");
				_msg = '请输入在岗数';
			}else if ($("#BED_NUM").val() == "") {
				selector = $("#BED_NUM");
				_msg = '请输入床位数';
			}else if ($("#FREE_BED_NUM").val() == "") {
				selector = $("#FREE_BED_NUM");
				_msg = '请输入空置床位数';
			}

			if(_msg != ''){
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});}
			else if($("#DEPARTMENTINFO_ID").val()==""){
				hasC();
			}
			else if($("#DEPARTMENTINFO_ID").val()!=""){
				if(DEP_CODE != $("#DEP_CODE").val())
				{
					hasC();
				}
				else {
					$("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
			}
		}

		//判断疾病编码是否存在
		function hasC(){
			var DEP_CODE = $("#DEP_CODE").val();
			var ORG_CODE = $("#ORG_CODE").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>departmentinfo/hasC.do',
				data: {DEP_CODE:DEP_CODE,ORG_CODE:ORG_CODE},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}else{
						$("#DEP_CODE").css("background-color","#D16E6C");
						setTimeout("$('#DEP_CODE').val('此科室编码已存在!')",500);
					}
				}
			});
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>