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
						<form action="team/teamList.do" method="post" name="Form" id="Form">
						<input type="hidden" id="TEAM_ID" name="TEAM_ID" value="${pd.TEAM_ID}"/>
						<input type="hidden" id="ID" name="ID" value="${pd.TEAM_ID}"/>
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
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">成员姓名</th>
									<th class="center">成员电话</th>
									<th class="center">角色</th>
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
											<td class='center'>${var.TEAM_MEMBER_NAME}</td>
											<td class='center'>${var.TEAM_MEMBER_PHONE}</td>
											<td class='center'>
												<c:forEach items="${pd.EnumRoleName}" var="s">
                                                    <c:if test="${s.key == var.ROLE_NAME}">${s.value}</c:if>
                                                </c:forEach>
											</td>
												<td class='center'>
                                                <c:forEach items="${pd.memberStatus}" var="s">
                                                    <c:if test="${s.key == var.STATUS}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											<td class="center" style="width: 200px;">
                                                       <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                           	 编辑
                                                        </a>
                                                         <a class="btn btn-xs btn-danger" title="删除" onclick="del('${var.ID}');">
                                                           	删除
                                                        </a>
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
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();"><i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>新增成员</a> 
									</c:if>
									  <a title="返回" class="btn btn-mini btn-danger" onclick="top.Dialog.close();" ><i class="ace-icon fa fa-reply icon-only"></i>返回</a>  
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
		
		//清空查询条件
		function refresh(){
			$("#nav-search-input").val("");
			$("#STATUS").find("option:selected").attr("selected",false);
			$("#STATUS").find("option[text='']").attr("selected",true);
		}
		
		//新增
		function add(){
			var team_id = document.getElementById("TEAM_ID").value;
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新增";
				 diag.URL = '<%=basePath%>team/addMember.do?TEAM_ID='+team_id;
				 diag.Width = 600;
				 diag.Height = 400;
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
				 diag.URL = '<%=basePath%>team/updateMember.do?ID='+id;
				 diag.Width = 600;
				 diag.Height = 400;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				}
		
		 //签约团队状态
			function del(id){
				var status = $("#STATUS").val();  	
	            $.ajax({
	                type: "POST",
	                url: '<%=basePath%>team/memberDel.do?ID='+id,
	                data: {
	                    STATUS:status,
	                },
	                success: function (data) {
	                	debugger;
	                       if("success" != data.result){
		                      $("#STATUS").val(data.STATUS);
		                       window.location.reload();
			           }
	                }
	            })			
	        }
		
		</script>
		
</body>
</html>