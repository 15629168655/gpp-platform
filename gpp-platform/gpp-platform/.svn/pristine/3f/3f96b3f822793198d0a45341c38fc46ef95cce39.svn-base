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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
							<!-- 检索 -->
							<form action="regAppointment/list.do" method="post" name="Form" id="Form">
								<table style="margin-top: 5px">
									<tr>
										<!-- 患者姓名 -->
										<td>
											<div class="nav-search">
												<input type="text" placeholder="请输入患者姓名" class="nav-search-input" id="NAME" autocomplete="off" name="NAME" value="${pd.NAME}" placeholder="这里输入关键词"/>
											</div>
										</td>
										<!-- 身份证号 -->
										<td>
											<div class="nav-search">
												<span class="input-icon">
													<input type="text" placeholder="请输入身份证号码" class="nav-search-input" id="CARDNO" autocomplete="off" name="CARDNO" value="${pd.CARDNO}" placeholder="这里输入关键词"/>
												</span>
											</div>
										</td>
										<td style="padding-left:2px;"><input class="span10 date-picker" name="reqAppDateStart" id="reqAppDateStart"  value="${pd.reqAppDateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="预约开始日期" title="预约开始日期"/></td>
										<td style="padding-left:2px;"><input class="span10 date-picker" name="reqAppDateEnd" id="reqAppDateEnd"  value="${pd.reqAppDateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="预约结束日期" title="预约结束日期"/></td>
										<c:if test="${QX.cha == 1 }">
											<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-160 nav-search-icon blue"></i>检索</a></td>
											<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
										</c:if> 
									</tr>
								</table>
								<!-- 检索结束 -->
								
								<!-- 列表显示 -->
								<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
									<thead>
										<tr>
											<th class="center" style="width:50px;">序号</th>
											<th class="center">预约单号</th>
											<th class="center">患者姓名</th>
											<th class="center">身份证号码</th>
											<th class="center">挂号机构</th>
											<th class="center">挂号科室</th>
											<th class="center">医生</th>
											<th class="center">预约时间</th>
											<th class="center">预约状态</th>
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty varList}">
												<c:if test="${QX.cha== 1}">
													<c:forEach items="${varList}" var="var" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class='center'>${var.REGID}</td>
															<td class='center'><a onclick="showInfo('${var.REFERRAL_ID}', '${var.GUID}')" title="患者预约详情">${var.NAME}</a></td>
															<td class='center'>${var.CARDNO}</td>
															<td class='center'>${var.ORGNAME}</td>
															<td class='center'>${var.DEPTNAME}</td>
															<td class='center'>${var.DOCTORNAME}</td>
															<td class='center'><fmt:formatDate pattern="yyyy-MM-dd"  value="${var.APPTIME}"/></td>
															<td class='center'>
																<c:if test="${var.STATE ==1 }"><span class="label label-warning arrowed-in-right arrowed tooltip-warning" data-rel="tooltip" data-placement="bottom" title="" data-original-title="预约成功" style="cursor: pointer"> 预约成功</span></c:if>
																<c:if test="${var.STATE ==0 }"><span class="label label-info  arrowed-in arrowed-right  tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="取消预约" style="cursor: pointer">取消预约</span></c:if>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${QX.cha == 0 }">
													<tr>
														<td colspan="100" class="center">您无权查看</td>
													</tr>
												</c:if>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center" >没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<div class="page-header position-relative">
									<table style="width:100%;">
										<tr>
											<%-- <td style="vertical-align:top;">
											<c:if test="${QX.add == 1 }">
												<a class="btn btn-sm btn-success" onclick="add();">新增</a>
											</c:if>
											<c:if test="${QX.del == 1 }">
												<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
											</c:if>
											</td> --%>
											<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
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
	
	   <%--<script src="static/js/myjs/head.js"></script>--%>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	//检索
	function tosearch(){
		top.jzts();
		$("#Form").submit();
	}
	
	//清空查询条件
	function refresh(){
		$("#NAME").val("");
		$("#CARDNO").val("");
		$("#reqAppDateStart").val("");
		$("#reqAppDateEnd").val("");
	}
	
	$(function() {
		//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
	});
	//预约挂号
    function showInfo(Id, GUID){
        top.jzts();
        window.location.href="<%=basePath%>/regAppointment/info.do?REFERRAL_ID="+Id+"&GUID="+GUID+"&fromUrl="+encodeURIComponent(window.location.href);
    }
	</script>

</body>
</html>