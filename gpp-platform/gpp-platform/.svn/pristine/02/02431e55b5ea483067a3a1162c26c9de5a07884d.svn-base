<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


%>
<!-- 随访记录设置模版页面 -->
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
								<form action="sfjl/${msg }.do" name="Form" id="Form" method="post">
								
									<div id="zhongxin" style="padding-top: 13px;">
									<input type = "hidden" value="${pd.JOB_ID }" name = "JOB_ID" id = "JOB_ID">
									<input type = "hidden" value="${pd.BUSINESS_ID }" name = "CASE_ID" id = "CASE_ID">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="text-align: center" colspan="2">
												<h4 style="color: #44abff">添加模版</h4>
											</td>
										</tr>
										<tr>
											<td style="width:20%;text-align: right;padding-top: 13px;">模版名称:</td>
											<td><input type="text" name="NAME" id="NAME" maxlength="20" placeholder="这里输入模版名称" title="模版名称" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:20%;text-align: right;padding-top: 13px;">模版类型:</td>
											<td>
												<select name="SFLX" id="SFLX" style="width:98%;">
											         <option value="" selected >请选择</option>
										             <c:forEach items="${pd.EnumSfjlSFLX}" var="item">
				                                        <option value="${item.key}">${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										
										<tr>
											<td style="width:20%;text-align: right;padding-top: 13px;">是否是公用模版:</td>
											<td>
												<select name="ISTEMP" id="ISTEMP" style="width:98%;">
											         <option value="0" selected >否</option>
				                                     <option value="1">是</option>
											     </select>
											 </td>
										</tr>
										<tr>
											<td colspan="2" style="padding: 30px;">
												<h5 style="color: #ff0000">提示：打“√”表示选中，带“*”表示必选字段</h5>
												<table>
													<c:forEach items="${varList}" var="list1" step="5" varStatus="status">
													<tr>
														<c:forEach items="${varList}" var="list" varStatus="vs">
															<c:if test="${vs.index>=status.index&&vs.index<=status.index+4}">
																<c:if test="${list.ISDIS==0}">
																	<td style="text-align: right;padding: 10px;">
																		${list.NAME}<span class="red">*</span>:
																		<label class="pos-rel"><input type="checkbox" class="ace" name="${list.GUID}" id="${list.GUID}" value="${list.NAME}" checked="checked" onclick="return false"/><span class="lbl"></span></label>
																	</td>
																</c:if>
																<c:if test="${list.ISDIS==1}">
																	<td style="text-align: right;padding: 10px;">
																		${list.NAME}:
																		<label class="pos-rel"><input type="checkbox" class="ace" name="${list.GUID}" id="${list.GUID}" value="${list.NAME}"/><span class="lbl"></span></label>
																	</td>
																</c:if>
															</c:if>
														</c:forEach>
													</tr>
													</c:forEach>
												</table>
											</td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="saveTemp();">保存</a>
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
</body>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
    });
	//保存
	function saveTemp(){
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请录入模版名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FSYS").focus();
			return false;
		}
		if($("#SFLX").val()==""){
			$("#SFLX").tips({
				side:3,
	            msg:'请选择模版类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#SFLX").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}

</script>
</html>