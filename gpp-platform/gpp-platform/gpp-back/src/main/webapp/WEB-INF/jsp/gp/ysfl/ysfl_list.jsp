﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%@ include file="../../system/index/top.jsp"%>
	
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
							<form action="ysfl/list.do" method="post" name="Form" id="Form">
							<table style="margin-top:5px;">
								<tr>
									<td>
										<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" id="keywords" type="text" name="keywords" value="${pd.keywords }" placeholder="输入关键字搜索" />
										</div>
									</td>
									
									<c:if test="${QX.cha == 1 }">
									<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="gsearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
									<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
									</c:if>
								</tr>
							</table>
							<!-- 检索  -->
			
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class='center'>名称</th>
								 		<th class='center' style="width: 80px;">排序号</th>  
								 		<th class='center' style="width: 50px;">状态</th>
										<th class='center' style="width: 120px;">操作</th>
									</tr>
								</thead>

								<tbody>
								<c:choose>
									<c:when test="${not empty menuList}">
									<c:forEach items="${menuList}" var="menu" varStatus="vs">
									<tr>
										<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class='center'>
											<a href="javascript:goSonmenu('${menu.ID }')">${menu.MC }</a>
										</td>
										<td class='center' style="width: 30px;">${menu.PXH }</td>
										<td class='center'>
											<c:if test="${menu.ZT == '0' }">
											
											<span class="label label-important arrowed-in">停用</span>
											</c:if>
											<c:if test="${menu.ZT == '1' }">
											<span class="label label-success arrowed">启用</span>
											</c:if>
										</td>	
										<td class='center'>
											<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
											</c:if>
											<%-- <div class="hidden-sm hidden-xs action-buttons">
												<c:if test="${QX.edit == 1 }">
												
												<a class="green" href="javascript:editmenu('${menu.ID }');">
													<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
												</a>
												</c:if>
												<c:if test="${QX.del == 1 }">
												<a class="red" href="javascript:delmenu('${menu.ID }');">
													<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
												</a>
												</c:if>
											</div> --%>
											<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editmenu('${menu.ID }');">
														编辑
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="delmenu('${menu.ID }');">
														删除
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="editmenu('${menu.ID }');" class="tooltip-success" data-rel="tooltip" title="编辑">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="delmenu('${menu.ID }');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											
											<%-- <div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button
														class="btn btn-minier btn-yellow dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i
															class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>

													<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														<c:if test="${QX.edit == 1 }">
														
														<li><a href="javascript:editmenu('${menu.ID }');" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改"></i>
															</span>
														</a></li>
														</c:if>
														<c:if test="${QX.del == 1 }">
														<li><a href="javascript:delmenu('${menu.ID }');" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red"> <i class="ace-icon fa fa-trash-o bigger-120"  title="删除"></i>
															</span>
														</a></li>
														</c:if>
													</ul>
												</div>
											</div> --%>
										</td>
									</tr>
									</c:forEach>
									</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							</form>
							<div>
								&nbsp;&nbsp;
								<c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" onclick="addmenu('${pd.ID}');">
										<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
										新增
									</a>
								</c:if>
								<c:if test="${null != pd.ID && pd.ID != ''}">
									<a class="btn btn-mini btn-success" onclick="goSonmenu('${pd.PID}');">返回</a>
								</c:if>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</div>
							
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
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

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(document).ready(function(){
			top.hangge();
		});	
		
		//检索
		function gsearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#keywords").val("");
		}
		
		//去此ID下子菜单列表
		function goSonmenu(ID){
			top.jzts();
			window.location.href="<%=basePath%>ysfl/list.do?ID="+ID;
		};
		
		//新增菜单
		function addmenu(ID){
			top.jzts();
			window.location.href="<%=basePath%>ysfl/toAdd.do?ID="+ID;
		};
		
		//编辑菜单
		function editmenu(ID){
			top.jzts();
			window.location.href="<%=basePath%>ysfl/toEdit.do?id="+ID;
		};
		
		//删除
		function delmenu(ID){
			bootbox.confirm("确定要删除此菜单吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>ysfl/delete.do?ID="+ID;
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							parent.location.href="<%=basePath%>ysfl/goTree.do?id=${ID}&dnowPage=${page.currentPage}";
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败,请先删除子菜单!</span>",
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
		
	</script>


</body>
</html>