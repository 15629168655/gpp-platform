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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

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
							<div class="row">
									<div class="col-xs-12">
										<h3 class="header smaller lighter green">快捷方式</h3>

										<!-- #section:elements.button.app -->
										<p></p>
										 
										
										<a href="#" class="btn btn-app btn-primary no-radius">
											<i class="ace-icon fa fa-pencil-square-o bigger-230"></i>
											转诊申请
											<span class="badge badge-warning badge-left">11</span>
										</a>
										
										<a href="#" class="btn btn-app btn-success no-radius">
											<i class="ace-icon fa fa-refresh bigger-230"></i>
											转诊接收
											<span class="badge badge-warning badge-left">3</span>
										</a>
										
										<a href="#" class="btn btn-app btn-warning no-radius">
											<i class="ace-icon fa fa-undo bigger-230"></i>
											转诊统计
										</a>
										
										<a href="#" class="btn btn-app btn-info no-radius">
											<i class="ace-icon fa fa-envelope bigger-230"></i>
											跨院预约
										</a>
										<a href="#" class="btn btn-app btn-danger no-radius">
											<i class="ace-icon fa fa-trash-o bigger-230"></i>
											回收站
										</a>
										
										<a href="#" class="btn btn-app btn-purple no-radius">
											<i class="ace-icon fa fa-cloud-upload bigger-230"></i>
											健康云
										</a>
									 
										<a href="#" class="btn btn-app btn-pink no-radius">
											<i class="ace-icon fa fa-share bigger-230"></i>
											知识库
										</a>
										 
										<a href="#" class="btn btn-app btn-inverse no-radius">
											<i class="ace-icon fa fa-lock bigger-230"></i>
											数据加密
										</a>
 										<a href="#" class="btn btn-app btn-grey no-radius">
											<i class="ace-icon fa fa-floppy-o bigger-230"></i>
											健康档案
										</a>
 										<a href="#" class="btn btn-app btn-light no-radius">
											<i class="ace-icon fa fa-print bigger-230"></i>
											服务监控
										</a>
										<a href="#" class="btn btn-app btn-yellow no-radius">
											<i class="ace-icon fa fa-shopping-cart bigger-230"></i>
											服务接口
										</a>
										<a href="#" class="btn btn-default btn-app no-radius">
											<i class="ace-icon fa fa-cog bigger-230"></i>
											系统配置
										</a>
										
										<!-- /section:elements.button.app -->
									</div>
								</div>								 
									<div class="space"></div>			
			        <div class="row">
			            <!--折线图  -->
			             <div class="col-xs-12 col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">折线图 </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div  class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-line-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
						
			            <!-- 柱状图 -->
			              
			            <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">柱状图  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-bar-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
			        
			        <div class="row">
			            <!--和弦图   -->
			             <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">和弦图 </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-chord-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
						
			            <!-- 仪表盘-->
			              
			            <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">仪表盘  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-gauge-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
			        
			        <div class="row">
			            <!--散点图  -->
			             <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">散点图 </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main ace-scroll">
									    <div class="echarts"  style="height:240px" id="echarts-scatter-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
						
			            <!-- K线图 -->
			              
			            <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">K线图  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main ace-scroll">
									    <div class="echarts"  style="height:240px" id="echarts-k-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
			        
			        <div class="row">
			            <!--饼状图   -->
			             <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">饼状图 </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-pie-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
						
			            <!-- 雷达图-->
			              
			            <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">雷达图  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-radar-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
			        
			        <div class="row">
			            <!--漏斗图   -->
			             <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">漏斗图 </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-funnel-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
						
			            <!-- 力导向布局图-->
			              
			            <div class="col-xs-12 col-sm-6 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">力导向布局图  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:240px" id="echarts-force-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
			
			        <div class="row">
			            <div class="col-xs-12 col-sm-12 widget-container-col">
							<!-- #section:custom/widget-box -->
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">中国地图  </h5>
			
									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<div class="widget-menu">
											<a href="#" data-action="settings" data-toggle="dropdown">
												<i class="ace-icon fa fa-bars"></i>
											</a>
			
											<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
												<li>
													<a data-toggle="tab" href="#dropdown1">Option#1</a>
												</li>
			
												<li>
													<a data-toggle="tab" href="#dropdown2">Option#2</a>
												</li>
											</ul>
										</div>
			
										<a href="#" data-action="fullscreen" class="orange2">
											<i class="ace-icon fa fa-expand"></i>
										</a>
			
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
			
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
			
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
									<!-- /section:custom/widget-box.toolbar -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
									    <div class="echarts"  style="height:600px" id="echarts-map-chart"></div>
									</div>
								</div>
							</div>
							<!-- /section:custom/widget-box -->
						</div>
			        </div>
						</div>
						</div>	 
				 
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<%@ include file="../index/copyright.jsp"%>
		
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<!-- page specific plugin scripts -->
<script src="static/ace/js/jquery-ui.custom.js"></script>
<script src="static/ace/js/jquery.ui.touch-punch.js"></script>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts-all.js"></script>
<script src="plugins/echarts/echarts-demo.min.js"></script>
<script src="static/ace/js/ace/elements.scroller.js"></script>
		<script src="static/ace/js/ace/ace.widget-box.js"></script>
		<script src="static/ace/js/ace/ace.widget-on-reload.js"></script>
		<script type="text/javascript">
			jQuery(function($) {
			
		
		$('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					handle: ace.vars['touch'] ? '.widget-header' : false,
					cancel: '.fullscreen',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui) {
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
					}
			    });
			});
			</script>
<script type="text/javascript">
	
</script>			
</body>
</html>