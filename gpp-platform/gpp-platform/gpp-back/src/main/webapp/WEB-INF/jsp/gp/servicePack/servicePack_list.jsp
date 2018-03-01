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
<!-- 服务包列表页面 -->
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
						<form action="servicePack/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="MC" type="text" name="MC" value="${pd.MC }" placeholder="请根据名称搜索" />
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="BM" type="text" name="BM" value="${pd.BM }" placeholder="请根据编码搜索" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="LX" id="LX" data-placeholder="类型" style="vertical-align:top;width: 99px;">
									<option value="">请选择类型</option>
									<c:forEach items="${pd.EnumServicePackLX}" var="item">
                                        <option value="${item.key}" <c:if test="${pd.LX == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                    </c:forEach>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="ZT" id="ZT" data-placeholder="状态" style="vertical-align:top;width: 99px;">
									<option value="">请选择状态</option>
									<c:forEach items="${pd.EnumStatus}" var="item">
                                        <option value="${item.key}" <c:if test="${pd.ZT == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                    </c:forEach>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>搜索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">名称</th>
									<th class="center">编码</th>
									<th class="center">费用(单位：元)</th>
									<th class="center">时限（单位：月）</th>
									<th class="center">类型</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList }" var="varList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${varList.MC }</td>
											<td class="center">${varList.BM }</td>
											<td class="center">${varList.FY }</td>
											<td class="center">${varList.SX }</td>
											<td class='center'>
                                                <c:forEach items="${pd.EnumServicePackLX}" var="s">
                                                    <c:if test="${s.key == varList.LX}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class='center'>
                                                <c:forEach items="${pd.EnumStatus}" var="s">
                                                    <c:if test="${s.key == varList.ZT}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${varList.ID }');">
														编辑
													</a>
													</c:if>
													<c:if test="${QX.edit == 1 && (varList.ZT == 0 || varList.ZT == 2)}">
													<a class="btn btn-xs btn-success" title="启用" onclick="goqy('${varList.ID }','${varList.MC }');">
														启用
													</a>
													</c:if>
													<c:if test="${QX.edit == 1 && varList.ZT == 1 }">
													<a class="btn btn-xs btn-danger" onclick="goty('${varList.ID }','${varList.MC }');">
														停用
													</a>
													</c:if>
													<c:if test="${QX.del == 1 && varList.ZT != 1}">
													<a class="btn btn-xs btn-danger" onclick="del('${varList.ID }','${varList.MC }');">
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
															<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${varList.ID }');">
																编辑
															</a>
															</c:if>
															<c:if test="${QX.edit == 1 && (varList.ZT == 0 || varList.ZT == 2)}">
															<a class="btn btn-xs btn-success" title="启用" onclick="goqy('${varList.ID }','${varList.MC }');">
																启用
															</a>
															</c:if>
															<c:if test="${QX.edit == 1 && varList.ZT == 1 }">
															<a class="btn btn-xs btn-danger" onclick="goty('${varList.ID }','${varList.MC }');">
																停用
															</a>
															</c:if>
															<c:if test="${QX.del == 1 && varList.ZT != 1}">
															<a class="btn btn-xs btn-danger" onclick="del('${varList.ID }','${varList.MC }');">
																删除
															</a>
															</c:if>
														</ul>
													</div>
												</div>
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
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();">
												<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增
										</a>
										<!-- <a class="btn btn-mini btn-success" onclick="add();">新增</a> -->
									</c:if>
								</td>
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
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
		});
		
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#MC").val("");
			$("#BM").val("");
			$("#LX").find("option:selected").attr("selected",false);
			$("#LX").find("option[text='']").attr("selected",true);
			$("#ZT").find("option:selected").attr("selected",false);
			$("#ZT").find("option[text='']").attr("selected",true);
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新服务包";
			 diag.URL = '<%=basePath%>servicePack/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
			 
		}
		
		//修改
		function edit(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改信息";
			 diag.URL = '<%=basePath%>servicePack/goEdit.do?ID='+ID;
			 diag.Width = 800;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//启用
		function goqy(ID,msg){
			bootbox.confirm("确定要启用["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>servicePack/goqy.do?ID="+ID;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//停用
		function goty(ID,msg){
			bootbox.confirm("确定要停用["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>servicePack/goty.do?ID="+ID;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//删除
		function del(ID,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>servicePack/del.do?ID="+ID+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}



		</script>
</html>

