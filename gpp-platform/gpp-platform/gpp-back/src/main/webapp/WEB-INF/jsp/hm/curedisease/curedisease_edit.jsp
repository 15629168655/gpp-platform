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
	<%--<link rel="stylesheet" href="static/ace/css/datepicker.css" />--%>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="page-header">
					<h1>主治疾病配置 </h1>
				</div>
				<div class="row">
					<div class="col-xs-12">
					
					<form action="curedisease/${msg }.do" name="Form" id="Form" class="form-horizontal" method="post">
						<input type="hidden" name="CUREDISEASE_ID" id="CUREDISEASE_ID" value="${pd.CUREDISEASE_ID}"/>
						<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/>
						<input type="hidden" name="DISEASE_NAME" id="DISEASE_NAME" value="${pd.DISEASE_NAME}"/>
						<input type="hidden" name="DISEASE_TYPE" id="DISEASE_TYPE" value="${pd.DISEASE_TYPE}"/>

						<div class="form-group">
							<div class="col-xs-12 col-sm-12">
								<label class="col-sm-4 control-label no-padding-right" for="DISEASE_CODE">疾病编码:</label>
								<div class="col-sm-8">
									<input type="text" name="DISEASE_CODE" class="col-sm-12" id="DISEASE_CODE" value="${pd.DISEASE_CODE}" maxlength="50" placeholder="这里输入疾病编码" title="疾病编码" style="width:100%;"/>
								</div>
							</div>
						</div>

						<br/>
						<div class="form-group">
							<div class="clearfix form-actions" style="width:90%; margin:0 auto;">
								<div class="col-md-offset-3 col-md-9" style='text-align:center;'>
									<button class="btn btn-info" type="button" onclick="save('${pd.DISEASE_CODE}');">
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(DISEASE_CODE) {
			var _side = 3,
					_msg = '',
					_bg = '#AE81FF',
					_time = 2;
			var selector = null;
			var treeObj = parent[0][1].$.fn.zTree.getZTreeObj("leftTree");
			var nodes = treeObj.getSelectedNodes();
			if ($("#DISEASE_CODE").val() == "" || $("#DISEASE_CODE").val() == "此疾病编码已存在!" || $("#DISEASE_CODE").val() == "疾病编码表中不存在此疾病编码!") {
				_msg = '请输入疾病编码';
				selector = $("#DISEASE_CODE");
			}

			if (_msg != '') {
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});
			}else if($("#CUREDISEASE_ID").val()==""){
				hasC();
			}
			else if($("#CUREDISEASE_ID").val()!=""){
				if(DISEASE_CODE != $("#DISEASE_CODE").val())
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
			var DISEASE_CODE = $("#DISEASE_CODE").val();
			var ORG_CODE = $("#ORG_CODE").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>curedisease/hasC.do',
				data: {DISEASE_CODE:DISEASE_CODE,ORG_CODE:ORG_CODE},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}else if("error" == data.result){
						$("#DISEASE_CODE").css("background-color","#D16E6C");
						setTimeout("$('#DISEASE_CODE').val('此疾病编码已存在!')",500);
					}else{
						$("#DISEASE_CODE").css("background-color","#D16E6C");
						setTimeout("$('#DISEASE_CODE').val('疾病编码表中不存在此疾病编码!')",500);
					}
				}
			});
		}

		</script>
</body>
</html>