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
<!-- 随访记录列表页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/index/top.jsp"%>
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
						<form action="sljlmentalillness/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="keywords" type="text" name="keywords" value="${pd.keywords }" placeholder="根据居民、居民身份证搜索" title="根据居民、居民身份证搜索"/>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="GMT_START" id="GMT_START"  value="${pd.GMT_START}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="访视时间" title="访视时间"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="GMT_END" id="GMT_END"  value="${pd.GMT_END}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="访视时间" title="访视时间"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="XYCFSSJ_START" id="XYCFSSJ_START"  value="${pd.XYCFSSJ_START}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="下次访视时间" title="下次访视时间"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="XYCFSSJ_END" id="XYCFSSJ_END"  value="${pd.XYCFSSJ_END}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="下次访视时间" title="下次访视时间"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="sfcl" id="sfcl" data-placeholder="是否处理" style="vertical-align:top;width: 99px;">
										<option value="">是否处理</option>
										<c:forEach items="${pd.EnumSfjlSFCL}" var="item">
	                                        <option value="${item.key}" <c:if test="${pd.sfcl == item.key}"> selected="selected" </c:if> >${item.value}</option>
	                                    </c:forEach>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="sffs" id="sffs" data-placeholder="随访方式" style="vertical-align:top;width: 99px;">
										<option value="">随访方式</option>
										<c:forEach items="${pd.EnumSfjlSFFS}" var="item">
	                                        <option value="${item.key}" <c:if test="${pd.sffs == item.key}"> selected="selected" </c:if> >${item.value}</option>
	                                    </c:forEach>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
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
									<th class="center" style="width:50px;">序号</th>
									<th class="center">访视医生</th>
									<th class="center">居民</th>
									<th class="center">身份证号</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-150 hidden-480"></i>访视时间</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-150 hidden-480"></i>下次访视时间</th>
									<th class="center">随访方式</th>
									<th class="center">症状其他</th>
									<th class="center">康复措施</th>
									<th class="center">是否访视</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList }" var="varList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${varList.GUID }" id="ids" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${varList.HDSB040301_007}</td>
											<td class="center">${varList.USER_NAME}</td>
											<td class="center">${varList.ID_NUMBER}</td>
											<td class="center"><fmt:formatDate pattern="yyyy-MM-dd"  value="${varList.HDSB040301_003}"/></td>
											<td class="center"><fmt:formatDate pattern="yyyy-MM-dd"  value="${varList.HDSB040301_005}"/></td>
                                            <td class='center'>
                                                <c:forEach items="${pd.EnumSfjlSFFS}" var="s">
                                                    <c:if test="${s.key == varList.HDSB040301_004}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                    	  <td class="center" id="HDSB04030101_004">${varList.HDSB04030101_004}</td>
                                    	  <td class="center" id="HDSB04030101_030">${varList.HDSB04030101_030}</td>
                                               <td class='center'>
                                                <c:forEach items="${pd.EnumSfjlSFCL}" var="s">
                                                    <c:if test="${s.key == varList.SFCL}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
										
											<td class="center"> 
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editUser('${varList.GUID}');">
														编辑
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${varList.GUID }','${varList.HDSB040301_007}');">
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
															<li>
																<a style="cursor:pointer;" onclick="editUser('${varList.GUID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${varList.GUID }','${varList.HDSB040301_007}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
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
								<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();">
												<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增
										</a>
										<!-- <a class="btn btn-mini btn-success" onclick="add();">新增</a> -->
									</c:if>
									<c:if test="${QX.del == 1 }">
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
									</c:if>
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
	<%@ include file="../../../system/index/foot.jsp"%>
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
			var ISEHR='${ehr.ISEHR}';
			if(ISEHR==1){
			var EHRURL = '${ehr.EHRURL}'; 
			window.open(EHRURL);
			parent.window.closePanelTabs();return ;
			}
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
		
		//清空查询条件
		function reset(){
			$("#keywords").val("");
			$("#GMT_START").val("");
			$("#GMT_END").val("");
			$("#XYCFSSJ").val("");
			$("#sfcl").find("option:selected").attr("selected",false);
			$("#sfcl").find("option[text='']").attr("selected",true);
			$("#sflx").find("option:selected").attr("selected",false);
			$("#sflx").find("option[text='']").attr("selected",true);
			$("#sffs").find("option:selected").attr("selected",false);
			$("#sffs").find("option[text='']").attr("selected",true);
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增随访记录信息";
			 diag.URL = '<%=basePath%>sljlmentalillness/goAdd.do';
			 diag.Width = 700;
			 diag.Height = 650;
	　
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
		
		//修改
		function editUser(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改随访记录信息";
			 diag.URL = '<%=basePath%>sljlmentalillness/goEdit.do?ID='+id;
			 diag.Width = 700;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(id,msg){
			bootbox.confirm("确定要删除["+msg+"]的随访记录吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>sljlmentalillness/del.do?ID="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
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
								url: '<%=basePath%>sljlmentalillness/deleteAll.do?tm='+new Date().getTime(),
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
</html>

