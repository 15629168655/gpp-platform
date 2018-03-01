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
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
		
		<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-12 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">
							 <div class="alert alert-block alert-success">
								<!-- <button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button> -->
								<i class="ace-icon fa fa-check green"></i>
								欢迎使用系统&nbsp;&nbsp;
							</div>  
							
							<img  style="width: 100%;height: 100%;" src="static/images/main2.jpg">
						</div>
					</div>
				  
				</div>
			</div> 
		</div>
		<!-- /.main-content -->

		<%@ include file="../index/copyright.jsp"%>
		
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<script type="text/javascript">
		//$(top.hangge());
		$("#jzts").hide();
	</script>
</body>
</html>