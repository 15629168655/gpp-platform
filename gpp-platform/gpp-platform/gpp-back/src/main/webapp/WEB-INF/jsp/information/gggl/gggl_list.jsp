<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String serverName = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
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
						<form action="gggl/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="qy" id="qy" data-placeholder="是否启用" style="vertical-align:top;width: 120px;">
										<option style="width: 120px;" value="">是否启用</option>
										<option value="1" <c:if test="${pd.qy == '1' }">selected</c:if> >是</option>
										<option value="2" <c:if test="${pd.qy == '2' }">selected</c:if> >否</option>
									</select>
								</td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="start_time" id="start_time"  value="${pd.start_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始时间" title="开始时间"/></td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="end_time" id="end_time"  value="${pd.end_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束时间" title="结束时间"/></td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:0px;table-layout:fixed;">
						<thead>
							<tr>
								<th class="center" onclick="selectAll()" style="width:35px;">
								<label><input type="checkbox" id="zcheckbox" class="ace" /><span class="lbl"></span></label>
								</th>
								<th class="center" style="width:50px;">序号</th>
								<th class="center" >广告类型</th>
								<th class="center" >名称</th>
								<th class="center" >图片</th>
								<th class="center" >开始时间</th>
								<th class="center" >结束时间</th>
								<th class="center" >点击数</th>
								<th class="center" >是否启用</th>
								<th class="center">操作</th>
							</tr>
							</thead>
						<tbody>
						<!-- 开始循环 -->	
						<c:choose>
							<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
										<td class='center' style="width: 30px;">
											<label><input type='checkbox' name='ids' class="ace" value="${var.ID}" /><span class="lbl"></span></label>
										</td>
										<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class="center">
												<c:if test="${var.GG_TYPE == '1' }"><span>首页</span></c:if>
										</td>
										<td class="center" style="WORD-WRAP: break-word;">${var.MC}</td>
										<td class="center">
											<c:if test="${var.IMG_URL != '' && var.IMG_URL!=null}">
											<a href="<%=serverName%>/${var.IMG_URL}" title="${var.MC}" target="_blank" class="bwGal"><img src="<%=serverName%>/${var.IMG_URL}" alt="${var.IMG_URL}" width="100"></a>
											</c:if>
										</td>
										<td class="center">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.START_TIME}"/>
										</td>
										<td class="center">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.END_TIME}"/>
										</td>
										<td class="center">${var.DJS}</td>
										<td class="center">
												<c:if test="${var.QY == '1' }"><span>是</span></c:if>
												<c:if test="${var.QY == '2' }"><span>否</span></c:if>
										</td>
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
							</c:choose>
							</tbody>
						</table>
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
								</td>
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
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
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
		
		
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#qy").val("");
			$("#start_time").val("");
			$("#end_time").val("");
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>gggl/add.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
				 if('${page.currentPage}' == '0'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				 }else{
					 nextPage(${page.currentPage});
				 }
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(ID){
			
			if(confirm("确定要删除?")){ 
				top.jzts();
				var url = "<%=basePath%>gggl/delete.do?ID="+ID;
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		}
		
		//修改
		function edit(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>gggl/update.do?ID='+ID;
			 diag.Width = 600;
			 diag.Height = 465;
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
			if(confirm(msg)){ 
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						alert("您没有选择任何内容!"); 
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>gggl/deleteAll.do?tm='+new Date().getTime(),
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
		}
	</script>


</body>
</html>