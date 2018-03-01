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
<!-- 基层卫生提醒页面 -->
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
						<form action="lcxm/list.do?BM=${pd.BM}" method="post" name="Form" id="Form">
							<table style="margin-top:5px;">
								<tr>
									<td>
										<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入项目名称" />
										</div>
									</td>
									<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
									<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</tr>
							</table>
						</form>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">临床项目</th>
									<th class="center">收费项目名称</th>
									<th class="center">规格</th>
									<th class="center">单位</th>
									<th class="center">单价</th>
									<th class="center">数量</th>
									<th class="center">金额</th>
									<th class="center">计费规则</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty list}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${list}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.LCXM}</td>
											<td class='center'>${var.SFXMMC}</td>
											<td class='center'>${var.GG}</td>
											<td class='center'>${var.DW}</td>
											<td class='center'>${var.DJ}</td>
											<td class='center'>${var.SL}</td>
											<td class='center'>${var.JE}</td>
											<td class='center'>${var.JFGZ}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.cha != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
												<c:if test="${QX.edit == 1 }">
                                                    <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                          	修改数量                                                                                                                                                   
                                                    </a>  
												</c:if>
												<c:if test="${QX.del == 1 }">
                                                       <a class="btn btn-xs btn-danger" onclick="del('${var.ID}','${var.SFXM}');">
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
			                                                    <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
			                                                          	修改数量                                                                                                                                                   
			                                                    </a>  
															</c:if>
															<c:if test="${QX.del == 1 }">
																<a class="btn btn-xs btn-danger"  title="删除" onclick="del('${var.ID}','${var.SFXM}');">删除</a>
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
										<a class="btn btn-mini btn-success" onclick="add('${pd.BM}');">
												<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增
										</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
									<!-- 
								  	<a class="btn btn-mini btn-success" onclick="makeAll('确定要将选中的数据标记为已读吗?');" title="批量标记为已读" >已读</a>
								  	<a class="btn btn-mini btn-success" onclick="makeAll('确定要将选中的数据标记为未读吗?');" title="批量标记为未读" >未读</a>  
									 --> 
									</c:if>
									<c:if test="${QX.del == 1 }">
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
									</c:if>
								</td>
									<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						
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
		
		//新增
		function add(msg){
				if(msg == "AAA")
				{
					bootbox.alert("顶级菜单项不能添加数据");
					return;
				}
				var diag = new top.Dialog();
                diag.Drag=true;
                diag.Title ="新增";
                diag.URL = '<%=basePath%>lcxm/goAddSfxm.do?BM='+msg;
                diag.Width = 900;
                diag.Height = 770;
                diag.CancelEvent = function(){ //关闭事件
                   top.jzts();
                   setTimeout("self.location=self.location",100);
                   diag.close();
                };
                diag.show();

            }
		
		//修改数量
		function edit(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改数量";
			 diag.URL = '<%=basePath%>lcxm/goEditSL.do?ID='+ID;
			 diag.Width = 300;
             diag.Height =130;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						 //nextPage(${page.currentPage});
					 window.location.reload();
				}
				diag.close();
			 };
			 diag.show();
				
		}
		
		//单条删除
		function del(ID,msg){
			bootbox.confirm("确定要将["+msg+"]删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>lcxm/del.do?ID="+ID;
					$.get(url,function(data){
						var LCXM = data.LCXM;
						parent.location.href="<%=basePath%>lcxm/listAll.do?LCXM="+LCXM;
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
					}
					if(msg == '确定要删除选中的数据吗?'){
						top.jzts();
						$.ajax({
							type: "POST",
							url: '<%=basePath%>lcxm/deleteAll.do?tm='+new Date().getTime(),
					    	data: {ids:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								var LCXM = data.LCXM;
								parent.location.href="<%=basePath%>lcxm/listAll.do?LCXM="+LCXM;
							}
						});
					}
				}
			});
		}
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#nav-search-input").val("");
		}
		
		</script>


</body>
</html>