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
						<form action="lisReport/list.do?id=${pd.id }" method="post" name="lisreportForm" id="lisreportForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="BRXM" type="text" name="BRXM" value="${pd.BRXM }" placeholder="请输入病人姓名" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="pos-rel" name="BRXB" id="BRXB" data-placeholder="性别" style="vertical-align:top;width: 120px;">
									<option value="">请选择性别</option>
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.BRXB == '0' }">selected</c:if> >未知性别</option>
									<option value="1" <c:if test="${pd.BRXB == '1' }">selected</c:if> >男</option>
									<option value="2" <c:if test="${pd.BRXB == '2' }">selected</c:if> >女</option>
									<option value="9" <c:if test="${pd.BRXB == '9' }">selected</c:if> >未说明性别</option>
								  	</select>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="BRNL" type="text" name="BRNL" value="${pd.BRNL }" placeholder="请输入病人年龄" />
									</div>
								</td>
								<td>
									<div class="nav-search">
								   		<input class="nav-search-input" autocomplete="off" type="text" name="BGDH" id="BGDH" value="${pd.BGDH }" placeholder="请输入检验报告单号" />
									</div>
								</td>
								<td>
									<div class="nav-search">
								    	<input class="nav-search-input" autocomplete="off" type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH }" placeholder="请输入就诊流水号" />
									</div>
								</td>
								<td>
									<div class="nav-search">
								    	<input class="nav-search-input" autocomplete="off" type="text" name="KH" id="KH" value="${pd.KH }" placeholder="请输入卡号" />
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
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
									<th class="center">就诊流水号</th>
									<th class="center">检验报告单号</th>
									<th class="center">病人姓名</th>
									<th class="center">性别</th>
									<th class="center">年龄</th>		
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>检验日期</th>
									<th class="center">就诊标志</th>
									<th class="center">标本名称</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty List}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${List}" var="lisreport" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='checkbox' name='ids' value="${lisreport.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${lisreport.JZLSH }</td>
											<td class="center">${lisreport.BGDH }</td>
											<td class="center">${lisreport.BRXM }</td>
											<td class="center">
											<c:if test="${lisreport.BRXB == '0' }">未知性别</c:if>
											<c:if test="${lisreport.BRXB == '1' }">男</c:if>
											<c:if test="${lisreport.BRXB == '2' }">女</c:if>
											<c:if test="${lisreport.BRXB == '9' }">未说明性别</c:if>
											</td>
											<td class="center">${lisreport.BRNL }</td>
											<td class="center">${lisreport.JYRQ }</td>			
											<td class="center">
											<c:if test="${lisreport.MZZYBZ == '1' }">门诊</c:if>
											<c:if test="${lisreport.MZZYBZ == '2' }">住院</c:if>
											</td>
											<td class="center">${lisreport.BBMC }</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
												    <a class="btn btn-xs btn-success" title="查看详情" onclick="showInfo('${lisreport.ID}','${pd.USER_AGENT_ID }');">
														<i class="ace-icon fa fa-search bigger-120" title="查看详情"></i>详情
													</a>
													<a class="btn btn-mini btn-purple" onclick="getIndicators('${lisreport.BGDH}','${pd.USER_AGENT_ID }');"><i class="icon-pencil"></i>检验结果指标</a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																<a style="cursor:pointer;" onclick="showInfo('${lisreport.ID}','${pd.USER_AGENT_ID }');" class="tooltip-success" data-rel="tooltip" title="查看详情">
																	<span class="green">
																		<i class="ace-icon fa fa-search bigger-120" title="查看详情"></i>
																	</span>
																</a>
															</li>
															<li>
																<a class="btn btn-mini btn-purple" onclick="getIndicators('${lisreport.BGDH}','${pd.USER_AGENT_ID }');"><i class="icon-pencil"></i>检验结果指标</a>
															</li>
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
		//$(top.hangge());
		
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
			//top.jzts();
			$("#lisreportForm").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#BRXM").val("");
			$("#BRXB").find("option:selected").attr("selected",false);
			$("#BRXB").find("option[text='']").attr("selected",true);
			$("#BRNL").val("");
			$("#BGDH").val("");
			$("#JZLSH").val("");
			$("#KH").val("");
		}
	
		//显示详情
        function showInfo(Id,user_id){
            //top.jzts();
            var diag = new top.Dialog();
            diag.Drag=true;
            diag.Title ="查看详情";
            //user_id 居民信息的主键
            diag.URL = '<%=basePath%>lisReport/showInfo.do?ID='+Id+'&USER_AGENT_ID='+user_id;
            diag.Width = 1000;
            diag.Height = 900;
            diag.CancelEvent = function(){ //关闭事件
                if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                    <%--nextPage(${page.currentPage});--%>
                }
                diag.close();
            };
            diag.show();
        }
		
      //检验结果指标显示
		function getIndicators(BGDH,user_id){
            //top.jzts();
            top.siMenu('z71','lm70','检验结果指标','lisIndicators/getIndicators.do?BGDH='+BGDH+'&USER_AGENT_ID='+user_id);
		}
		

		
		</script>
</html>
