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
<script type="text/javascript" charset="utf-8" src="plugins/Ueditor_Formdesign_Plugins/formdesign/jquery-1.7.2.min.js"></script>
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
						<form action="emrform/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="TEMPLATE_TYPE" id="TEMPLATE_TYPE" data-placeholder="模板类型" title="模板类型" style="vertical-align:top;width: 100px;">
									<option value="">模板类型</option>
									<option value="0" <c:if test="${pd.TEMPLATE_TYPE == '0' }">selected</c:if> >标准模板</option>
									<option value="1" <c:if test="${pd.TEMPLATE_TYPE == '1' }">selected</c:if> >专科模板</option>
									<option value="2" <c:if test="${pd.TEMPLATE_TYPE == '2' }">selected</c:if> >个人模板</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">模板名称</th>
									<th class="center">模板类型</th>
									<th class="center">适应性别</th>
									<th class="center">是否必须</th>
									<th class="center">备注</th>
									<th class="center">生成时间</th>
									<th class="center">操作人</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.TEMPLATE_NAME}</td>
											<td class='center'>
                                                <c:forEach items="${pd.EnumErmForm}" var="s">
                                                    <c:if test="${s.key == var.TEMPLATE_TYPE}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class='center'>
                                                <c:forEach items="${pd.EnumTySex}" var="s">
                                                    <c:if test="${s.key == var.SEX}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class='center'>
                                                <c:forEach items="${pd.EnumMust}" var="s">
                                                    <c:if test="${s.key == var.MUST}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											<td class='center'>${var.BZ}</td>
											<td class='center'>
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.CREATE_TIME}"/>
											</td>
											<td class='center'>${var.OPERATION_NAME}</td>
											 <td class='center'>
                                                <c:forEach items="${pd.EnumStatus}" var="s">
                                                    <c:if test="${s.key == var.STATUS}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
														<a class="btn btn-xs btn-success" title="表单预览" onclick="viewForm('${var.ID}');">
                                                            	预览
                                                        </a>
                                                        <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                          	  	编辑
                                                        </a>
                                                        <a class="btn btn-xs btn-success" title="设计" onclick="formDesigner('${var.ID}');">
                                                          	  	设计
                                                        </a>
                                                        <a class="btn btn-xs btn-danger" onclick="del('${var.ID}');">
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
																<a style="cursor:pointer;" onclick="viewForm('${var.ID}');" class="btn btn-mini btn-info" data-rel="tooltip" title="表单预览">
																	 <span class="green">
																		预览
																	 </span>
																</a>
															</li>
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.ID}');" class="btn btn-mini btn-info" data-rel="tooltip" title="编辑">
																	 <span class="green">
																		编辑
																	 </span>
																</a>
															</li>
															<li>
																<a style="cursor:pointer;" onclick="formDesigner('${var.ID}');" class="btn btn-mini btn-info" data-rel="tooltip" title="设计">
																	 <span class="green">
																		设计
																	 </span>
																</a>
															</li>
															<li>
																<a style="cursor:pointer;" onclick="del('${var.ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		删除
																	</span>
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
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									<!--  a class="btn btn-sm btn-success" onclick="toFormDes();">表单设计</a>-->
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
		
		
		//新增
		function add(){
		
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新增";
				 diag.URL = '<%=basePath%>emrform/add.do';
				 diag.Width = 600;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
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
				 diag.URL = '<%=basePath%>emrform/update.do?ID='+id;
				 diag.Width = 600;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
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
					var url = "<%=basePath%>emrform/del.do?ID="+id;
					$.get(url,function(data){
						//nextPage(${page.currentPage});
						 window.location.reload();
					});
				}
			});
		}
		//表单设计
		function formDesigner(id){
			 top.jzts();
			 var url= '<%=basePath%>emrform/getHtmlContent.do';
			 $.post(url,{"ID":id},function(data){
				 var parse=data.data.YSNR;
				 sessionStorage.obj=parse;
				 sessionStorage.id=id;
		        $('li #z135 a', window.parent.parent.document).trigger('click');
			 });
			
		}
		//表单预览
		function viewForm(id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="表单预览";
			 diag.URL = '<%=basePath%>emrform/toViewForm.do?ID='+id;
			 diag.Width = 700;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						 //nextPage(${page.currentPage});
					 window.location.reload();
				}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		
</body>
</html>