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
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


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
						<form action="agreementChange/list.do" method="post" name="Form" id="Form">
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
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">申请人</th>
									<th class="center">签约医生</th>
									<th class="center hidden-480">申请时间</th>
									<th class="center">申请状态</th>
									<th class="center">审批意见</th>
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
											<td class='center'>${var.APPLICANT_NAME}</td>
											<td class='center'>${var.GEN_PRACTITIONER_NAME}</td>
											<td class='center hidden-480'>
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.GMT_CREATED}"/>
											</td>
											<td class='center'>
												<c:if test="${var.STATUS == '0' }"><font color="green">审核中</font></c:if>
												<c:if test="${var.STATUS == '1' }">通过</c:if>
												<c:if test="${var.STATUS == '2' }">退回</c:if>
												<c:if test="${var.STATUS == '3' }">作废</c:if>
											</td>
											<td class='center'>${var.AUDITOR_COMMENT}</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${var.STATUS == '0' }">
                                                        <a class="btn btn-xs btn-success" title="审核" onclick="edit('${var.ID}','${var.STATUS}');">
                                                           	 审核
                                                        </a>
                                                         <a class="btn btn-xs btn-success" title="作废" onclick="del('${var.ID}','${var.STATUS}');">
                                                          	 作废
                                                        </a>
                                                	 </c:if> 
                                                   	<a class="btn btn-xs btn-success" title="变更历史" onclick="viewLogs('${var.AGREEMENT_ID}','${var.STATUS}');">
                                                      	变更历史
                                                    </a>  
                                                   	<c:if test="${var.STATUS == '2' }">
                                                   		<a class="btn btn-xs btn-success" title="编辑" onclick="editObj('${var.ID}','${var.STATUS}');">
                                                                                                                                                            编辑
                                                        </a>
                                                   	</c:if>    
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${var.STATUS == '0' }">
																<li>
		                                                        <a class="btn btn-xs btn-success" title="审核" onclick="edit('${var.ID}','${var.STATUS}');">
		                                                           	 审核
		                                                        </a>
		                                                         <a class="btn btn-xs btn-success" title="作废" onclick="del('${var.ID}','${var.STATUS}');">
		                                                          	 作废
		                                                        </a>
		                                                       </li> 
		                                                	 </c:if> 
															<c:if test="${var.STATUS == '2' }">
																<li>
																	<a style="cursor:pointer;" onclick="editObj('${var.ID}','${var.STATUS}');" class="tooltip-success" data-rel="tooltip" title="编辑">
																		编辑
																	</a>
																</li>
															</c:if>
															<li>
																<a class="btn btn-xs btn-success" title="变更历史" onclick="viewLogs('${var.AGREEMENT_ID}','${var.STATUS}');">
			                                                      	变更历史
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
		
		
		//审核
		function edit(id){
		
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="审核";
				 diag.URL = '<%=basePath%>agreementChange/update.do?ID='+id;
				 diag.Width = 650;
				 diag.Height = 500;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				}
		//变更历史查询
		function viewLogs(id,st){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="变更历史记录表";
			 diag.URL = '<%=basePath%>agreementChange/listLogs.do?AGREEMENT_ID='+id;
			 diag.Width = 700;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
			}
		//作废
		function del(id,st){
			if(st==0){
				bootbox.confirm("确定要作废该申请吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>agreementChange/delete.do?ID="+id;
					$.get(url,function(data){
						 window.location.reload();
					});
				}
			});
		}else{
			alert("协议处于保存状态下才可以删除");
		}
		}
		//编辑
		function editObj(id,st){
		
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑";
				 diag.URL = '<%=basePath%>agreementChange/toeditObj.do?ID='+id;
				 diag.Width = 650;
				 diag.Height = 500;
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