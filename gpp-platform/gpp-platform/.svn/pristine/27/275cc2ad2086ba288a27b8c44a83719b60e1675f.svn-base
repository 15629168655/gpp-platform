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
									<select class="form-control" id="MODULE" name="MODULE" style="width:98%;">
										<c:forEach items="${pd.enumModule}" var="item">
											<c:choose>
												<c:when test="${pd.MODULE == item.value}">
													<option value="${item.value}" selected="selected">${item.value}</option>
												</c:when>
											   	<c:otherwise>
													<option value="${item.value}">${item.value}</option>
												</c:otherwise>
										   </c:choose>
									    </c:forEach>
									</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 12px;">提交方式:</td>
								<%-- <td><input type="text" name="SUBMISSION_WAY" id="SUBMISSION_WAY" value="${pd.SUBMISSION_WAY}" maxlength="50" placeholder="这里输入提交方式" title="提交方式" style="width:98%;"/></td>--%>
								<td>
									<select class="form-control" id="SUBMISSION_WAY" name="SUBMISSION_WAY" style="width:98%;">
										<c:forEach items="${pd.enumSubmissinWay}" var="item">
											<c:choose>
												<c:when test="${pd.SUBMISSION_WAY == item.value}">
													<option value="${item.value}" selected="selected">${item.value}</option>
												</c:when>
											   	<c:otherwise>
													<option value="${item.value}">${item.value}</option>
												</c:otherwise>
										   </c:choose>
									    </c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">接口名称:</td>
								<%--<td><input type="text" name="INTERFACE_NAME" id="INTERFACE_NAME" value="${pd.INTERFACE_NAME}" maxlength="50" placeholder="这里输入接口名称" title="接口名称" style="width:98%;"/></td>--%>
							    <td><input type="text" name="INTERFACE_NAME" id="INTERFACE_NAME" value="${pd.INTERFACE_NAME}" maxlength="32" placeholder="接口名称(不重复)" title="接口名称" style="width:98%;" <c:if test="${null != pd.INTERFACE_NAME}">readonly="readonly"</c:if> <c:if test="${null == pd.INTERFACE_NAME}">onblur="hasInterfaceName();"</c:if> /></td>
								<td style="width:75px;text-align: right;padding-top: 12px;">接口版本:</td>
								<td><input type="text" name="INTER_VERSION" id="INTER_VERSION" value="${pd.INTER_VERSION}" maxlength="100" placeholder="接口版本" title="接口版本" style="width:98%;"/></td>
							</tr>	
							<tr>	
								<td style="width:100px;text-align: right;padding-top: 12px;">接口URL:</td>
								<td colspan="3"><input type="text" name="INTERFACE_URL" id="INTERFACE_URL" value="${pd.INTERFACE_URL}" maxlength="100" placeholder="接口URL" title="接口URL" style="width:99%;"/></td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">参数内容类型:</td>
								<%--<td><input type="text" name="PARAMETER_TYPE" id="PARAMETER_TYPE" value="${pd.PARAMETER_TYPE}" maxlength="50" placeholder="这里输入参数内容类型" title="参数内容类型" style="width:98%;"/></td> --%>
								<td colspan="3">
									<select class="form-control" id="PARAMETER_TYPE" name="PARAMETER_TYPE" style="width:99%;">
										<c:forEach items="${pd.enumParameterType}" var="item">
											<c:choose>
												<c:when test="${pd.PARAMETER_TYPE == item.value}">
													<option value="${item.value}" selected="selected">${item.value}</option>
												</c:when>
											   	<c:otherwise>
													<option value="${item.value}">${item.value}</option>
												</c:otherwise>
										   </c:choose>
									    </c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">响应内容类型:</td>
								<%-- <td><input type="text" name="RESPOND_TYPE" id="RESPOND_TYPE" value="${pd.RESPOND_TYPE}" maxlength="50" placeholder="这里输入响应内容类型" title="响应内容类型" style="width:98%;"/></td>--%>
								<td colspan="3">
									<select class="form-control" id="RESPOND_TYPE" name="RESPOND_TYPE" style="width:99%;">
										<c:forEach items="${pd.enumRespondType}" var="item">
											<c:choose>
												<c:when test="${pd.RESPOND_TYPE == item.value}">
													<option value="${item.value}" selected="selected">${item.value}</option>
												</c:when>
											   	<c:otherwise>
													<option value="${item.value}">${item.value}</option>
												</c:otherwise>
										   </c:choose>
									    </c:forEach>
									</select>
								</td>
							</tr>
							<tr>							
								<td style="width:100px;text-align: right;padding-top: 12px;">参数内容:</td>
								<%-- <td><input type="text" name="PARAMETER_CONTENT" id="PARAMETER_CONTENT" value="${pd.PARAMETER_CONTENT}" maxlength="200" placeholder="这里输入参数内容" title="参数内容" style="width:98%;"/></td>--%>
							 	<td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;" name="PARAMETER_CONTENT" id="PARAMETER_CONTENT" rows="3" maxlength="200" placeholder="参数内容" title="参数内容">${pd.PARAMETER_CONTENT}</textarea>
                                </td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">响应内容:</td>
								<%-- <td><input type="text" name="RESPOND_CONTENT" id="RESPOND_CONTENT" value="${pd.RESPOND_CONTENT}" maxlength="200" placeholder="这里输入响应内容" title="响应内容" style="width:98%;"/></td>--%>
							    <td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;" name="RESPOND_CONTENT" id="RESPOND_CONTENT" rows="3" maxlength="200" placeholder="响应内容" title="响应内容">${pd.RESPOND_CONTENT}</textarea>
                                </td>				                       	
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 12px;">接口描述:</td>
								<%-- <td><input type="text" name="INTER_DESCRIBE" id="INTER_DESCRIBE" value="${pd.INTER_DESCRIBE}" maxlength="200" placeholder="这里输入接口描述" title="接口描述" style="width:98%;"/></td>--%>
								<td colspan="3">
                                	<textarea class="form-control limited" style="width:99%;" name="INTER_DESCRIBE" id="INTER_DESCRIBE" rows="3" maxlength="200" placeholder="接口描述" title="接口描述">${pd.INTER_DESCRIBE}</textarea>
                                </td>
							</tr>
													
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
			if($("#MODULE").val()==""){
				$("#MODULE").tips({
					side:3,
		            msg:'请输入模块',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODULE").focus();
			return false;
			}
			if($("#INTERFACE_NAME").val()==""){
				$("#INTERFACE_NAME").tips({
					side:3,
		            msg:'请输入接口名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTERFACE_NAME").focus();
			return false;
			}
			if($("#INTERFACE_URL").val()==""){
				$("#INTERFACE_URL").tips({
					side:3,
		            msg:'请输入接口URL',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTERFACE_URL").focus();
			return false;
			}
		/* 	if($("#SUBMISSION_WAY").val()==""){
				$("#SUBMISSION_WAY").tips({
					side:3,
		            msg:'请输入提交方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBMISSION_WAY").focus();
			return false;
			} */
			/* if($("#PARAMETER_TYPE").val()==""){
				$("#PARAMETER_TYPE").tips({
					side:3,
		            msg:'请输入参数内容类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAMETER_TYPE").focus();
			return false;
			}
			if($("#PARAMETER_CONTENT").val()==""){
				$("#PARAMETER_CONTENT").tips({
					side:3,
		            msg:'请输入参数内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAMETER_CONTENT").focus();
			return false;
			}
			if($("#RESPOND_TYPE").val()==""){
				$("#RESPOND_TYPE").tips({
					side:3,
		            msg:'请输入响应内容类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESPOND_TYPE").focus();
			return false;
			}
			if($("#RESPOND_CONTENT").val()==""){
				$("#RESPOND_CONTENT").tips({
					side:3,
		            msg:'请输入响应内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESPOND_CONTENT").focus();
			return false;
			}
			if($("#INTER_DESCRIBE").val()==""){
				$("#INTER_DESCRIBE").tips({
					side:3,
		            msg:'请输入接口描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTER_DESCRIBE").focus();
			return false;
			}
			if($("#INTER_VERSION").val()==""){
				$("#INTER_VERSION").tips({
					side:3,
		            msg:'请输入接口版本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTER_VERSION").focus();
			return false;
			} */
			/* if($("#BUILD_TIME").val()==""){
				$("#BUILD_TIME").tips({
					side:3,
		            msg:'请输入生成时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUILD_TIME").focus();
			return false;
			}
			if($("#ALTER_TIME").val()==""){
				$("#ALTER_TIME").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALTER_TIME").focus();
			return false;
			} */
			/* if($("#OPERATOR").val()==""){
				$("#OPERATOR").tips({
					side:3,
		            msg:'请输入操作人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPERATOR").focus();
			return false;
			} */
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//判断接口名称是否存在
		function hasInterfaceName(){
			//var INTERFACE_NAME = $.trim($("#INTERFACE_NAME").val());
			var INTERFACE_NAME = $("#INTERFACE_NAME").val();
			//if("" == INTERFACE_NAME)return;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>interfaceinfo/hasInterfaceName.do',
		    	data: {INTERFACE_NAME:INTERFACE_NAME},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
					 }else{
						$("#INTERFACE_NAME").tips({
							side:1,
				            msg:'接口名称'+INTERFACE_NAME+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:5
				        });
						$('#INTERFACE_NAME').val('');
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