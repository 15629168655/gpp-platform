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
<!-- 诊断信息页面 -->
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
						<input type="hidden" id="BM" />
						<input type="hidden" id="MC" />
						<!-- 检索  -->
						<form action="hospitalization/getDiagnosis.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" style="width: 200px"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									
									<th class="center" style="width:10%;">序号</th>
									<th class="center" style="width:30%;">名称</th>
									<th class="center" style="width:20%;">编码</th>
									<th class="center" style="width:10%;">传染病</th>
									<th class="center" style="width:10%;">尘肺病</th>
									<th class="center" style="width:30%;">慢性病</th>
									<th class="center" style="width:20%;">类型</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty zdxxList}">
									<c:forEach items="${zdxxList}" var="var" varStatus="vs">
									    <tr GH="${var.BM}" MC="${var.MC}">
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.MC}</td>
											<td class='center'>${var.BM}</td>
											<td class='center'>
                                                <c:forEach items="${pd.enumMzzdwhCRB}" var="s">
                                                    <c:if test="${s.key == var.CRB}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class='center'>
                                                <c:forEach items="${pd.enumMzzdwhCFB}" var="s">
                                                    <c:if test="${s.key == var.SFCFB}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class='center'>${var.MXB}</td>
											<td class='center'>${var.LX}</td>
											
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	$(top.hangge());
	
	$(function () {
        var active_class = 'success';
        
     // 选择行变色 
        $("#simple-table > tbody > tr").click(function (){ 
            var trThis = this; 
            $("#simple-table > tbody > tr").removeClass(active_class); 
            $(trThis).addClass(active_class);
            $("#BM").val($(trThis).attr("GH"));
            $("#MC").val($(trThis).attr("MC"));
        });
    }) 
		
	//检索
	function tosearch(){
		top.jzts();
		$("#Form").submit();
	}
	
	//清空查询条件
	function refresh(){
		
		$("#nav-search-input").val("");
	}
 
	</script>

</body>
</html>