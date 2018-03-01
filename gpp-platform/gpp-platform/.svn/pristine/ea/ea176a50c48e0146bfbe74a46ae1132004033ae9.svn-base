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
<!-- 住院病案首页列表页面 -->
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
						<!-- 检索  -->
						<form action="cisMain/list.do?id=${pd.id }" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="YLJGDM" type="text" name="YLJGDM" value="${pd.YLJGDM }" placeholder="根据医疗机构代码搜索" title="根据医疗机构代码搜索"/>
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="SFZ" type="text" name="SFZ" value="${pd.SFZ }" placeholder="根据身份证搜索" title="根据身份证搜索"/>
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="XM" type="text" name="XM" value="${pd.XM }" placeholder="根据患者姓名搜索" title="根据患者姓名搜索"/>
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="PERSONID" type="text" name="PERSONID" value="${pd.PERSONID }" placeholder="根据院内患者唯一ID号搜索" title="根据院内患者唯一ID号搜索"/>
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="JZLSH" type="text" name="JZLSH" value="${pd.JZLSH }" placeholder="根据就诊流水号搜索" title="根据就诊流水号搜索"/>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">就诊流水号</th>
									<th class="center">患者姓名</th>
									<th class="center">主治医生姓名</th>
									<th class="center">入院病情</th>
									<th class="center">入院病区（房）</th>
									<th class="center">出院病区（房）</th>
									
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList }" var="varList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${varList.YLJGDM }" id="${varList.YLJGDM }" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${varList.JZLSH }</td>
											<td class="center">${varList.XM }</td>
											<td class="center">${varList.ZZYSXM }</td>
											<td class="center">${varList.RYQK }</td>
                                            <td class="center">${varList.RYBQ }</td>
                                            <td class="center">${varList.CYBQ }</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
														<a class="btn btn-xs btn-success" title="查看详情" onclick="CKXQ('${varList.JZLSH}','${varList.YLJGDM}','${varList.ID}','${pd.USER_AGENT_ID }');">
															<i class="ace-icon fa fa-search bigger-120" title="查看详情"></i>查看
														</a>
												</div>
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
		//检索
		function searchs(){			
			//top.jzts();
			$("#userForm").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#YLJGDM").val("");
			$("#SFZ").val("");
			$("#XM").val("");
			$("#PERSONID").val("");
			$("#JZLSH").val("");
		}
		
		//查看详情
		function CKXQ(JZLSH,YLJGDM,ID,user_id){
			 //top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="住院病案首页详情";
			 diag.URL = '<%=basePath%>cisMain/goCKXQ.do?JZLSH='+JZLSH+'&YLJGDM='+YLJGDM+'&ID='+ID+'&USER_AGENT_ID='+user_id;
			 diag.Width = 900;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}

		</script>
</html>

