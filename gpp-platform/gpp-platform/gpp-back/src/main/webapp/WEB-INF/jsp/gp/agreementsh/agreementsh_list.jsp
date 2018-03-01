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
						<form action="agreementsh/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									</div>
								</td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="createdStart" id="createdStart"  value="${pd.createdStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="申请时间起" title="申请时间开始"/></td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="createdEnd" id="createdEnd"  value="${pd.createdEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="申请时间止" title="申请时间结束"/></td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">申请人姓名</th>
									<th class="center">申请人电话</th>
									<th class="center">申请人状态</th>
									<th class="center">申请时间</th>
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
											<td class='center'>${var.APPLICANT_NAME}</td>
											<td class='center'>${var.APPLICANT_PHONE}</td>
											<td class='center'>
                                                <c:forEach items="${pd.enumApply}" var="s">
                                                    <c:if test="${s.key == var.STATUS}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											<td class="center">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.GMT_CREATED}"/>
											</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
														 <c:if test="${var.STATUS !=1 && var.STATUS!=2 && var.STATUS!=3}">
                                                        <a class="btn btn-xs btn-success" title="审核" onclick="edit('${var.ID}');">
                                                           	 审核
                                                        </a>
                                                        </c:if>
                                                         <c:if test="${var.STATUS!=3}">
                                                         <a class="btn btn-xs btn-danger" title="作废" onclick="del('${var.ID}');">
                                                           	作废
                                                        </a>
                                                        </c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																 <a class="btn btn-xs btn-success" title="审核" onclick="edit('${var.ID}');">
                                                           	 审核
                                                       			 </a>
															</li>
															<li>
																 <a class="btn btn-xs btn-danger" title="作废" onclick="del('${var.ID}');">
                                                           	作废
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
		
		//检索
		function searchs(){
			
			//检查日期
			function checkTime(){ 
				
			    var startTime=$("#createdStart").val();  
				
			    var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
			    
			    var endTime=$("#createdEnd").val();  
			    
			    var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
			    
			    if(end<start){  
			        return false;  
			    }  
			    return true;  
			} 
			if(!checkTime()){  
			    alert("申请时间止必须晚于申请时间起！");  
			    return;  
			}
			
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
		
		
		//修改
		function edit(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>agreementsh/update.do?ID='+id;
			 diag.Width = 950;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 window.location.reload();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(id){
				bootbox.confirm("确定要作废吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>agreementsh/delete.do?ID="+id;
					$.get(url,function(data){
						//nextPage(${page.currentPage});
						 window.location.reload();
					});
				}
			});
		}			
		
		//清空查询条件
		function refresh(){
			$("#createdStart").val("");
			$("#nav-search-input").val("");
			$("#createdEnd").val("");
		}

		</script>


</body>
</html>