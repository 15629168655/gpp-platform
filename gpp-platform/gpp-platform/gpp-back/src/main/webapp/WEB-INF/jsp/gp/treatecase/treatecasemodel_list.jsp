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
<!-- 血脂四项检测检测页面-->
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
	<div class="main-container" id="main-container">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<!-- 检索 -->
						<form action="treateCaseModel/list.do" method="post" name="caseForm" id="caseForm">
							<table style="margin-top:5px;">
								<tr>
									<td >
										<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" name="ORG_NAME" id="ORG_NAME" value="${pd.ORG_NAME }" type="text" placeholder="医院名称" title="医院名称"/>
										</div>
									</td>
									<td style="padding-left:2px;">
										<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" name="PROVIDER_NAME" id="PROVIDER_NAME" value="${pd.PROVIDER_NAME }" type="text" placeholder="医生姓名" title="医生姓名"/>
										</div>
									</td>
									<td style="vertical-align:top;padding-left:2px;"> <!-- 人群类型 -->
									 	<select class="pos-rel" name="SUIT_PEOPLE" id="SUIT_PEOPLE" data-placeholder="人群类型 " style="vertical-align:top;width: 120px;">
											<option style="width: 120px;" value="">人群类型 </option>
											<option value="0" <c:if test="${pd.SUIT_PEOPLE == '0' }">selected</c:if> >糖尿病</option>
											<option value="1" <c:if test="${pd.SUIT_PEOPLE == '1' }">selected</c:if> >高血压</option>
											<option value="2" <c:if test="${pd.SUIT_PEOPLE == '2' }">selected</c:if> >心脏病</option>
											<option value="3" <c:if test="${pd.SUIT_PEOPLE == '3' }">selected</c:if> >脑卒中</option>
											<option value="4" <c:if test="${pd.SUIT_PEOPLE == '4' }">selected</c:if> >肺结核</option>
											<option value="5" <c:if test="${pd.SUIT_PEOPLE == '5' }">selected</c:if> >其他</option>
										</select>
									</td>	
									<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
									<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置">
                                	<i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</tr>
							</table>
						</form>
						<!-- 检索 -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" onclick="selectAll()" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									<th class="center">序号</th>
									<th class="center">模板名称</th>
									<th class="center">创建人</th>
									<th class="center">使用次数</th>
									<th class="center">适用人群</th>
									<th class="center">间隔时间</th>
									<th class="center">修改时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty modelList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${modelList}" var="element" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='checkbox' name='ids' value="${element.TREATE_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${element.MODEL_NAME }</td>
											<td class="center">${element.PROVIDER_NAME }</td>
											<td class="center">${element.USED_COUNT }</td>
											<td class="center">
												<c:forEach items="${DISEASENAME}" var="s">
                                                    <c:if test="${s.key == element.SUIT_PEOPLE }">${s.value}</c:if>
                                                </c:forEach>
											</td>
											<td class="center">
												<c:forEach items="${INTERVALCOMPANY}" var="s">
                                                    <c:if test="${s.key == element.INTERVAL_COMPANY}">${element.INTERVAL_TIME}${s.value}</c:if>
                                                </c:forEach>
											</td>
											<td class="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${element.EDIT_TIME }"/></td>
											
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${element.TREATE_MODEL_ID}');">
														编辑
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" title="删除" onclick="del('${element.TREATE_MODEL_ID}');">
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
																<a style="cursor:pointer;" onclick="edit('${element.TREATE_MODEL_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${element.TREATE_MODEL_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
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
                                        <a class="btn btn-sm btn-success" onclick="add();">新增</a>
                                        </c:if>
                                        <c:if test="${QX.del == 1 }">
                                        <a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
                                        </c:if>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
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
			
			
			top.jzts();
			$("#caseForm").submit();
		}
	
		//清空查询条件
		function refresh(){
			$("#ORG_NAME").val("");
			$("#PROVIDER_NAME").val("");
			$("#SUIT_PEOPLE").val("");
		}

		//新增
		  function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新指治疗方案模板";
			 diag.URL = '<%=basePath%>treateCaseModel/addPage.do';
			 diag.Width = 800;
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
		//新增
		  function edit(TREATE_MODEL_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑治疗方案模板";
			 diag.URL = '<%=basePath%>treateCaseModel/editPage.do?TREATE_MODEL_ID='+TREATE_MODEL_ID;
			 diag.Width = 800;
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
		/* function editHospitalization(id){
            //top.jzts();
            top.siMenu('z71','lm70','修改住院证','hospitalization/goEdit.do?ID='+id);
		} */

		//删除
		function del(id,msg){
			bootbox.confirm("确定要删除此方案的模板", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>treateCaseModel/delete.do?ID="+id+"&tm="+new Date().getTime();
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
								url: '<%=basePath%>treateCaseModel/deleteAll.do?tm='+new Date().getTime(),
						    	data: {IDS:str},
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