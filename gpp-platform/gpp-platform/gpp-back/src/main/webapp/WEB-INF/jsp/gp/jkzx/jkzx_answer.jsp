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
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style>
li {list-style-type:none;}
textarea  {resize: none;width: 550px;height: 100px;max-width: 550px;max-height: 100px;}
</style>
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
						<form action="jkzx/endAnswer.do" name="userForm" id="userForm" method="post">
							<input type="hidden" id="CONSULTATION_ID" name="CONSULTATION_ID" value="${pd.CONSULTATION_ID}"/>
							<div>
								<div style="text-align:center;padding-top:10px;">
									<textarea name="SEND_CONTENT" id="SEND_CONTENT" value="${pd.SEND_CONTENT}" rows="10" cols="10" maxlength="255" placeholder="这里输入应答内容" title="id"></textarea>
								</div>
								<div style="text-align:center;">
									<a class="btn btn-mini btn-primary" onclick="save('${pd.CONSULTATION_ID}');">应答</a>
									<a class="btn btn-mini btn-primary" onclick="end('${pd.CONSULTATION_ID}');">完结</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
							<div id="zhongxin" style="padding-top: 10px;text-align:center;">
								<ul id="content">
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach items="${list }" var="list" >
											<c:if test="${list.SEND_ROLE =='0' }">
												<li class="patient">
													<div align="left" style="background-color: rgba(31, 134, 134, 0.2)">
														<font size="1">&nbsp; &nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${list.SEND_TIME}"/></font></br>
														<font size="3">${list.SEND_CONTENT}</font>
													</div>
												</li>
											</c:if>
											<c:if test="${list.SEND_ROLE =='1' }">
												<li class="doctor">
													<div align="right" style="background-color:rgba(147, 147, 147, 0.2);">
														<font size="1">${list.SEND_NAME }&nbsp; &nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${list.SEND_TIME}"/></font></br>
														<font size="3">${list.SEND_CONTENT}</font>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>	
								</ul>											
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	
	function save(id){
		if($("#SEND_CONTENT").val()==""){
			$("#SEND_CONTENT").tips({
				side:3,
	            msg:'应答内容不能为空',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SEND_CONTENT").focus();
			return false;
			} else {
				top.jzts();
				$("#SEND_CONTENT").val($.trim($("#SEND_CONTENT").val()));
			}
				var remark = document.getElementById('SEND_CONTENT').value;
	            $.ajax({
	                type: "POST",
	                url: '<%=basePath%>jkzx/saveAnswer.do?SEND_CONTENT='+remark,
	                data: {
	                    CONSULTATION_ID: id,
	                    SEND_CONTENT:remark
	                },
	                cache: false,
	                success: function (data) {
	                       window.location.reload();
	                }
	          })
		}
			
	function end(){
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	
</script>
</html>