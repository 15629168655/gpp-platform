<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
String serverName = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort();

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
					<form action="grdzbl/view.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">类型:</td>
								<td>
									<select class="form-control" id="TYPE" name="TYPE" style="width:80%;">
                                        <c:forEach items="${pd.EnumGrdzblType}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.TYPE == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>  
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">图片:</td>
								<td>
							<!-- 	<input type="text" name="TP" id="TP" value="${pd.TP}" maxlength="255" readonly="readonly" placeholder="" title="图片" style="width:98%;"/> -->
							      <a href="<%=serverName%>/${pd.TP_URL}" title="${pd.MC}" target="_blank" class="bwGal">
							      <img src="<%=serverName%>/${pd.TP_URL}" alt="${pd.MC}" width="260"></a>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">提交人:</td>
								<td><input type="text" name="TJR" id="TJR" value="${pd.TJR}" maxlength="255" readonly="readonly" placeholder="" title="" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">提交时间:</td>
								<td><input type="text" name="TJSJ" id="TJSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.TJSJ}" />' readonly="readonly" maxlength="255" placeholder="这里输入提交时间" title="提交时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="2">
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">确定</a>
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
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
	
</script>
</body>
</html>