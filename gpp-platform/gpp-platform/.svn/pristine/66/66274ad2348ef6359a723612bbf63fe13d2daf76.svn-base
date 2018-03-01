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
<!-- 筛选问卷调查-->
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
						<form action="indexResidentQuesResult/list.do" method="post" name="fatForm" id="fatForm">
							<table style="margin-top:5px;">
								<tr>
									<td style="padding-left:2px;"><input name="keywords" id="keywords" value="${pd.keywords }" type="text" placeholder="请输入关键字" title="关键 字"/></td>
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
									<th class="center">姓名</th>
									<th class="center">性别</th>
									<th class="center">年龄</th>
									<th class="center">检查时间</th>	
									<th class="center">检查结果</th>	
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="element" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='checkbox' name='ids' value="${element.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${element.USER_NAME }</td>
											<td class="center">
								                <c:if test="${element.SEX == 1}">男</c:if>
								                <c:if test="${element.SEX == 2}">女</c:if>
											</td>
											<td class="center">${element.AGE }</td>
											<td class="center">
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${element.EDIT_TIME }"/>
											</td>
											<td class="center">${element.QUESTIONNAIRE_RESULT }</td>
											<td class="center">
												<c:if test="${element.IS_FINISH != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
												<c:if test="${element.IS_FINISH != 0 }">
													<a class="btn btn-xs btn-success" title="查看建议" onclick="suggestion('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}','${element.USER_AGENT_ID}');">
														查看建议
													</a>
													<a class="btn btn-xs btn-danger" title="生成报告" onclick="create_report('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}','${element.USER_AGENT_ID}');">
														结果报告
													</a>
													<a class="btn btn-xs btn-danger" title="评分报告" onclick="scoreResult('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}');">
														评分报告
													</a>
												</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${element.IS_FINISH != 1 }">
																<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
															</c:if>
															<c:if test="${element.IS_FINISH != 0 }">
																<a class="btn btn-xs btn-success" title="查看建议" onclick="suggestion('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}','${element.USER_AGENT_ID}');">
																	查看建议
																</a>
																<a class="btn btn-xs btn-danger" title="生成报告" onclick="create_report('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}','${element.USER_AGENT_ID}');">
																	生成报告
																</a>
																<a class="btn btn-xs btn-danger" title="评分报告" onclick="scoreResult('${element.SCREENING_QUESTIONNAIRE_ID }','${element.ID}');">
																	评分报告
																</a>
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
			$("#fatForm").submit();
		}
	
		//清空查询条件
		function refresh(){
			
			$("#keywords").val("");
			
		}

		//生成报告
		function create_report(id,ques_id,resident_id) {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="居民结果报告";
			 diag.URL = '<%=basePath%>indexResidentQuse/viewQues.do?ID='+id+'&QUES_ID='+ques_id+'&USER_AGENT_ID='+resident_id;
			 diag.Width = 900;
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
		//生成建议
		function suggestion(id,ques_id,resident_id) {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="居民结果报告";
			 diag.URL = '<%=basePath%>indexResidentQuesResult/suggestion.do?ID='+id+'&QUES_ID='+ques_id+'&USER_AGENT_ID='+resident_id;
			 diag.Width = 900;
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
	  function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="居民问卷结果新增新增";
		 diag.URL = '<%=basePath%>indexResidentQuesResult/add.do';
		 diag.Width = 900;
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
		
		/* function add(){
          //top.jzts();
          top.siMenu('z71','lm70','新增住院证','hospitalization/goAdd.do');
		} */
		
		//修改
		function edit(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改居民问卷结果";
			 diag.URL = '<%=basePath%>indexResidentQuesResult/update.do?ID='+id;
			 diag.Width = 900;
			 diag.Height = 1000;
			
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none')
				 {
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		} 
		/* function add(){
            //top.jzts();
            top.siMenu('z71','lm70','新增住院证','hospitalization/goAdd.do');
		} */
		
		
		/* function editHospitalization(id){
            //top.jzts();
            top.siMenu('z71','lm70','修改住院证','hospitalization/goEdit.do?ID='+id);
		} */

		//评分报告id:筛查问卷ID，rqid:居民问卷ID
		function scoreResult(id, rqid) {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="评分报告";
			 diag.URL = '<%=basePath%>indexScore/listScoreResult.do?ID='+id+'&RQID='+rqid;
			 diag.Width = 900;
			 diag.Height = 1000;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		//删除
		function del(id,msg){
			bootbox.confirm("确定要该居民问卷吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>indexResidentQuesResult/delete.do?ID="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
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
								url: '<%=basePath%>indexResidentQuesResult/deleteAll.do?tm='+new Date().getTime(),
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