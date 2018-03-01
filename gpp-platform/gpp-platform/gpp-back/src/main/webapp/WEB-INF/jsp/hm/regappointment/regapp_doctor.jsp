<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 医生检索条件 开始 -->
							<form role="form" action="regAppointment/doctor.do" method="post" name="Form" id="Form">
								<table>
									<tr>
										<!-- 医院名称 -->
										<td>
											<div class="nav-search">
												<span class="input-icon"> 
													<input type="hidden" name="REFERRAL_ID" value="${pds.USER_AGENT_ID}"/><!-- 患者申请单对象id -->
													
													<%-- <input type="hidden" name="HOSPNAME" value="${docList}"/> --%>
													<input type="text"  class="nav-search-input" id="nav-search-input"  name="HOSPNAME" value="" placeholder="请输入医院名称" /> 
													<i class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</div>
										</td>
										<!-- 科室 -->
										<td style="vertical-align:top;padding-left:2px;">
											<select name="DEPTCODE" id="DEPTCODE" style="vertical-align:top;width: 100px;">
											<option value=""  selected="selected">全部</option>
											<c:choose>
												<c:when test="${not empty kSList }">
													<c:forEach items="${kSList}" var="var" varStatus="vs">
														<option value="${var.DEPTCODE}" >${var.DEPTNAME}</option>
													</c:forEach>
												</c:when>
											</c:choose>
										</select>
										<!-- 职称 -->
										<td style="vertical-align:top;padding-left:2px;">
											<select name="TITLECODE" id="TITLECODE" style="vertical-align:top;width: 100px;">
											<option value="" <c:if test="${empty pds.TITLECODE  }"> selected="selected" </c:if> >全部</option>
											<option value="06" <c:if test="${pds.TITLECODE == '06' }"> selected="selected" </c:if> >主任医师</option>
											<option value="05" <c:if test="${pds.TITLECODE == '05' }"> selected="selected" </c:if> >副主任医师</option>
										</select>
										
										</td>
										<!-- 就诊日期 -->
										<td style="padding-left:2px;"><input class="span10 date-picker" name="reqAppDateStart" id="applyDateStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="就诊开始日期" title="就诊开始日期" /></td>
										<td style="padding-left:2px;"><input class="span10 date-picker" name="reqAppDateEnd" id="applyDateEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="就诊结束日期" title="就诊结束日期"/></td>
										<!-- 检索 -->
										<%-- <c:if test="${QX.cha == 1 }"> --%>
											<td style="vertical-align:top;padding-left:2px">
												<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索">
													<i id="nav-search-icon" class="ace-icon fa fa-search bigger-160 nav-search-icon blue" style="height: 20px;"></i>
												</a>
											</td>
										<%-- </c:if> --%>
									</tr>
								</table>
								<!-- 列表 -->
								<div class="widget-box transparent">
												<div class="widget-header widget-header-small">
													<h4 class="widget-title blue smaller">
														<i class="ace-icon fa fa-rss orange"></i>
														可预约医生列表
													</h4>
												</div>

												<div class="widget-body">
													<div class="widget-main padding-8">
														<!-- #section:pages/profile.feed -->
														<div id="profile-feed-1" class="profile-feed">
														<!-- 列表 循坏开始-->
														<c:choose>
															<c:when test="${not empty docList}">
																<%-- <c:if test="${QX.cha == 1 }"> --%>
																	<c:forEach items="${docList}" var="var" varStatus="vs">
															<div class="profile-activity clearfix">
																<div>
																	<table>
																		<tr style="height: 60px">
																			<td><!-- <i class="pull-left thumbicon fa fa-check btn-success no-hover"></i> -->
																				<img class="pull-left" alt="Alex Doe's avatar" src="static/html_UI/assets/avatars/avatar5.png" />
																			</td>
																			<td>
																				<div class="col-xs-12 col-lg-6" style="width: 300px;">
																				<ul>
																					<li style="float: left; padding-left: 10px;list-style-type:none;"><a class="user" href="#"> ${var.DOCTORNAME} </a></li>
																					<li style="float: left; padding-left: 10px;list-style-type:none;">${var.TITLENAME}</li>
																					<li style="float: left; padding-left: 10px;list-style-type:none;">${var.EDUCATION}</li>
																					<li style="float: left; padding-left: 10px;list-style-type:none;">${var.DEPTNAME}</li>
																				</ul>
																				</div>
																			</td>
																			<!-- 主治 -->
																			<td>
																				<div class="col-xs-12 col-lg-6" style="width: 450px;">
																					<ul>
																					<li style="float: left; padding-left: 10px;list-style-type:none;">
																						<span class="label label-warning">
																							${var.ATTENDING}
																						</span>
																					</li>
																					</ul>
																				</div>
																			</td>
																			<!-- 预约号源 -->
																			<td>
																				<table style="border-collapse: separate; border-spacing: 2px;text-align: center;">
																					<tr>
																						<td style="font-size: 20px;color: #8FBC8F;">${var.APPT}</td>
																						<td style=" padding-left: 2px;font-size: 20px;color: #8FBC8F;">${var.SCHEDULING}</td>
																					</tr>
																					<tr style="">
																						<td>预约量</td>
																						<td style=" padding-left: 15px;">可约排班</td>
																					</tr>
																				</table>
																			</td>
																			<!-- 联系简介 -->
																			<td style="padding-left: 2px">
																				<!-- <ul><button class="btn btn-white"><i class="ace-icon fa fa-phone fa-flip-horizontal"></i>电话</button></ul> -->
																							<span class="btn btn-info btn-sm tooltip-info" data-rel="tooltip"  data-placement="top"  title="${var.DOCTORPHONE}"><i class="ace-icon fa fa-phone fa-flip-horizontal"></i>电话</span>
																							<span class="btn btn-info btn-sm popover-info" data-rel="popover" data-placement="bottom" title="Some Info" data-content="${var.DOCTORINTRO}">医生简介</span>
																			</td>
																		</tr>
																		<tr>
																			<td colSpan="5">
																			<!-- 开始遍历医生排班列表，并与医生列表中医生编码匹配，得到匹配成功排班列表 -->
																				<c:forEach items="${docsMap}" var="dock" varStatus="dk">
																					<c:if test="${dock.key==var.DOCTORCODE}">
																						<c:if test="${empty dock.value}">此医生没有预约信息</c:if>
																						<c:if test="${not empty dock.value}">
																						<c:forEach items="${dock.value}" var="docv" varStatus="dv">
																							<c:if test="${(var.SCHEDULING!=0) && (docv.SCHEDULING!=0)}">
																							<a onclick="save('${var.GUID}','${docv.GUID}');" class="btn btn-app btn-success btn-xs" title="点击预约">
																								<span style="font-size: 12px"><fmt:formatDate pattern="MM/dd"  value="${docv.RECEPTIOND}"/></span>
																								<br>
																								<span style="font-size: 12px"><fmt:formatDate pattern="EEEE"  value="${docv.RECEPTIOND}"/></span>
																								<span class="badge badge-pink"><fmt:formatDate pattern="aa"  value="${docv.RECEPTIONS}"/></span>
																								<br>
																								<span style="font-size: 12px" >总数:${docv.ALLOTNUM}个</span>
																								<br>
																								<span style="font-size: 12px" >剩余:${docv.SCHEDULING}个</span>
																							</a>
																							</c:if>
																							
																							<!-- 没有预约量应该为灰色 -->																							
																							<c:if test="${(docv.SCHEDULING==0) || (var.SCHEDULING==0)}">
																							<a onclick="gonotdocs();" class="btn btn-app btn-grey btn-xs radius-4" title="该时段不能预约或者你已预约,不能重复预约">
																								<span style="font-size: 12px"><fmt:formatDate pattern="MM/dd"  value="${docv.RECEPTIOND}"/></span>
																								<br>
																								<span style="font-size: 12px"><fmt:formatDate pattern="EEEE"  value="${docv.RECEPTIOND}"/></span>
																								<span class="badge"><fmt:formatDate pattern="a"  value="${docv.RECEPTIONS}"/></span>
																								<br>
																								<span style="font-size: 12px" >总数:${docv.ALLOTNUM}个</span>
																								<br>
																								<span style="font-size: 12px" >剩余:${docv.SCHEDULING}个</span>
																							</a>
																							</c:if>
																						</c:forEach>
																						</c:if>
																					</c:if>
																				</c:forEach>
																			</td>
																		</tr>
																	</table>
																</div>
															</div>
															</c:forEach>
															</c:when>
															</c:choose><!-- 循环结束 -->
														</div>
														<!-- /section:pages/profile.feed -->
													</div>
												</div>
											</div>
											
											<!-- 分页 -->
											<div class="page-header position-relative">
												<table style="width:100%;">
													<tr>
														<td style="vertical-align:top;">
															<a class="btn btn-sm btn-success" onclick="goreferral();">返回</a>
														</td>
														<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
													</tr>
												</table>
											</div>
											<!-- <div style="text-align:center;">
												<div style="margin:0 auto; ">
												  <ul class="pagination pagination-lg">
												    <li>
												      <a href="#" aria-label="Previous">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												    <li><a href="#">1</a></li>
												    <li><a href="#">2</a></li>
												    <li><a href="#">3</a></li>
												    <li><a href="#">4</a></li>
												    <li><a href="#">5</a></li>
												    <li>
												      <a href="#" aria-label="Next">
												        <span aria-hidden="true">&raquo;</span>
												      </a>
												    </li>
												  </ul>
												</div>
											</div> -->
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
		jQuery(function($) {
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
		});
		//检索方法
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		//保存预约挂号信息
		function save(docguid,docsguid){
			bootbox.confirm("您确定,为患者${pds.NAME}预约挂号吗？", function(result) {
				if(result){
					top.jzts();//开启加载
					var url="<%=basePath%>regAppointment/saveRegApp.do?REFERRAL_ID=${pds.USER_AGENT_ID}&DOCGUID="+docguid+"&DOCSGUID="+docsguid;//请求保存的url
					$.get(url,function(data){
						//成功回调函数
						if("success"==data.result){
							window.location.href="<%=basePath%>regAppointment/list.do?";
						}else{
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>可预约挂号量不足，请刷新后再试</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
							
					});
				}
			});
		}
		//没有号源
		function gonotdocs(){
			
		}
		//返回居民信息页面
		function goreferral(){
			top.jzts();
			window.location.href="<%=basePath%>jmxx/listJmxx.do";
		};
		$(function() {
			//日期框
			
			$('#applyDateStart').datepicker({
				startDate: new Date()
			});
			$('#applyDateEnd').datepicker({
				startDate: new Date()
			});
		});
	</script>
	
</body>
</html>