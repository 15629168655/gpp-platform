<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<input type="hidden" id="PROVIDER_ID" />
						<input type="hidden" id="PROVIDER_CODE" />
						<input type="hidden" id="PROVIDER_NAME"  />
						<input type="hidden" id="TELECOM"  />
						<input type="hidden" id="ORG_CODE">
						<input type="hidden" id="DEP_ID">
						<input type="hidden" id="DEP_NAME">
						<input type="hidden" id="PRO_POSITION_CODE">
						<!-- 检索  -->
						<form action="yhry/getChooseYhryList.do" method="post" name="Form" id="yhryForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" placeholder="请输入姓名" style="width: 120px;"/>
									</div>
								</td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">姓名</th>
									<th class="center">性别</th>
									<th class="center">职位名称</th>
									<th class="center">电话号码</th>
									<th class="center">地址</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty yhryList}">
									<c:forEach items="${yhryList}" var="yhry" varStatus="vs">
										<tr PK="${yhry.ID}" GH="${yhry.PROVIDER_CODE}" MC="${yhry.PROVIDER_NAME}" DH="${yhry.TELECOM}" JG="${yhry.ORG_CODE}" YSGH="${yhry.PRO_POSITION_CODE} DEID="${yhry.DEP_ID}" DEPT="${yhry.DEP_NAME}">
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${yhry.PROVIDER_NAME}</td>
											<td class="center">
											<c:if test="${yhry.SEX == '0'}">男</c:if>
											<c:if test="${yhry.SEX == '1'}">女</c:if>
											<c:if test="${yhry.SEX == '2'}">未知性别</c:if>
											</td>
											<td class="center">${yhry.PRO_POSITION_NAME}</td>
											<td class="center">${yhry.TELECOM}</td>
											<td class="center">${yhry.ADDRESS}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							</tbody>
						</table>
						 <table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
		$(top.hangge());
		
		$(function () {
	        var active_class = 'success';
	        
	     // 选择行变色 
	        $("#simple-table > tbody > tr").click(function (){ 
	            var trThis = this; 
	            $("#simple-table > tbody > tr").removeClass(active_class); 
	            $(trThis).addClass(active_class);
	            $("#PROVIDER_ID").val($(trThis).attr("PK"));
	            $("#PROVIDER_CODE").val($(trThis).attr("GH"));
	            $("#PROVIDER_NAME").val($(trThis).attr("MC"));
	            $("#TELECOM").val($(trThis).attr("DH"));
	            $("#ORG_CODE").val($(trThis).attr("JG"));
	            $("#PRO_POSITION_CODE").val($(trThis).attr("YSGH"));
	            $("#DEP_ID").val($(trThis).attr("DEID"));
	            $("#DEP_NAME").val($(trThis).attr("DEPT"));
	        });
	    }) 
			
		//检索
		function searchs(){
			top.jzts();
			$("#yhryForm").submit();
		}
	 
		//清空查询条件
		function refresh(){
			
			$("#nav-search-input").val("");
		}
	</script>
</html>
