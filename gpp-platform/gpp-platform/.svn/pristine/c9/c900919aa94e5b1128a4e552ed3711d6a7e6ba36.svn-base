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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="page-header">
					<h1>业务流程配置 </h1>
				</div>
				<div class="row">
					<div class="col-xs-12">
					
					<form action="workflow/${msg }.do" name="Form" id="Form" class="form-horizontal" method="post">
						<input type="hidden" name="WORKFLOW_ID" id="WORKFLOW_ID" value="${pd.WORKFLOW_ID}"/>
						<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/>
						<input type="hidden" name="SIGN_ORG_RANK" id="SIGN_ORG_RANK" value="${pd.SIGN_ORG_RANK}"/>

						<div class="form-group">
							<div class="col-xs-12 col-sm-12">
								<label class="col-sm-4 control-label no-padding-right" for="SIGN_ORG_CODE">签约机构编码:</label>
								<div class="col-sm-8">
									<div class="input-group col-xs-12">
										<input type="text" name="SIGN_ORG_CODE" class="col-sm-11 form-control" id="SIGN_ORG_CODE" value="${pd.SIGN_ORG_CODE}" maxlength="50" readonly="readonly" placeholder="这里输入签约机构编码" title="签约机构编码" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="orgcode">
											<i class="fa fa-flag"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-12">
								<label class="col-sm-4 control-label no-padding-right" for="SIGN_ORG_NAME">签约机构名称:</label>
								<div class="col-sm-8">
									<div class="input-group col-xs-12">
										<input type="text" class="col-sm-11 form-control" name="SIGN_ORG_NAME" id="SIGN_ORG_NAME" value="${pd.SIGN_ORG_NAME}" maxlength="100" readonly="readonly" placeholder="这里输入签约机构名称" title="签约机构名称" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="orgname">
											<i class="fa fa-flag"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-12">
								<label class="col-sm-4 control-label no-padding-right" for="REFERRAL_TYPE">转诊类型:</label>
								<div class="col-sm-8">
									<select class="form-control" id="REFERRAL_TYPE" name="REFERRAL_TYPE">
										<c:forEach items="${pd.enumReferralType}" var="item">
											<c:choose>
												<c:when test="${pd.REFERRAL_TYPE == item.key}">
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
						<br/>
						<div class="form-group">
							<div class="clearfix form-actions" style="width:90%; margin:0 auto;">
								<div class="col-md-offset-3 col-md-9" style='text-align:center;'>
									<button class="btn btn-info" type="button" onclick="save('${pd.SIGN_ORG_CODE}');">
										<i class="ace-icon fa fa-check bigger-110"></i>
										保存
									</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-danger" type="button" onclick="top.Dialog.close();">
										<i class="ace-icon glyphicon glyphicon-remove bigger-110"></i>
										取消
									</button>
								</div>
							</div>
						</div>

						<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/>
						<h4 class="lighter block green">提交中...</h4></div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		$(document).ready(function() {
			document.getElementById("SIGN_ORG_CODE").onclick = chooseJG;
			document.getElementById("SIGN_ORG_NAME").onclick = chooseJG;
			document.getElementById("orgcode").onclick = chooseJG;
			document.getElementById("orgname").onclick = chooseJG;
		});
		//保存
		function save(SIGN_ORG_CODE) {
			var _side = 3,
					_msg = '',
					_bg = '#AE81FF',
					_time = 2;
			var selector = null;
//			var treeObj = parent[0][1].$.fn.zTree.getZTreeObj("leftTree");
//			var nodes = treeObj.getSelectedNodes();
			if ($("#SIGN_ORG_CODE").val() == "" || $("#SIGN_ORG_CODE").val() == "此签约机构已存在!") {
				_msg = '请选择签约机构代码';
				selector = $("#SIGN_ORG_CODE");
			} else if ($("#REFERRAL_TYPE").val() == "") {
				selector = $("#REFERRAL_TYPE");
				_msg = '请选择转诊类型';
//			} else if (nodes[0].id == $("#SIGN_ORG_CODE").val()){
			} else if ($("#ORG_CODE").val() == $("#SIGN_ORG_CODE").val()){
				_msg = '不能选择自己';
				selector = $("#SIGN_ORG_CODE");
			} else if ($("#SIGN_ORG_NAME").val() == "全部"){
				_msg = '不能选择全部';
				selector = $("#SIGN_ORG_NAME");
			}

			if (_msg != '') {
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});
			}else if($("#WORKFLOW_ID").val()==""){
				hasC();
			}
			else if($("#WORKFLOW_ID").val()!=""){
				if(SIGN_ORG_CODE != $("#SIGN_ORG_CODE").val())
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

		//判断签约机构编码是否存在
		function hasC(){
			var SIGN_ORG_CODE = $("#SIGN_ORG_CODE").val();
			var ORG_CODE = $("#ORG_CODE").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>workflow/hasC.do',
				data: {SIGN_ORG_CODE:SIGN_ORG_CODE,ORG_CODE:ORG_CODE},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}else{
						$("#SIGN_ORG_CODE").css("background-color","#D16E6C");
						setTimeout("$('#SIGN_ORG_CODE').val('此签约机构已存在!')",500);
					}
				}
			});
		}

		//签约机构弹窗
		function chooseJG(){
//			top.jzts();
			var Title = "请选择签约机构";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>/workflow/chooseJG.do';
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}

		</script>
</body>
</html>