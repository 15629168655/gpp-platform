﻿﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
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
						<form action="workflow/list.do?OGR_CODE=${ORG_CODE}" method="post" name="Form" id="Form">
							<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${ORG_CODE}" />
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="keywords" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" style="width: 200px"/>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<select class="pos-rel" name="queryHospitalRank" id="queryHospitalRank" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
										<option value="" selected="selected">&nbsp;全部级别</option>
										<c:forEach items="${pd.enumHospitalRank}" var="item">
											<c:choose>
												<c:when test="${pd.queryHospitalRank == item.key}">
													<option value="${item.key}" selected="selected">${item.value}</option>
												</c:when>
												<c:otherwise>
													<option value="${item.key}">${item.value}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<select class="pos-rel" name="queryReferralType" id="queryReferralType" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
										<option value="" selected="selected">&nbsp;全部转诊类型</option>
										<c:forEach items="${pd.enumReferralType}" var="item">
											<c:choose>
												<c:when test="${pd.queryReferralType != '' && pd.queryReferralType == item.key}">
													<option value="${item.key}" selected="selected">${item.value}</option>
												</c:when>
												<c:otherwise>
													<option value="${item.key}">${item.value}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:25%;">签约机构编码</th>
									<th class="center" style="width:30%;">签约机构名称</th>
									<th class="center" style="width:20%;">签约机构等级</th>
									<th class="center" style="width:10%;">转诊类型</th>
									<th class="center" style="width:10%;">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.WORKFLOW_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.SIGN_ORG_CODE}</td>
											<td class='center'>${var.SIGN_ORG_NAME}</td>
											<td class='center'>
												<c:forEach items="${pd.enumHospitalRank}" var="entry">
													<c:if test="${entry.key == var.SIGN_ORG_RANK}">${entry.value}</c:if>
												</c:forEach>
											</td>
											<td class='center'>
												<c:forEach items="${pd.enumReferralType}" var="entry">
													<c:if test="${entry.key == var.REFERRAL_TYPE}">${entry.value}</c:if>
												</c:forEach>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.WORKFLOW_ID}');">
														 编辑
													 </a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" title="删除" onclick="del('${var.WORKFLOW_ID}');">
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
															<%--<li>--%>
																<%--<a style="cursor:pointer;" onclick="edit('${var.WORKFLOW_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">--%>
																	<%--<span class="green">--%>
																		<%--<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>--%>
																	<%--</span>--%>
																<%--</a>--%>
															<%--</li>--%>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.WORKFLOW_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
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
									<a class="btn btn-mini btn-success" onclick="add('${ORG_CODE}');"><i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<%--<script type="text/javascript" src="static/js/jquery.tips.js"></script>--%>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#keywords").val("");
			$("#queryHospitalRank").find("option:selected").attr("selected",false);
			$("#queryHospitalRank").find("option[text='']").attr("selected",true);
			$("#queryReferralType").find("option:selected").attr("selected",false);
			$("#queryReferralType").find("option[text='']").attr("selected",true);
		}
		
		$(function() {

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
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(ORG_CODE){
//			 top.jzts();
			 var treeObj = parent.window.$.fn.zTree.getZTreeObj("leftTree");
			 var nodes = treeObj.getSelectedNodes();
			 if(jQuery.isEmptyObject(nodes) || nodes[0].name=="全部")
			 {
				 bootbox.alert("请先选择树的某一节点,再点新增", function() {

				 });
				 return;
			 }else{
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新增";
				 diag.URL = '<%=basePath%>workflow/goAdd.do?ORG_CODE='+ORG_CODE;
				 diag.Width = 440;
				 diag.Height = 400;
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
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>workflow/delete.do?WORKFLOW_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
//			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>workflow/goEdit.do?WORKFLOW_ID='+Id;
			 diag.Width = 400;
			 diag.Height = 388;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			var treeObj = parent.window.$.fn.zTree.getZTreeObj("leftTree");
			var nodes = treeObj.getSelectedNodes();
			if(jQuery.isEmptyObject(nodes) || nodes[0].name=="全部")
			{
				bootbox.alert("请先选择树的某一节点,再点删除");
				return;
			}else{
				bootbox.confirm(msg, function(result) {
					if(result) {
						var str = '';
						for(var i=0;i < document.getElementsByName('ids').length;i++){
						  if(document.getElementsByName('ids')[i].checked){
							if(str=='') str += document.getElementsByName('ids')[i].value;
							else str += ',' + document.getElementsByName('ids')[i].value;
						  }
						}
						if(str==''){
							bootbox.dialog({
								message: "<span class='bigger-110'>您没有选择任何内容!</span>",
								buttons:
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							$("#zcheckbox").tips({
								side:1,
								msg:'点这里全选',
								bg:'#AE81FF',
								time:8
							});
							return;
						}else{
							if(msg == '确定要删除选中的数据吗?'){
								top.jzts();
								$.ajax({
									type: "POST",
									url: '<%=basePath%>workflow/deleteAll.do?tm='+new Date().getTime(),
									data: {DATA_IDS:str},
									dataType:'json',
									//beforeSend: validateData,
									cache: false,
									success: function(data){
										 $.each(data.list, function(i, list){
												nextPage(${page.currentPage});
										 });
									}
								});
							}
						}
					}
				})
			}
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>workflow/excel.do';
		}
	</script>


</body>
</html>