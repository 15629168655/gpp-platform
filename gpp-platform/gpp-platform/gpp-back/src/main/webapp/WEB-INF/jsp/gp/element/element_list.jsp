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
						<form action="element/list.do" method="post" name="elementForm" id="elementForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="ZDM" type="text" name="ZDM" value="${pd.ZDM }" placeholder="请输入名称" />
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="XSMC" type="text" name="XSMC" value="${pd.XSMC }" placeholder="请输入显示名称" />
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="elementTimeStart" id="elementTimeStart"  value="${pd.elementTimeStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="生成时间起" title="生成时间开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="elementTimeEnd" id="elementTimeEnd"  value="${pd.elementTimeEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="生成时间止" title="生成时间结束"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								  	<select class="form-control" name="LX" id="LX" style="width:98%;">
										<option value="" selected >全部</option>
										   <c:forEach items="${pd.enumElementType}" var="type">
		                                       <option value="${type.key}" <c:if test="${pd.LX == type.key}"> selected="selected" </c:if> >${type.value}</option>
		                                   </c:forEach>
									 </select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select  name="ZT" id="ZT" data-placeholder="状态" style="width:98%;">
									<option value="">全部</option>
									<option value="1" <c:if test="${pd.ZT == '1' }">selected</c:if> >启用</option>
									<option value="0" <c:if test="${pd.ZT == '0' }">selected</c:if> >停用</option>
									</select>
								</td>
								
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置">
                                <i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" onclick="selectAll()" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">名称</th>
									<th class="center">显示名称</th>
									<th class="center">类型</th>	
									<th class="center">默认值</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>生成时间</th>
									<th class="center">操作人</th>
									<th class="center">是否显示</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty elementList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${elementList}" var="element" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='checkbox' name='ids' value="${element.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${element.ZDM }</td>
											<td class="center">${element.XSMC }</td>
											<td class="center">
											<c:forEach items="${pd.enumElementType}" var="type">
								                <c:if test="${type.key  == element.LX }">${type.value} </c:if>
								            </c:forEach> 
											</td>
											<td class="center">${element.MRZ }</td>
											<td class="center">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${element.SCSJ}"/>
											</td>
											<td class="center">${element.CZR }</td>
											<td class="center">
											<c:if test="${element.SFXS == '0' }">显示</c:if>
											<c:if test="${element.SFXS == '1' }">隐藏</c:if>
											</td>
											<td style="width: 60px;" class="center">
												<c:if test="${element.ZT == '0' }"><span class="label label-important arrowed-in">停用</span></c:if>
												<c:if test="${element.ZT == '1' }"><span class="label label-success arrowed">启用</span></c:if>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editElement('${element.ID}');">
														编辑
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" title="删除" onclick="delElement('${element.ID}');">
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
																<a style="cursor:pointer;" onclick="editElement'${element.ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="delElement('${element.ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
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
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" onclick="add();"><i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-xs btn-danger" onclick="makeAll('确定要删除选中的数据吗?');');"><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>
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
			
			//检查日期
			function checkTime(){ 
				
			    var startTime=$("#elementTimeStart").val();  
				
			    var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
			    
			    var endTime=$("#elementTimeEnd").val();  
			    
			    var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
			    
			    if(end<start){  
			        return false;  
			    }  
			    return true;  
			} 
			if(!checkTime()){  
			    alert("生成时间止必须晚于生成时间起！");  
			    return;  
			}
			
			top.jzts();
			$("#elementForm").submit();
		}
	
		//清空查询条件
		function refresh(){
			
			$("#ZDM").val("");
			$("#XSMC").val("");
			$("#elementTimeStart").val("");
			$("#elementTimeEnd").val("");
			$("#LX").find("option:selected").attr("selected",false);
			$("#LX").find("option[text='']").attr("selected",true);
			$("#ZT").find("option:selected").attr("selected",false);
			$("#ZT").find("option[text='']").attr("selected",true);
		}

		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增元素";
			 diag.URL = '<%=basePath%>element/goAdd.do';
			 diag.Width = 500;
			 diag.Height = 500;
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
		function editElement(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑元素";
			 diag.URL = '<%=basePath%>element/goEdit.do?ID='+id;
			 diag.Width = 500;
			 diag.Height = 500;
			
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none')
				 {
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}

		//删除
		function delElement(id,msg){
			bootbox.confirm("确定要删除此任务吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>element/delete.do?ID="+id+"&tm="+new Date().getTime();
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
								url: '<%=basePath%>element/deleteAll.do?tm='+new Date().getTime(),
						    	data: {IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
					}
				}
			});
		}
		
		</script>
</html>
