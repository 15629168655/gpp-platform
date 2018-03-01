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
					
					<form action="interfaceinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INTERFACEINFO_ID" id="INTERFACEINFO_ID" value="${pd.INTERFACEINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">模块:</td>
								<%-- <td><input type="text" name="MODULE" id="MODULE" value="${pd.MODULE}" maxlength="100" placeholder="这里输入模块" title="模块" style="width:98%;"/></td>--%>
								<td>
									<c:forEach items="${pd.enumModule}" var="entry">
										<c:if test="${entry.value == pd.MODULE}">
											<input type="text" class="col-sm-11 form-control" name="MODULE" id=MODULE value="${entry.value}" maxlength="100" title="模块" style="width:98%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>
				
								<td style="width:75px;text-align: right;padding-top: 12px;">提交方式:</td>
								<%-- <td><input type="text" name="SUBMISSION_WAY" id="SUBMISSION_WAY" value="${pd.SUBMISSION_WAY}" maxlength="50" placeholder="这里输入提交方式" title="提交方式" style="width:98%;"/></td>--%>
								<td>
									<c:forEach items="${pd.enumSubmissinWay}" var="entry">
										<c:if test="${entry.value == pd.SUBMISSION_WAY}">
											<input type="text" class="col-sm-11 form-control" name="SUBMISSION_WAY" id=SUBMISSION_WAY value="${entry.value}" maxlength="50" title="提交方式" style="width:98%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">接口名称:</td>
								<%--<td><input type="text" name="INTERFACE_NAME" id="INTERFACE_NAME" value="${pd.INTERFACE_NAME}" maxlength="50" placeholder="这里输入接口名称" title="接口名称" style="width:98%;"/></td>--%>
							    <td><input type="text"  class="col-sm-11 form-control" name="INTERFACE_NAME" id="INTERFACE_NAME" value="${pd.INTERFACE_NAME}" maxlength="32"  title="接口名称" style="width:98%;" readonly="readonly" /></td>
								<td style="width:75;text-align: right;padding-top: 12px;">接口版本:</td>
								<td><input type="text" class="col-sm-11 form-control" name="INTER_VERSION" id="INTER_VERSION" value="${pd.INTER_VERSION}" maxlength="100"  title="接口版本" style="width:98%;" readonly="readonly" /></td>
							</tr>	
							<tr>	
								<td style="width:100px;text-align: right;padding-top: 12px;">接口URL:</td>
								<td colspan="3"><input type="text"  class="col-sm-11 form-control" name="INTERFACE_URL" id="INTERFACE_URL" value="${pd.INTERFACE_URL}" maxlength="100"  title="接口URL" style="width:99%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">参数内容类型:</td>
								<%--<td><input type="text" name="PARAMETER_TYPE" id="PARAMETER_TYPE" value="${pd.PARAMETER_TYPE}" maxlength="50" placeholder="这里输入参数内容类型" title="参数内容类型" style="width:98%;"/></td> --%>
								<td colspan="3">
									<c:forEach items="${pd.enumParameterType}" var="entry">
										<c:if test="${entry.value == pd.PARAMETER_TYPE}">
											<input type="text" class="col-sm-11 form-control" name="PARAMETER_TYPE" id=PARAMETER_TYPE value="${entry.value}" maxlength="50" title="参数内容类型" style="width:99%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">响应内容类型:</td>
								<%-- <td><input type="text" name="RESPOND_TYPE" id="RESPOND_TYPE" value="${pd.RESPOND_TYPE}" maxlength="50" placeholder="这里输入响应内容类型" title="响应内容类型" style="width:98%;"/></td>--%>
								<td colspan="3">
									<c:forEach items="${pd.enumRespondType}" var="entry">
										<c:if test="${entry.value == pd.RESPOND_TYPE}">
											<input type="text" class="col-sm-11 form-control" name="RESPOND_TYPE" id=RESPOND_TYPE value="${entry.value}" maxlength="50" title="响应内容类型" style="width:99%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>							
								<td style="width:100px;text-align: right;padding-top: 12px;">参数内容:</td>
								<%-- <td><input type="text" name="PARAMETER_CONTENT" id="PARAMETER_CONTENT" value="${pd.PARAMETER_CONTENT}" maxlength="200" placeholder="这里输入参数内容" title="参数内容" style="width:98%;"/></td>--%>
							 	<td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;"  readonly="readonly" name="PARAMETER_CONTENT" id="PARAMETER_CONTENT" rows="3" maxlength="200"  title="参数内容">${pd.PARAMETER_CONTENT}</textarea>
                                </td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">响应内容:</td>
								<%-- <td><input type="text" name="RESPOND_CONTENT" id="RESPOND_CONTENT" value="${pd.RESPOND_CONTENT}" maxlength="200" placeholder="这里输入响应内容" title="响应内容" style="width:98%;"/></td>--%>
							    <td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;"  readonly="readonly" name="RESPOND_CONTENT" id="RESPOND_CONTENT" rows="3" maxlength="200"  title="响应内容">${pd.RESPOND_CONTENT}</textarea>
                                </td>				                       	
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">接口描述:</td>
								<%-- <td><input type="text" name="INTER_DESCRIBE" id="INTER_DESCRIBE" value="${pd.INTER_DESCRIBE}" maxlength="200" placeholder="这里输入接口描述" title="接口描述" style="width:98%;"/></td>--%>
								<td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;"  readonly="readonly" name="INTER_DESCRIBE" id="INTER_DESCRIBE" rows="3" maxlength="200"  title="接口描述">${pd.INTER_DESCRIBE}</textarea>
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
		</script>
</body>
</html>