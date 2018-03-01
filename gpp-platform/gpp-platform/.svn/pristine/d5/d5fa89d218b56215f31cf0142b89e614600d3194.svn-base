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
						<form action="team/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="STATUS" id="STATUS" data-placeholder="状态"  style="vertical-align:top;width: 75px;">
									<option value=""></option>
									<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >启用</option>
									<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >取消</option>
									<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if> >删除</option>
									</select>
								</td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">团队名称</th>
									<th class="center">负责人姓名</th>
									<th class="center">负责人电话</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>成立时间</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList }" var="varList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${varList.ID }" id="${varList.ID }" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${varList.TEAM_NAME }</td>
											<td class="center">${varList.LEADER_NAME }</td>
											<td class="center">${varList.LEADER_PHONE }</td>
											<td class="center">
											<fmt:formatDate pattern="yyyy-MM-dd"  value="${varList.GMT_BUILD}"/>
											</td>
											<td class="center">
												 <c:forEach items="${pd.EnumStatus}" var="s">
                                                    <c:if test="${s.key == varList.STATUS}">${s.value}</c:if>
                                                </c:forEach>
											</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
                                                       <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${varList.ID}');">
                                                           	 编辑
                                                        </a>
                                                        <c:if test="${varList.STATUS == 1}">
	                                                        <a class="btn btn-xs btn-success" title="启用" onclick="editSta('${varList.ID}','0');">
	                                                           	 启用
	                                                        </a>
	                                                    </c:if> 
	                                                    <c:if test="${varList.STATUS == 0}">   
	                                                        <a class="btn btn-xs btn-success" title="停用" onclick="editSta('${varList.ID}','1');">
	                                                           	 停用
	                                                        </a>
                                                        </c:if>
                                                         <a class="btn btn-xs btn-danger" title="删除" onclick="del('${varList.ID}');">
                                                           	删除
                                                        </a>
                                                        <a class="btn btn-xs btn-success" title="团队成员" onclick="member('${varList.ID}');">
                                                           	团队成员
                                                        </a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																 <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${varList.ID}');">
                                                           			 编辑
                                                       			 </a>
															</li>
															 <c:if test="${varList.STATUS == 1}">
		                                                        <a class="btn btn-xs btn-success" title="启用" onclick="editSta('${varList.ID}','0');">
		                                                           	 启用
		                                                        </a>
		                                                    </c:if> 
		                                                    <c:if test="${varList.STATUS == 0}">   
		                                                        <a class="btn btn-xs btn-success" title="停用" onclick="editSta('${varList.ID}','1');">
		                                                           	 停用
		                                                        </a>
	                                                        </c:if>
															<li>
																 <a class="btn btn-xs btn-danger" title="删除" onclick="del('${varList.ID}');">
                                                           			删除
                                                        		</a>
															</li>
															<li>
																 <a class="btn btn-xs btn-success" title="团队成员" onclick="member('${varList.ID}');">
                                                           	团队成员
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
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();"><i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>新增</a> 
									</c:if>
									<c:if test="${QX.del == 1 }">
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
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
		
		//删除
		function del(id){
				bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>team/delete.do?ID="+id;
					$.get(url,function(data){
						//nextPage(${page.currentPage});
						 window.location.reload();
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
								url: '<%=basePath%>team/deleteAll.do',
						    	data: {ids:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									debugger;
									nextPage(${page.currentPage});
								}
							});
						}
					}
				}
			});
		}
		
		//新增
		function add(){
		
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新增";
				 diag.URL = '<%=basePath%>team/add.do';
				 diag.Width = 650;
				 diag.Height = 450;
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
				 diag.URL = '<%=basePath%>team/update.do?ID='+id;
				 diag.Width = 650;
				 diag.Height = 450;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				}
		
		//团队成员
		function member(id){
			//var id = document.getElementById("ids").value;
		 	top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="团队成员列表";
				 diag.URL = '<%=basePath%>team/teamList.do?ID='+id;
				 diag.Width = 900;
				 diag.Height = 500;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
				}
		//启用，停用
		function editSta(id,sta){
			var _url = '<%=basePath%>team/editTeamStatus.do';
			$.post(_url,{"STATUS":sta,"ID":id},function(data){
				 window.location.reload();
			});
		}
		</script>
		
		
</body>
</html>