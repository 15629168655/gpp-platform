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
					<div class="page-header">
						<h1>机构管理 </h1>
					</div>
					<div class="row">
						<div class="col-xs-12">

							<form action="organization/${msg }.do" class="form-horizontal" name="Form" id="Form" method="post">
								<input type="hidden" name="ORGANIZATION_ID" id="ORGANIZATION_ID" value="${pd.ORGANIZATION_ID}" />
								<input type="hidden" name="msg" id="msg" value="${msg}" />
								<input type="hidden" name="add_success" id="add_success" value="${pd.success}" />
								<input type="hidden" name="ISLEAF" id="ISLEAF" value="${pd.ISLEAF}" />
								<input type="hidden" name="OLD_P_ORG_CODE" id="OLD_P_ORG_CODE" value="${pd.P_ORG_CODE}" />

								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_CODE">组织机构代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="20" placeholder="组织机构代码" title="组织机构代码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_NAME">组织机构名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_NAME" id="ORG_NAME" value="${pd.ORG_NAME}" maxlength="20" placeholder="组织机构名称" title="组织机构名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_LOGIN_CODE">登记号:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_LOGIN_CODE" id="ORG_LOGIN_CODE" value="${pd.ORG_LOGIN_CODE}" maxlength="20" placeholder="登记号" title="登记号">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_NAME2">机构第二名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_NAME2" id="ORG_NAME2" value="${pd.ORG_NAME2}" maxlength="20" placeholder="机构第二名称" title="机构第二名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_CLASSCODE">机构分类代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_CLASSCODE" id="ORG_CLASSCODE" value="${pd.ORG_CLASSCODE}" maxlength="20" placeholder="机构分类代码" title="机构分类代码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_CLASSVALUE">机构分类名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_CLASSVALUE" id="ORG_CLASSVALUE" value="${pd.ORG_CLASSVALUE}" maxlength="20" placeholder="机构分类名称" title="机构分类名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_TYPECODE">机构类型代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_TYPECODE" id="ORG_TYPECODE" value="${pd.ORG_TYPECODE}" maxlength="20" placeholder="机构类型代码" title="机构类型代码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_TYPEVALUE">机构类型名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="ORG_TYPEVALUE" id="ORG_TYPEVALUE" value="${pd.ORG_TYPEVALUE}" maxlength="20" placeholder="机构类型名称" title="机构类型名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="REGIONCODE">行政区划代码:</label>
										<div class="col-sm-8">
											<div class="input-group col-xs-12">
												<input type="text" class="col-sm-11 form-control" name="REGIONCODE" id="REGIONCODE" value="${pd.REGIONCODE}" maxlength="20" placeholder="行政区划代码" title="行政区划代码" readonly="readonly" style="background-color: #ffffff !important;cursor: pointer">
												<span class="input-group-addon" id="regioncode_icon">
													<i class="fa fa-flag"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="REGIONVALUE">行政区划名称:</label>
										<div class="col-sm-8">
											<div class="input-group col-xs-12">
												<input type="text" class="col-sm-11 form-control" name="REGIONVALUE" id="REGIONVALUE" value="${pd.REGIONVALUE}" maxlength="20" placeholder="行政区划名称" readonly="readonly" title="行政区划名称" style="background-color: #ffffff !important;cursor: pointer">
												<span class="input-group-addon" id="regionvalue_icon">
													<i class="fa fa-flag"></i>
												</span>
											</div>
										</div>
									</div>
								</div>


								<div class="form-group">
									<div class="col-xs-12">
										<label class="col-sm-4 control-label no-padding-right" for="ADDRESS" style="width: 16.1%;">地址:</label>
										<div class="col-sm-8" style="width: 83.9%;">
											<input type="text" class="col-sm-12" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="20" placeholder="地址" title="地址">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="TOWN_STREET_CODE">乡镇街道代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="TOWN_STREET_CODE" id="TOWN_STREET_CODE" value="${pd.TOWN_STREET_CODE}" maxlength="20" placeholder="乡镇街道代码" title="乡镇街道代码">
										</div>
									</div>

									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="TOWN_STREET_NAME">乡镇街道名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="TOWN_STREET_NAME" id="TOWN_STREET_NAME" value="${pd.TOWN_STREET_NAME}" maxlength="20" placeholder="乡镇街道名称" title="乡镇街道名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="HOST_UNITCODE">主办单位代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="HOST_UNITCODE" id="HOST_UNITCODE" value="${pd.HOST_UNITCODE}" maxlength="20" placeholder="主办单位代码" title="主办单位代码">
										</div>
									</div>

									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="HOST_UNITVALUE">主办单位名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="HOST_UNITVALUE" id="HOST_UNITVALUE" value="${pd.HOST_UNITVALUE}" maxlength="20" placeholder="主办单位名称" title="主办单位名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="SUP_DEPARTMENTCODE">上级部门代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="SUP_DEPARTMENTCODE" id="SUP_DEPARTMENTCODE" value="${pd.SUP_DEPARTMENTCODE}" maxlength="20" placeholder="上级部门代码" title="上级部门代码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="SUP_DEPARTMENTVALUE">上级部门名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="SUP_DEPARTMENTVALUE" id="SUP_DEPARTMENTVALUE" value="${pd.SUP_DEPARTMENTVALUE}" maxlength="20" placeholder="上级部门名称" title="上级部门名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="RELATIONSCODE">隶属关系代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="RELATIONSCODE" id="RELATIONSCODE" value="${pd.RELATIONSCODE}" maxlength="20" placeholder="隶属关系代码" title="隶属关系代码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="RELATIONSVALUE">隶属关系名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="RELATIONSVALUE" id="RELATIONSVALUE" value="${pd.RELATIONSVALUE}" maxlength="20" placeholder="隶属关系名称" title="隶属关系名称">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="POST_CODE">邮政编码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="POST_CODE" id="POST_CODE" value="${pd.POST_CODE}" maxlength="20" placeholder="邮政编码" title="邮政编码">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="TEL">联系电话:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="TEL" id="TEL" value="${pd.TEL}" maxlength="20" placeholder="联系电话" title="联系电话">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="MAIL">电子邮箱:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="MAIL" id="MAIL" value="${pd.MAIL}" maxlength="20" placeholder="电子邮箱" title="电子邮箱">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="CORP_REPRESENTATIVE">法人代表:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="CORP_REPRESENTATIVE" id="CORP_REPRESENTATIVE" value="${pd.CORP_REPRESENTATIVE}" maxlength="20" placeholder="法人代表" title="法人代表">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="PRINC_PERSON">负责人:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="PRINC_PERSON" id="PRINC_PERSON" value="${pd.PRINC_PERSON}" maxlength="20" placeholder="负责人" title="负责人">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="UNIT_SETUP_TIME">单位成立时间:</label>
										<div class="col-sm-8">
											<div class="input-group col-xs-12">
												<input class="col-sm-11 form-control date-picker" name="UNIT_SETUP_TIME" id="UNIT_SETUP_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.UNIT_SETUP_TIME}" />' type="text" data-date-format="yyyy-mm-dd" placeholder="单位成立时间" title="单位成立时间"/>
												<span class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="UNIT_WEB_SET">单位网站:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="UNIT_WEB_SET" id="UNIT_WEB_SET" value="${pd.UNIT_WEB_SET}" maxlength="20" placeholder="单位网站" title="单位网站">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="PHONETIC_MNEMONIC">拼音助记:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="PHONETIC_MNEMONIC" id="PHONETIC_MNEMONIC" value="${pd.PHONETIC_MNEMONIC}" maxlength="20" placeholder="拼音助记" title="拼音助记">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="ORG_STATUS">机构状态:</label>
										<div class="col-sm-8">
											<select class="form-control" id="ORG_STATUS" name="ORG_STATUS">
												<c:forEach items="${pd.enumOrganizationStatus}" var="item">
													<c:choose>
														<c:when test="${pd.ORG_STATUS == item.key}">
															<option value="${item.key}" selected="selected">${item.value}</option>
														</c:when>
														<c:otherwise>
															<option value="${item.key}">${item.value}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="AUTHOR_ID">注册者ID:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="AUTHOR_ID" id="AUTHOR_ID" value="${pd.AUTHOR_ID}" maxlength="20" placeholder="注册者ID" title="注册者ID">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="AUTHOR_NAME">注册者姓名:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="AUTHOR_NAME" id="AUTHOR_NAME" value="${pd.AUTHOR_NAME}" maxlength="20" placeholder="注册者姓名" title="注册者姓名">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="AUTHOR_DEP_ID">注册者机构标识:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="AUTHOR_DEP_ID" id="AUTHOR_DEP_ID" value="${pd.AUTHOR_DEP_ID}" maxlength="20" placeholder="注册者机构标识" title="注册者机构标识">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="AUTHOR_DEP_NAME">注册者机构名称:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="AUTHOR_DEP_NAME" id="AUTHOR_DEP_NAME" value="${pd.AUTHOR_DEP_NAME}" maxlength="20" placeholder="注册者机构名称" title="注册者机构名称">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="AUTHOR_DEP_CONTACTS">注册者机构联系人:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="AUTHOR_DEP_CONTACTS" id="AUTHOR_DEP_CONTACTS" value="${pd.AUTHOR_DEP_CONTACTS}" maxlength="20" placeholder="注册者机构联系人" title="注册者机构联系人">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="CREATION_TIME">注册时间:</label>
										<div class="col-sm-8">
											<div class="input-group col-xs-12">
												<input class="col-sm-11 form-control date-picker" name="CREATION_TIME" id="CREATION_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.CREATION_TIME}" />' type="text" data-date-format="yyyy-mm-dd" placeholder="注册时间" title="注册时间" />
												<span class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="P_ORG_CODE">上级机构代码:</label>
										<div class="col-sm-8">
											<input type="text" class="col-sm-12" name="P_ORG_CODE" id="P_ORG_CODE" value="${pd.P_ORG_CODE}" maxlength="20" placeholder="上级机构代码" title="上级机构代码">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label class="col-sm-4 control-label no-padding-right" for="HOSPITAL_RANK">医院等级:</label>
										<div class="col-sm-8">
											<select class="form-control" id="HOSPITAL_RANK" name="HOSPITAL_RANK">
												<option value="" selected="selected">&nbsp;</option>
												<c:forEach items="${pd.enumHospitalRank}" var="item">
													<c:choose>
														<c:when test="${pd.HOSPITAL_RANK == item.key}">
															<option value="${item.key}" selected="selected">${item.value}</option>
														</c:when>
														<c:otherwise>
															<option value="${item.key}">${item.value}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<table id="table_report" class="table table-striped table-bordered table-hover">
									<tr>
										<td style="text-align: center;" colspan="10">
											<a class="btn btn-mini btn-primary" onclick="save('${pd.ORG_CODE}','${pd.ORG_LOGIN_CODE}','${pd.P_ORG_CODE}');">保存</a>
											<a class="btn btn-mini btn-danger" onclick="cancel('${pd.ORG_CODE}','${pd.P_ORG_CODE}','${msg}')">取消</a>
										</td>
									</tr>
								</table>
								<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/>
									<h4 class="lighter block green">提交中...</h4></div>
							</form>
						<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/>
							<h4 class="lighter block green"></h4></div>
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
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!-- 添加成功提示框 -->
		<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
		<script type="text/javascript">
			$(top.hangge());

			<%--$('#zhongxin2').on('shown.bs.modal', function () {--%>
			<%--window.location.href="<%=basePath%>
			organization / listAllOrg.do ? ORG_CODE = AAA ";--%>
			<%--})--%>

			$(document).ready(function() {
				//注册区划输入框监听函数
				document.getElementById("REGIONVALUE").onclick = chooseQH;
				document.getElementById("REGIONCODE").onclick = chooseQH;
				document.getElementById("regioncode_icon").onclick = chooseQH;
				document.getElementById("regionvalue_icon").onclick = chooseQH;

				if ($("#msg").val() == "save" && $("#P_ORG_CODE").val() != "") {
					$("#P_ORG_CODE").attr("readonly", "readonly");
					$("#P_ORG_CODE").css("color", "gray");
				}
//				if ($("#msg").val() == "save") {
//					$("#anniu").hide();
//				}
			});
			//保存
			function save(ORG_CODE, ORG_LOGIN_CODE, P_ORG_CODE) {
				var _side = 3,
					_msg = '',
					_bg = '#AE81FF',
					_time = 2;
				var selector = null;
				if ($("#ORG_CODE").val() == "" || $("#ORG_CODE").val() == "此组织机构代码已存在!") {
					_msg = '请输入组织机构代码';
					selector = $("#ORG_CODE");
				} else if ($("#ORG_NAME").val() == "") {
					selector = $("#ORG_NAME");
					_msg = '请输入组织机构名称';
				} else if ($("#ORG_LOGIN_CODE").val() == "" || $("#ORG_LOGIN_CODE").val() == "此登记号已存在!") {
					selector = $("#ORG_LOGIN_CODE");
					_msg = '请输入登记号';
				} else if ($("#TEL").val() != "" && !(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#TEL").val()))) {
					selector = $("#TEL");
					_msg = '请输入正确格式的联系电话';
				} else if ($("#MAIL").val() != "" && !(/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test($("#MAIL").val()))) {
					selector = $("#MAIL");
					_msg = '请输入正确格式的电子邮箱';
				} else if ($("#POST_CODE").val() != "" && !(/[1-9]\d{5}(?!\d)/.test($("#POST_CODE").val()))) {
					selector = $("#POST_CODE");
					_msg = '请输入正确格式的邮政编码';
				}

				if (_msg != '') {
					selector.focus();
					selector.tips({
						side: _side,
						msg: _msg,
						bg: _bg,
						time: _time
					});
				} else if ($("#ORGANIZATION_ID").val() == "") {
					hasORG_CODE();
					hasORG_LOGIN_CODE();
				} else if ($("#ORGANIZATION_ID").val() != "") {
					if (ORG_CODE != $("#ORG_CODE").val() || ORG_LOGIN_CODE != $("#ORG_LOGIN_CODE").val()) {
						if (ORG_CODE != $("#ORG_CODE").val()) {
							hasORG_CODE();
						} else {
							hasORG_LOGIN_CODE();
						}
					} else {
						if (P_ORG_CODE != $("#P_ORG_CODE").val()) {
							$('#add_success').val("edit_P_ORG_CODE");
						}
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}
				}
			}

			//区划弹窗
			function chooseQH(){
				top.jzts();
				var Title = "请选择行政区划名称";
				var diag = new top.Dialog();
				diag.Drag = true;
				diag.Title = Title;
				diag.URL = '<%=basePath%>/organization/chooseQH.do';
				diag.Width = 330;
				diag.Height = 450;
				diag.CancelEvent = function(){ //关闭事件
					diag.close();
				};
				diag.show();
			}

			//判断组织机构代码是否存在
			function hasORG_CODE() {
				var ORG_CODE = $("#ORG_CODE").val();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>organization/hasORG_CODE.do',
					data: {
						ORG_CODE: ORG_CODE
					},
					dataType: 'json',
					cache: false,
					success: function(data) {
						if ("success" == data.result) {
							$("#Form").submit();
							$("#zhongxin").hide();
							$("#zhongxin2").show();
						} else {
							$("#ORG_CODE").css("background-color", "#D16E6C");
							setTimeout("$('#ORG_CODE').val('此组织机构代码已存在!')", 500);
						}
					}
				});
			}

			//判断登记号是否存在
			function hasORG_LOGIN_CODE() {
				var ORG_LOGIN_CODE = $("#ORG_LOGIN_CODE").val();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>organization/hasORG_LOGIN_CODE.do',
					data: {
						ORG_LOGIN_CODE: ORG_LOGIN_CODE
					},
					dataType: 'json',
					cache: false,
					success: function(data) {
						if ("success" == data.result) {
							$("#Form").submit();
							$("#zhongxin").hide();
							$("#zhongxin2").show();
						} else {
							$("#ORG_LOGIN_CODE").css("background-color", "#D16E6C");
							setTimeout("$('#ORG_LOGIN_CODE').val('此登记号已存在!')", 500);
						}
					}
				});
			}

			//取消
			function cancel(ORG_CODE, P_ORG_CODE, msg) {
				top.jzts();
				if (msg == "save") {
					window.location.href = "<%=basePath%>organization/goEdit.do?ORG_CODE=" + P_ORG_CODE;
				} else {
					window.location.href = "<%=basePath%>organization/goEdit.do?ORG_CODE=" + ORG_CODE;
				}
			}

			$(function() {
				//日期框
				$('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true
				}).next().on(ace.click_event, function () {
					$(this).prev().focus();
				});

				if ($('#add_success').val() == 'success') {
					bootbox.alert("添加成功", function() {
						$('li #z64 a', window.parent.parent.parent.document).trigger('click');
					});
					setTimeout("autoclick()",2000);
				}
			});

			//弹出框自动点击菜单“机构管理”
			function autoclick() {
				$('li #z64 a', window.parent.parent.parent.document).trigger('click');
			}
		</script>
</body>

</html>