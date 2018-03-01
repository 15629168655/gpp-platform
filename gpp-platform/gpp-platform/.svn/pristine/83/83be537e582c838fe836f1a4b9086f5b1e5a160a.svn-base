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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
						<form action="payservice/list.do?ID=0" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									</div>
								</td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;width:100%">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">类型</th>
									<th class="center">编码</th>
									<th class="center">分类编码</th>
									<th class="center">名称</th>
									<th class="center">规格</th>
									<th class="center">剂型</th>
									<th class="center">药房单位</th>
									<th class="center">药库单位</th>
									<th class="center">换算系数</th>
									<th class="center">会员价</th>
									<th class="center">零售价</th>
									<th class="center">内部价</th>
									<th class="center">成本价</th>
									<th class="center">批发价</th>
									<th class="center">调拨价</th>
									<th class="center">销售价</th>
									<th class="center">住院价</th>
									<th class="center">用量单位</th>
									<th class="center">操作员</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.TYPE}</td>
											<td class='center'>${var.BM}</td>
											<td class='center'>${var.FLBM}</td>
											<td class='center'>${var.MC}</td>
											<td class='center'>${var.GG}</td>
											<td class='center'>${var.JX}</td>
											<td class='center'>${var.YFDW}</td>
											<td class='center'>${var.YKDW}</td>
											<td class='center'>${var.HSXS}</td>
											<td class='center'>${var.HYJ}</td>
											<td class='center'>${var.LSJ}</td>
											<td class='center'>${var.NBJ}</td>
											<td class='center'>${var.CBJ}</td>
											<td class='center'>${var.PFJ}</td>
											<td class='center'>${var.TBJ}</td>
											<td class='center'>${var.XSJ}</td>
											<td class='center'>${var.ZYJ}</td>
											<td class='center'>${var.YLDW}</td>
											<td class='center'>${var.CZY}</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
                                                       <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                           	 编辑
                                                        </a>
                                                         <a class="btn btn-xs btn-danger" title="删除" onclick="del('${var.ID}');">
                                                           	删除
                                                        </a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																 <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                           	 编辑
                                                       			 </a>
															</li>
															<li>
																 <a class="btn btn-xs btn-danger" title="删除" onclick="del('${var.ID}');">
                                                           	删除
                                                        		</a>
															</li>
														</ul>
													</div>
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
								<td style="vertical-align:top;">
									  <a class="btn btn-mini btn-success" onclick="add('${pd.BM}');"><i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>新增</a>
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
	
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#nav-search-input").val("");
		}
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		
		
		//新增
		function add(BM){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>payservice/add.do?FLBM='+BM;
			 diag.Width = 1000;
			 diag.Height = 800;
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
		
		
	function edit(id){
		 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑";
				 diag.URL = '<%=basePath%>payservice/update.do?ID='+id;
				 diag.Width = 1000;
			 	 diag.Height = 800;
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
		//删除
		function del(id){
				bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>payservice/delete.do?ID="+id;
					$.get(url,function(data){
						nextPage(${page.currentPage});
						// window.location.reload();
					});
				}
			});
		}		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
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
								url: '<%=basePath%>payservice/deleteAll.do',
						    	data: {ids:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									nextPage(${page.currentPage});
								}
							});
						}
					}
				}
			});
		}
		
		</script>
		
		
</body>
</html>