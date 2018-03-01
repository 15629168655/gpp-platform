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
 <!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="static/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="static/html_UI/assets/css/bootstrap-multiselect.css" />
<link rel="stylesheet" href="static/html_UI/assets/css/select2.css" />

<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<script src="plugins/echarts/echarts.min.js"></script>
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
							<table style="margin-top:5px;">
								<tr>
									<td>
										<div class="form-group">
											<div class="col-xs-12 col-sm-9">
												<!-- #section:plugins/input.multiselect -->
												<select id="food" class="multiselect" multiple="">
													
											<!--  <option value="tomatoes">Tomatoes</option>-->		
												</select>
	
												<!-- /section:plugins/input.multiselect -->
											</div>
										</div>
									 </td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="SCREENING_DATE_START" id="SCREENING_DATE_START"  value="${pd.SCREENING_DATE_START}" type="text" readonly="readonly" style="width:150px;" placeholder="起始时间" title="起始时间"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="SCREENING_DATE_END" id="SCREENING_DATE_END"  value="${pd.SCREENING_DATE_END}" type="text" readonly="readonly" style="width:150px;" placeholder="截至时间" title="截至时间"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="TYPE" id="TYPE" style="vertical-align:top;width: 140px;">
									<option value="0" <c:if test="${pd.TYPE == '0' }">selected</c:if> >图形</option>
									<option value="1" <c:if test="${pd.TYPE == '1' }">selected</c:if> >列表</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								<td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="toExcel();"  title="导出到EXCEL">导出到EXCEL</a></td>
							</tr>
						</table>
					</div>
					<table id="simple-table" class="table table-bordered " style="margin-top:5px;width:100%" >	
							<thead>
								<tr>
									<th class="center" >科室医生名称</th>
									<th class="center">科室工作量(人数)</th>
									<th class="center">所占比例</th>
									<th class="center">查看</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
 <!-- 百度echarts -->
<script src="static/ace/js/ace/ace.widget-box.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		var orderChart;
		function initChart(){
			var option = {
					title : {
				        text: '医生工作量统计',
				        subtext: '医生工作量统计'
				    },
				    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
				    },
				    legend: {
			       	 	data:['科室医生工作量','所占比例%']
			    	},
				    xAxis : [
				        {
				            data : []
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'科室医生工作量',
				            type:'bar',
				            label:{normal:{show:true,position: [20, -25]}},
				            data:[]
				        },
				        {
				            name:'所占比例%',
				            type:'bar',
				            label:{normal:{show:true,position: [20, -25]}},
				            data:[]
				        }
				    ]
				};
				orderChart = echarts.init(document.getElementById('orderStat'));
				orderChart.setOption(option);
		}

		function initData() {
			var url='<%=basePath%>quesResultStatistic/getLoadData.do';
			$.post(url,{},function(data){
				orderChart.setOption({xAxis:[{ data:data.xAxis}],
					 series:[{data:data.sz},
                             {data:data.xz}
                             ]});
				$("#food").empty();
				var html = '';
				for(var i=0;i<data.xAxis.length;i++){
					html += '<option value="'+data.xAxis[i]+'">'+data.xAxis[i]+'</option>';
				}
				$("#food").append(html);
				//多选下拉框
					$('.multiselect').multiselect({
					 enableFiltering: true,
					 buttonClass: 'btn btn-white btn-primary',
					 nonSelectedText: '--请选择科室医生--',
			         allSelectedText: '已全选',
			         filterPlaceholder: '查询',
					 templates: {
						button: '<button type="button" class="multiselect dropdown-toggle" data-toggle="dropdown"></button>',
						ul: '<ul class="multiselect-container dropdown-menu"></ul>',
						filter: '<li class="multiselect-item filter"><div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
						filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default btn-white btn-grey multiselect-clear-filter" type="button"><i class="fa fa-times-circle red2"></i></button></span>',
						li: '<li><a href="javascript:void(0);"><label></label></a></li>',
						divider: '<li class="multiselect-item divider"></li>',
						liGroup: '<li class="multiselect-item group"><label class="multiselect-group"></label></li>'
					 }
					});
			});
			
		}
		
		
		
		function hidden(){
			var myTable= document.getElementById("simple-table"); 
				myTable.style.display ="none";
			}
			
		function show(){
 			var myTable= document.getElementById("simple-table"); 
 				myTable.style.display="block";
			}
		
	function searchs() {
		//获取类型  0图表  1列表
		var type = $("#TYPE").val();
		if(type=='0'){
			var n = $("#food").val();
			var QUESTIONNAIRE_PEOPLE="";
			if(n != null){
				for(var i=0;i<n.length;i++){
					QUESTIONNAIRE_PEOPLE +=n[i]+",";
				}
			}
			var url='<%=basePath%>quesResultStatistic/getLoadData.do';
			var param={
				"SCREENING_DATE_START":$("#SCREENING_DATE_START").val(),
				"SCREENING_DATE_END":$("#SCREENING_DATE_END").val(),
				"QUESTIONNAIRE_PEOPLE":QUESTIONNAIRE_PEOPLE
			};
			$.post(url,param,function(data){
				if(data.msg =='00'){
					alert("暂无数据！");
				}else{
					orderChart.clear();
					initChart();
					orderChart.setOption({xAxis:[{ data:data.xAxis}],
                        series:[{data:data.sz},
                                {data:data.xz}
                                ]});
                    hidden();
				}
			});
		}else{
			var n = $("#food").val();
			var QUESTIONNAIRE_PEOPLE="";
			if(n != null){
				for(var i=0;i<n.length;i++){
					QUESTIONNAIRE_PEOPLE +=n[i]+",";
				}
			}
			var url='<%=basePath%>quesResultStatistic/getLoadData.do';
			var param={
				"SCREENING_DATE_START":$("#SCREENING_DATE_START").val(),
				"SCREENING_DATE_END":$("#SCREENING_DATE_END").val(),
				"QUESTIONNAIRE_PEOPLE":QUESTIONNAIRE_PEOPLE
			};
			$.post(url,param,function(data){
				if(data.msg =='00'){
					alert("暂无数据！");
				}else{
					orderChart.clear();
					$("#simple-table tbody").html("");
					var length = data.xAxis.length;
					for(var i=0;i<length;i++){
					//$.each(data,function(data){
					//	var i =0; 
						item = "<tr><td width='320px' align='center'>"+data.xAxis[i]+"</td><td width='320px' align='center'>"+data.sz[i]+"</td><td width='320px' align='center'>"+data.xz[i]+"%</td><td width='320px' align='center' ><a class='btn btn-xs btn-success' title='查看' onclick=\"showinfo('" + data.xAxis[i] + "')\">"+ '查看' +"</a></td></tr>"; 
						//i++;
						$('.table').append(item); 
					}
					item = "<tr><td colspan='4' align='center'> 所有医生科室工作量:" + data.WORK_LOAD_AMOUNT + "</td>";
					//); 
					$('.table').append(item);
					show();
				}
			});
			}
		}
		
		//医生工作量人员明细
		function showinfo(name) {
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="医生工作量人员明细";
			 diag.URL = '<%=basePath%>quesResultStatistic/showinfo.do?QUESTIONNAIRE_PEOPLE='+name;
			 diag.Width = 900;
			 diag.Height = 1000;
			
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		//导出excel
		function toExcel(){
			var n = $("#food").val();
			var QUESTIONNAIRE_PEOPLE="";
			if(n != null){
				for(var i=0;i<n.length;i++){
					QUESTIONNAIRE_PEOPLE +=n[i]+",";
				}
			}
			var APPLYSTATUS = $("#SCREENING_TYPE").val();
			var applyDateStart = $("#SCREENING_DATE_START").val();
			var applyDateEnd = $("#SCREENING_DATE_END").val();
			orgName=encodeURI(orgName); //中文参数转码
			window.location.href='<%=basePath%>quesResultStatistic/excel.do?APPLYSTATUS='+APPLYSTATUS+'&applyDateStart='+applyDateStart+'&applyDateEnd='+applyDateEnd+'&orgName='+orgName;
		}
		
		//清空查询条件
		function refresh(){
			$("#SCREENING_DATE_START").val("");
			$("#SCREENING_DATE_END").val("");
			$("#SCREENING_TYPE").find("option:selected").attr("selected",false);
			$("#SCREENING_TYPE").find("option[text='']").attr("selected",true);
		}
	 
		$(document).ready(
			function(){
					hidden();
					initChart();
					initData();
					//日期框
				$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD'
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
					
			}
		)
</script>
</body>
</html>