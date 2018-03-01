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
<!-- 居民信息页面 -->
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
						<input type="hidden" id="USER_AGENT_ID"/>
						<input type="hidden" id="USER_NAME"/>
						<input type="hidden" id="TELEPHONE"/>
						<input type="hidden" id="MI_CARD"/>
						<input type="hidden" id="ID_NUMBER"/>
						<input type="hidden" id="SEX"/>
						<input type="hidden" id="GROUP_ID"/>
						<!-- 检索  -->
						<form action="indexCommonChose/getJMXX.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="user_name" type="text" name="user_name" value="${pd.user_name }" placeholder="居民姓名" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="mi_card" type="text" name="mi_card" value="${pd.mi_card }" placeholder="医保卡号" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="id_number" type="text" name="id_number" value="${pd.id_number }" placeholder="身份证号" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="sign_apply_time" id="sign_apply_time"  value="${pd.sign_apply_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="签约日期" title="签约日期"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="is_sign" id="is_sign" data-placeholder="协议状态" style="vertical-align:top;width: 79px;">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.is_sign == '0' }">selected</c:if> >未签约</option>
									<option value="1" <c:if test="${pd.is_sign == '1' }">selected</c:if> >待审核</option>
									<option value="2" <c:if test="${pd.is_sign == '2' }">selected</c:if> >已签约</option>
									</select>
								</td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">姓名</th>
									<th class="center">性别</th>
									<th class="center">身份证号</th>
									<th class="center">医保卡号</th>
									<th class="center">出生日期</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty jmxxList}">
									<c:forEach items="${jmxxList }" var="jmxxList" varStatus="vs">
									<tr GH="${jmxxList.USER_AGENT_ID}" MC="${jmxxList.USER_NAME}" DH="${jmxxList.TELEPHONE}" MI="${jmxxList.MI_CARD}" CARD="${jmxxList.ID_NUMBER}" XB="${jmxxList.SEX}" GROUPID="${jmxxList.GROUP_ID }">
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${jmxxList.USER_NAME }</td>
											<td style="width: 60px;" class="center">
												<c:if test="${jmxxList.SEX == '1' }"><span>男</span></c:if>
												<c:if test="${jmxxList.SEX == '2' }"><span>女</span></c:if>
											</td>
											<td class="center">${jmxxList.ID_NUMBER }</td>
											<td class="center">${jmxxList.MI_CARD }</td>
											<td class="center">
										  	<fmt:formatDate pattern="yyyy-MM-dd"  value="${jmxxList.BIRTHDAY_TIME }"/> 
											</td>
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
						 	<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
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
			
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
	        var active_class = 'success';
	        
	      	// 选择行变色 
	        $("#simple-table > tbody > tr").click(function (){ 
	            var trThis = this; 
	            $("#simple-table > tbody > tr").removeClass(active_class); 
	            $(trThis).addClass(active_class);
	            $("#USER_AGENT_ID").val($(trThis).attr("GH"));
	            $("#USER_NAME").val($(trThis).attr("MC"));
	            $("#TELEPHONE").val($(trThis).attr("DH"));
	            $("#MI_CARD").val($(trThis).attr("MI"));
	            $("#ID_NUMBER").val($(trThis).attr("CARD"));
	            $("#SEX").val($(trThis).attr("XB"));
	            $("#GROUP_ID").val($(trThis).attr("GROUPID"));
	        });
	    }) 
		
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		
		//清空查询条件
		function reset(){
			$("#user_name").val("");
			$("#mi_card").val("");
			$("#id_number").val("");
			$("#sign_apply_time").val("");
			$("#is_sign").find("option:selected").attr("selected",false);
			$("#is_sign").find("option[text='']").attr("selected",true);
			$("#processing_status").find("option:selected").attr("selected",false);
			$("#processing_status").find("option[text='']").attr("selected",true);
		}
		
		</script>
</html>

