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
<!-- 新增诊断信息时弹出的诊断选取页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- bootbox窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
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
						<input type="hidden" id="JBBM"/>
						<input type="hidden" id="JBMC"/>
						<!-- 检索  -->
						<form action="mzzdwh/goAddJbzd.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="输入疾病编码或名称或助记码" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }"  style="width:260px;"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">疾病编码</th>
									<th class="center">疾病名称</th>
									<th class="center">疾病类别</th>
									<th class="center">拼音助记码</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr GH="${var.JBBM}" MC="${var.JBMC}">
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.JBBM}</td>
											<td class='center'>${var.JBMC}</td>
											<td class='center'>${var.JBLB}</td>
											<td class='center'>${var.PYZJM}</td>
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

							<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>

						</form>
							<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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

		<%--<!-- 返回顶部 -->--%>
		<%--<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">--%>
			<%--<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>--%>
		<%--</a>--%>

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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
//			top.jzts();
			$("#Form").submit();
		}
		$(function() {

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
		
		//保存
		function save(msg) {
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
						if(document.getElementsByName('ids')[i].checked){
							if(str=='') str += document.getElementsByName('ids')[i].value;
							else str += ',' + document.getElementsByName('ids')[i].value;
						}
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>请选择一条内容!</span>",
							buttons:
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
//						$("#zcheckbox").tips({
//							side:1,
//							msg:'点这里全选',
//							bg:'#AE81FF',
//							time:8
//						});
						return;
					}else{
						if(msg == '确定要新增选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>mzzdwh/luRuJbzd.do',
								data: {BM:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									<%--$.each(data.list, function(i, list){--%>
										<%--nextPage(${page.currentPage});--%>
									<%--});--%>
									if(data.msg != 'ok'){
										alert("您选中的信息已存在，请核实！");
									}
									var iframe = $("#_DialogFrame_0",parent.document);
									iframe.contents().find("#icdcode").val(data.ICDCODE);
									iframe.contents().find("#mc").val(data.MC);
									top.Dialog.close();
								}
							});
						}
					}
				}
			});
		}
		
		$(function () {
	        var active_class = 'success';
	        
	      	// 选择行变色 
	        $("#simple-table > tbody > tr").click(function (){ 
	            var trThis = this; 
	            $("#simple-table > tbody > tr").removeClass(active_class); 
	            $(trThis).addClass(active_class);
	            $("#JBBM").val($(trThis).attr("GH"));
	            $("#JBMC").val($(trThis).attr("MC"));
	        });
	    }) 

	</script>


</body>
</html>