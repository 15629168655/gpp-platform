<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<form action="autoRegister/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="keywords" type="text" name="keywords" value="${pd.keywords }" placeholder="根据关键字搜索" />
									</div>
								</td>
							 	<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
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
									<th class="center">科室名称</th>
									<th class="center">挂号方式</th>
									<th class="center">患者姓名</th>
									<th class="center">医疗费用来源类别</th>
									<th class="center">挂号类别</th>
									<th class="center">自费诊疗费</th>
									<th class="center">诊疗费</th>
									<th class="center">其它费</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>挂/退号日期</th>
									<th class="center">就诊状态</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty list}">
									<c:if test="${QX.cha == 1 }"> 
									<c:forEach items="${list }" var="list" >
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${list.ID }" id="${list.ID }" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class="center">${list.KSMC}</td>
											<td class="center">
												<c:if test="${list.GHFS =='1'}">自助机</c:if>
												<c:if test="${list.GHFS == '2' }">窗口</c:if>
												<c:if test="${list.GHFS == '3' }">网上预约</c:if>
												<c:if test="${list.GHFS == '4' }">电话预约</c:if>
												<c:if test="${list.GHFS == '5' }">（复）诊间预约</c:if>
												<c:if test="${list.GHFS == '6' }">社区（转诊）预约</c:if>
												<c:if test="${list.GHFS == '7' }">VIP预约</c:if>
												<c:if test="${list.GHFS == '9' }">移动APP预约</c:if>
												<c:if test="${list.GHFS == '99' }">其他</c:if>
											</td>
											<td class="center">${list.XM}</td>
											<td class="center">
												<c:if test="${list.YLFYLYLB == '01'}">城镇职工基本医疗保险</c:if>
												<c:if test="${list.YLFYLYLB == '02' }">城镇居民基本医疗保险</c:if>
												<c:if test="${list.YLFYLYLB == '03' }">新型农村合作医疗</c:if>
												<c:if test="${list.YLFYLYLB == '04' }">贫困救助</c:if>
												<c:if test="${list.YLFYLYLB == '05' }">商业医疗保险</c:if>
												<c:if test="${list.YLFYLYLB == '06' }">全公费</c:if>
												<c:if test="${list.YLFYLYLB == '07' }">全自费</c:if>
												<c:if test="${list.YLFYLYLB == '08' }">其他社会保险</c:if>
												<c:if test="${list.YLFYLYLB == '99' }">其他</c:if>
											</td>
											<td class="center">
												<c:if test="${list.GHLB == '100'}">普通门诊</c:if>
												<c:if test="${list.GHLB == '101'}">专科门诊</c:if>
												<c:if test="${list.GHLB == '102'}">专家门诊</c:if>
												<c:if test="${list.GHLB == '103'}">特需门诊</c:if>
												<c:if test="${list.GHLB == '104'}">专病门诊</c:if>
												<c:if test="${list.GHLB == '200'}">急诊</c:if>
												<c:if test="${list.GHLB == '600'}">体检</c:if>
												<c:if test="${list.GHLB == '999'}">其他</c:if>
											</td>
											<td class="center">${list.ZFZLF}</td>
											<td class="center">${list.ZLF}</td>
											<td class="center">${list.QTF}</td>
											<td class="center">
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${list.GTHSJ}"/>
											</td>
											<td class="center">
												<c:if test="${list.YLYL1 == '0' }"><font color="red">未就诊</font></c:if>
												<c:if test="${list.YLYL1 == '1' }"><font color="green">已就诊</font></c:if>
											</td>
											<td class="center">
												<c:if test="${list.GTHBZ == '1' }"><font color="green">挂号</font></c:if>
												<c:if test="${list.GTHBZ == '2' }"><font color="red">退号</font></c:if>
											</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
													
													<c:if test="${list.GTHBZ == '1' and list.YLYL1 == '0'}">
														<a class="btn btn-xs btn-success" title="开处方" onclick="toKcf('${list.GHBM }');">
															开处方
														</a>
													</c:if>
													<c:if test="${list.YLYL1 == '1'}">
														<a class="btn btn-xs btn-success" title="门诊病历" onclick="toMzbl('${list.GHBM }','${list.personID }');">
															门诊病历
														</a>
													</c:if>
													<a class="btn btn-xs btn-success" title="编辑" onclick="editObj('${list.GHBM }');">
														编辑
													</a>
													<c:if test="${list.GTHBZ == '1' and list.YLYL1 == '0'}">
														<a class="btn btn-xs btn-success" title="退号" onclick="delObj('${list.GHBM }');">
															退号
														</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															
															<c:if test="${list.GTHBZ == '1' and list.YLYL1 == '0'}">
															<li>
																<a style="cursor:pointer;" onclick="toKcf('${list.GHBM }');" class="tooltip-error" data-rel="tooltip" title="开处方">
																	开处方
																</a>
															</li>
															</c:if>
															<c:if test="${list.YLYL1 == '1'}">
															<li>
																<a style="cursor:pointer;" title="门诊病历" onclick="toMzbl('${list.GHBM }','${list.personID }');">
																	门诊病历
																</a>
															</li>
															</c:if>
															<li>
																<a style="cursor:pointer;" onclick="editObj('${list.GHBM }');" class="tooltip-success" data-rel="tooltip" title="编辑">
																	编辑
																</a>
															</li>
															<c:if test="${list.GTHBZ == '1' and list.YLYL1 == '0'}">
															<li>
																<a style="cursor:pointer;" onclick="delObj('${list.GHBM }');" class="tooltip-error" data-rel="tooltip" title="退号">
																	退号
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
										<a class="btn btn-mini btn-success" onclick="add();">挂号</a>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
 		
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
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
		});
		
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
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="挂号信息";
			 diag.URL = '<%=basePath%>autoRegister/toAddPage.do';
			 diag.Width = 700;
			 diag.Height = 1000;
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
		
		//退号
		function delObj(id){
			bootbox.confirm("确定要退号吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>autoRegister/updateObject.do?GHBM="+id;
					$.get(url,
						function(data){
							nextPage(${page.currentPage});
						});
				}
			});
		}
		//编辑
		function editObj(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑挂号信息";
			 diag.URL = '<%=basePath%>autoRegister/toEditPage.do?GHBM='+id;
			 diag.Width = 700;
			 diag.Height = 1000;
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
		
		//开处方
		function toKcf(GHBM){
			top.siMenu('z136','lm102','开处方','kcf/kcf_list.do?id='+GHBM);
		}

		//门诊病历
		function toMzbl(GHBM,PERSONID){
			top.siMenu('z140','lm102','门诊病历','mzbl/goMzblInfo.do?id='+GHBM+'&personid='+PERSONID);
		}

		</script>
</html>

