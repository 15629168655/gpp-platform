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
<!-- 弹出新增页面 -->
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
						<form action="blfyypgl/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="id" value="${pd.ID }"/>   						<!-- ID -->
							<input type="hidden" name="DRUG_ID" id="drug_id" value="${pd.DRUG_ID }"/>			<!-- 药品ID -->
							<input type="hidden" name="PATIENT_ID" id="patient_id" value="${pd.PATIENT_ID }"/>	<!-- 患者ID -->
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:94px;text-align: right;padding-top: 13px;">药品名称<span class="red">*</span>:</td>
									<td><input type="text" name="DRUG_NAME" id="drug_name" value="${pd.DRUG_NAME }" placeholder="点击这里录入药品名称" title="名称" readonly="readonly" style="width:98%;" onclick="luRuYP();"/>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">患者姓名<span class="red">*</span>:</td>
									<td><input type="text" name="PATIENT_NAME" id="patient_name" value="${pd.PATIENT_NAME }" placeholder="点击这里录入患者姓名" title="患者姓名" readonly="readonly" style="width:98%;" onclick="luRuHZ();"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">就诊流水号<span class="red">*</span>:</td>
									<td><input type="text" name="MZJZLSH" id="mzjzlsh" value="${pd.MZJZLSH }" placeholder="门诊就诊流水号" maxlength="40" title="门诊就诊流水号" style="width:98%;" /></td>
								</tr>
								<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">类别:</td>
									<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="CATEGORY" id="category" data-placeholder="类别" style="vertical-align:top;width: 98%;">
									<c:forEach items="${pd.enumBlfyypglLB}" var="item">
                                        <option value="${item.key}" <c:if test="${pd.CATEGORY == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                    </c:forEach>
								</select>
								</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">备注说明:</td>
									<td><input type="text" name="REMARK" id="remark"  value="${pd.REMARK }" placeholder="备注说明"  title="备注说明" style="width:98%;" /></td>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	//录入患者
	function luRuHZ(){
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
	
	//录入药品
	function luRuYP(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "药品信息";
		 diag.URL = '<%=basePath%>blfyypgl/goluRuYP.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('drug_id').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('drug_name').value;
	         	if(id !=''){
	         		$("#drug_id").val(id);
		         	$("#drug_name").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	
	//保存
	function save(){
		if($("#drug_name").val()==""){
			$("#drug_name").tips({
				side:3,
	            msg:'药品名称不能为空',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#drug_name").focus();
			return false;
		} else {
			$("#drug_name").val($.trim($("#drug_name").val()));
		}
		
		if($("#patient_name").val()==""){
			$("#patient_name").tips({
				side:3,
	            msg:'患者姓名不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#patient_name").focus();
			return false;
		}else{
			$("#patient_name").val($.trim($("#patient_name").val()));
		}	
		if($("#mzjzlsh").val()==""){
			
			$("#mzjzlsh").tips({
				side:3,
	            msg:'门诊就诊流水号不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#mzjzlsh").focus();
			return false;
		}else{
			$("#mzjzlsh").val($.trim($("#mzjzlsh").val()));
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}	
	
</script>
</html>