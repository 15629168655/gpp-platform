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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
							 <div class="widget-box">
								<div class="widget-header">
			
								 
								</div>
								<div class="widget-body">
									<div  class="widget-main">
									    <div class="echarts" id="orderStat" style="height: 500px;"></div>
									</div>
								</div>
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
 
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
 <!-- 百度echarts -->
<script src="plugins/echarts/echarts-all.js"></script>
<script src="static/ace/js/ace/ace.widget-box.js"></script>
<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		var orderChart = null;
		var timer = null;
		function initChart() {
			orderChart = echarts.init(document.getElementById('orderStat'));
			
			orderOption = {
				title : {
			        text: '机构转诊统计',
			        subtext: '机构转诊统计'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['转诊数']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['机构1','机构2','机构3','机构4']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'转诊数',
			            type:'bar',
			            data:[5,77,32,12],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最多转诊数'},
			                    {type : 'min', name: '最少转诊数'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均转诊数'}
			                ]
			            }
			        }
			    ]
			};
			 
			orderChart.setOption(orderOption);
		}

		function loadData() {
			jQuery.ajax({
				type: 'POST',
				url: '$appServer.get("/store/index_data_stat.json")',
				data: {},
				cache: false,
				dataType: 'json',
				success: function(responsedata) {
					var data = responsedata.data;
					
					if(data.allBranchData) {
						var countArray = new Array();
						var amountArray = new Array();
						var legendArray = new Array();
						for(var i = 0; i < data.allBranchData.length; i++) {
							var dataObj = {};
							dataObj = data.allBranchData[i];
							legendArray[i] = dataObj.category;
							
							var countObj = {value:dataObj.count, name:dataObj.category};
							var amountObj = {value:dataObj.amount, name:dataObj.category};
							
							countArray[i] = countObj;
							amountArray[i] = amountObj;
							
							orderOption.xAxis[0]['data'] = legendArray;
							orderOption.series[0]['data'] = countArray;
							if(countArray.length > 5) {
								orderOption.xAxis[0]['axisLabel'] = {
					            	rotate: 60,
						            textStyle: {
						            	fontWeight: 'bolder'
						            }
				            	};
								orderOption.grid = {
							    	x: 40,
							    	x2: 40,
							    	y2: 120,
						    	};
							}else{
								delete orderOption.xAxis[0]['axisLabel'];
								delete orderOption.grid;
							}
							orderChart.clear()
							orderChart.setOption(orderOption);
						}
					}
				},
				error: function() {
				}
			});
			
			timer = setInterval("loadData();", 600000);
		}

	 
		$(document).ready(
			function(){
					initChart();
					//loadData();
				  //timer = setInterval("getBacklog();", 10000);
			}
		)
</script>
</body>
</html>