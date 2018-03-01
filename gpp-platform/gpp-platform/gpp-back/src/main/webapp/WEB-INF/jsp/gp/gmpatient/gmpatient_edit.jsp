<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


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
					<!-- 过敏管理 新增修改页面 -->
					<form action="gmpatient/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="OPERATOR_ID" id="OPERATOR_ID" value="${pd.OPERATOR_ID}"/>
						<input type="hidden" name="REGION_CODE" id="REGION_CODE" value="${pd.REGION_CODE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
									<td style="width:150px;text-align: center;padding-top: 13px;">患者姓名：</td>
									<td>
										<input type="hidden" name="PATIENT_ID" id="PATIENT_ID" value="${pd.PATIENT_ID}" />
										<input type="text" name="PATIENT_NAME" id="PATIENT_NAME" value="${pd.PATIENT_NAME}" readonly="readonly" style="width: 88%"/>
										<a class="btn btn-mini btn-purple" onclick="choosePerson();">患者菜单</a>
									</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">录入人姓名:</td>
								<td><input type="text" name="OPERATOR_NAME" id="OPERATOR_NAME" value="${pd.OPERATOR_NAME}" readonly="readonly" maxlength="255" placeholder="这里输入录入人姓名" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">过敏源:</td>
								<td>
									<select class="form-control" id="ALLERGY" name="ALLERGY" style="width:80%;">
                                        <c:forEach items="${pd.enumAllergy}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.ALLERGY == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>  
							</tr>
							<tr>
	                                <td style="width:130px;text-align: center;padding-top: 13px;">备注:</td>
									<td >
									<textarea rows="4" class="form-control" id="BZ" name="BZ" placeholder="这里输入备注">${pd.BZ}</textarea>
									</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">确定</a>
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
		//保存
		function save(){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function edit(){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//选择患者		
		function choosePerson(){
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
		         	$("#PATIENT_ID").val(id);
		         	$("#PATIENT_NAME").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		
		</script>
</body>
</html>