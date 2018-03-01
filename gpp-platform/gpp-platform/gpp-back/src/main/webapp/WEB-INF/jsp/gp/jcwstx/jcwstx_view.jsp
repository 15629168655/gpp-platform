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

<!DOCTYPE html>
<!-- 基层卫生提醒服务信息页面  -->
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
								<form action="" name="Form" id="Form" method="post">
								<input type="hidden" name="id" id="id" value="${pd.ID }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">标题:</td>
											<td><input type="text" name="bt" id="bt" value="${pd.BT }"  placeholder="这里输入标题" title="标题" readonly="readonly" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">内容:</td>
											<td colspan="3"><textarea rows="3px" cols="51%" name="nr" id="nr" readonly="readonly">${pd.NR }</textarea></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">提醒类型:</td>
											<td class='left'>
                                                <c:forEach items="${pd.enumJcwstxLX}" var="s">
                                                    <c:if test="${s.key == pd.TXLX}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">状态:</td>
											<td class='left'>
                                                <c:forEach items="${pd.enumJcwstxZT}" var="s">
                                                    <c:if test="${s.key == pd.ZT}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
										</tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">生成时间:</td>
											<td><input type="text" name="scsj" id="scsj" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.SCSJ }" />"   title="生成时间" readonly="readonly" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">修改时间:</td>
											<td><input type="text" name="gxsj" id="gxsj" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GXSJ }" />"   title="更新时间" readonly="readonly" style="width:98%;"/></td>
										</tr>
										
										
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
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

	
</script>
</html>