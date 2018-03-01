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
						<!-- 信息管理-意见反馈 -->
						<!-- 检索  -->
						<form action="feedback/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="根据提交人搜索" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="form-control" id="STATE" name="STATE" style="width:120px;">
								 		<option value="" >状态</option>
                                        <c:forEach items="${pd.EnumTreated}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.STATE == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="start_time" id="start_time"  value="${pd.start_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="提交时间起" title="提交时间开始"/></td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="end_time" id="end_time"  value="${pd.end_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="提交时间止" title="提交时间结束"/></td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:0px;">
						<thead>
							<tr>
								<th class="center" onclick="selectAll()" style="width:35px;">
								<label><input type="checkbox" id="zcheckbox" class="ace" /><span class="lbl"></span></label>
								</th>
								<th class="center" style="width:50px;">序号</th>
								<th class="center" >提交人</th>
								<th class="center" >联系方式</th>
								<th class="center" >提交时间</th>
								<th class="center" >内容</th>
								<th class="center" >状态</th>
								<th class="center" >处理人</th>
								<th class="center" >处理人意见</th>
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
										<td class="center">${var.TJR}</td>
										<td class="center">${var.LXFS}</td>
										<td class="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.TJSJ}"/></td>
										<td class="center">${var.REMARK}</td>
										<td class='center'>
                                                <c:forEach items="${pd.EnumTreated}" var="s">
                                                    <c:if test="${s.key == var.STATE}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
										<td class="center">${var.CLR}</td>
										<td class="center">${var.CLREMARK}</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
                                                       <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                           	 编辑
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
			$("#nav-search-input").val("");
			$("#STATE").find("option:selected").attr("selected",false);
			$("#STATE").find("option[text='']").attr("selected",true);
			$("#start_time").val("");
			$("#end_time").val("");
		}
		
		//修改
		function edit(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>feedback/update.do?ID='+ID;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
	</script>


</body>
</html>