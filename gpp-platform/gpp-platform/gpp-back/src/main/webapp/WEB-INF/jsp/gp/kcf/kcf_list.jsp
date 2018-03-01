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
<% 
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();//得到当前系统时间
	String nowtime = formatter.format(currentTime); //将日期时间格式化 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
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
						<input type="hidden" id="KCFLX" value=""/>
						<input type="hidden" id="KCFLB" value=""/>
							<div class="page-header position-relative">
							<table style="width:100%;">
								<tr>
									<td style="vertical-align:top;">
										<a class="btn btn-success" onclick="add('${pd.GHBM }');">新开处方</a>
										<a class="btn btn-danger" onclick="del('确定要删除处方吗?');">删除处方</a>
										<a class="btn btn-info" onclick="save()">另存草稿</a>
										<a class="btn btn-primary" onclick="im()">调入处方</a>
										<a class="btn btn-warning" onclick="into();">保存增加</a>
										<a class="btn btn-danger" onclick="history()">历史处方</a>
										<a class="btn btn-purple" onclick="bl()">电子病历</a>
										<a class="btn btn-grey" onclick="out()">退出</a>
									</td>
								</tr>
							</table>
							</div>
					<div>
					<div class="page-header position-relative">
						<table style="margin-top:5px;cellpadding:10px;cellspacing:1px;frame:void;rules:none; boder-collapse:separate;border:none;padding:0;">
							<tr>
								<td><input id="GHBM" type="hidden" value="${pd.GHBM }" /></td>
								<td  width="50px;" style="font-weight: bold;">姓名:</td>
								<td  width="150px;" >${pd.XM}</td>
								<td  width="70px;" style="font-weight: bold;">出生日期:</td>
								<td   width="100px;" >${pd.CSRQ}</td>
								<td width="50px;" style="font-weight: bold;">性别:</td>
								<td   width="50px;" >${pd.SEX}</td>
								<td  width="50px;" style="font-weight: bold;">电话:</td>
								<td  width="150px;" >${pd.SJHM}</td>
								<td  width="50px;" style="font-weight: bold;">地址:</td>
								<td  width="200px;" >${pd.JZDZ}</td>
								<%-- <td  width="60px;" style="font-weight: bold;">收费类别:</td>
								<td  width="100px;" >${pd.MONEY}</td> --%>
							</tr>
						</table>
						</div>
					</div>
					<div>
						<table style="margin-top:5px;cellpadding:1px;cellspacing:1px;frame:void;rules:none; align:center; margin: 0 auto; valign:middle; ">
						    <tr height="5px"></tr>
							<tr>
								<td style="width:8%;text-align: center;padding-top: 13px;">处方类型:</td>
								<td width="25%">
								<select class="chosen-select form-control" name="CFLX" id="CFLX" onchange="selectLX();" style="vertical-align:top;width: 250px;">
									<option value="">--请选择类型--</option>
									<option value="0">西药</option>
									<option value="1">中药</option>
									<option value="2">成药</option>
									<option value="3">临床项目</option>
									</select>
								</td>
								<td style="width:12%;text-align: center;padding-top: 13px;">处方类别:</td>
								<td width="21%">
								<select class="chosen-select form-control" name="CFLB" id="CFLB" onchange="selectLB();" style="vertical-align:top;width: 250px;">
									</select>
								</td>
								<td style="width:12%;text-align: center;padding-top: 13px;">处方时间:</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" id="cfsj"  value="<%=nowtime%>" type="text" readonly="readonly" style="width:230px;" placeholder="处方时间" title="处方时间"/></td>
							</tr>
							<tr height="10px"></tr>
							<tr>
								<td style="width:8%;text-align: center;padding-top: 13px;">疾病诊断:</td>
								<td style="width:25%;">
										<input type="hidden" name="JBBM" id="JBBM" value="" />
										<input type="text" name="JBMC" id="JBMC" value="" readonly="readonly" style="width: 200px" onclick="choosejb();"/>
										<a class="btn btn-sm btn-light" onclick="choosejb();"><i class="ace-icon fa fa-film"></i></a>
								</td>
								<td style="width:12%;text-align: center;padding-top: 13px;">医生嘱托:</td>
								<td style="width:21%;"><input type="text" name="yszt" id="yszt" value="${pd.yszt}" readonly="readonly" maxlength="255"  style="width:250px;"/></td>
							</tr>
						</table>
					</div>
					<br>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<!-- <th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th> -->
									<th class="center" style="width:20%;">项目</th>
									<th class="center" style="width:8%;">规格</th>
									<th class="center" style="width:8%;">单价</th>
									<th class="center" style="width:8%;">组号</th>
									<th class="center" style="width:8%;">滴速</th>
									<th class="center" style="width:10%;">频率</th>
									<th class="center" style="width:8%;">剂量</th>
									<th class="center" style="width:8%;">数量</th>
									<th class="center" style="width:10%;">用法</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
										<tr>
											<%-- <td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ID}" class="ace" /><span class="lbl"></span></label>
											</td> --%>
											<td >
												<input id="xmId" type="hidden"/>
											    <input type="text" style="width:70%" id="xiangmu" onclick="chooseXM()" readonly="readonly"/>
												<a class="btn btn-sm btn-light" onclick="chooseXM()" style="align:right;"><i class="ace-icon fa fa-film"></i></a> 
											</td>
											<td class='center'><input id="guige" type="text" style="width:80%"/></td>
											<td class='center'><input id="danjia" type="text" style="width:80%"/></td>
											<td class='center'><input id="zuhao" type="number" style="width:80%"/></td>
											<td class='center'><input id="disu" type="number" style="width:80%"/></td>
											<td class='center'>
												<select id="pinlv"  style="width:95%;" >
												   
												</select>
											</td>
											<td class='center'><input id="jiliang" type="number" style="width:70%"/></td>
											<td class='center'><input id="shuliang" type="number" style="width:80%"/></td>
											<td class='center'>
												<select id="yongfa"  style="width:95%;" >
												   
											    	
												</select>
											</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
                                                        <a class="btn btn-xs btn-success" title="添加" onclick="addXM();"  id = "addXM">
                                                           <i class="ace-icon glyphicon glyphicon-plus"></i>
                                                        </a>
												</div>
											</td>
										</tr>
							</tbody>
						</table>
					<br>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<tr>
									<i class="ace-icon fa fa-leaf"></i>普通处方
							</tr>	
							<thead>
								<tr>
									<th class="center">名称</th>
									<th class="center">规格</th>
									<th class="center">单价</th>
									<th class="center">组号</th>
									<th class="center">滴速</th>
									<th class="center">频率</th>
									<th class="center">剂量</th>
									<th class="center">数量</th>
									<th class="center">用法</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody id="ptcf_tba">
							<!-- <tr height="35px" id="ptcf_tr">
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
							 </tr> -->
							</tbody>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<tr >
								<i class="fa fa-info" aria-hidden="true"></i>费用明细
							</tr>	
							<thead>
								<tr>
									<th class="center">名称</th>
									<th class="center">规格</th>
									<th class="center">单价</th>
									<th class="center">组号</th>
									<th class="center">滴速</th>
									<th class="center">频率</th>
									<th class="center">剂量</th>
									<th class="center">数量</th>
									<th class="center">用法</th>
									<th class="center">操作</th>
								</tr>
								
							</thead>
							<tbody id="sfmx_tba">
							<!-- <tr height="35px" id="sfmx_tr">
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
								           <td></td>
							 </tr> -->
							</tbody>
						</table>
						
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
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		$(function() {
			
			//日期框
				$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD HH:mm:ss '
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
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
			
		});
		//处方类别
		function selectLX(){
			var lx = $("#CFLX").val();
			if(lx == '0'){
				$("#CFLB").empty();
				var _HTML  = '<option value="">--请选择类别--</option>';
				_HTML += '<option value="1">普通处方</option>';
				_HTML += '<option value="2">急诊处方</option>';
				_HTML += '<option value="3">儿科处方</option>';
				_HTML += '<option value="4">麻醉处方</option>';
				_HTML += '<option value="5">精神药品处方</option>';
				_HTML += '<option value="9">不明</option>';
				$("#CFLB").append(_HTML);
				$("#KCFLX").val("YP");
			}else if(lx == '1'){
				$("#CFLB").empty();
				var _HTML  = '<option value="">--请选择类别--</option>';
				_HTML += '<option value="0">中药处方</option>';
				$("#CFLB").append(_HTML);
				$("#KCFLX").val("YP");
			}else if(lx == '2'){
				$("#CFLB").empty();
				var _HTML  = '<option value="">--请选择类别--</option>';
				_HTML += '<option value="0">中成药处方</option>';
				$("#CFLB").append(_HTML);
				$("#KCFLX").val("YP");
			}else if(lx == '3'){
				var url='<%=basePath%>kcf/getLCXM.do';
				$.post(url,
						{"ID":"0"},
						function(res){
							$("#CFLB").empty();
							var _HTML  = '<option value="">--请选择类别--</option>';
							for(var i=0;i<res.pd.length;i++){
								_HTML += '<option value="'+res.pd[i].ID+'">'+res.pd[i].MC+'</option>';
							}
							$("#CFLB").append(_HTML);
							
							$("#KCFLX").val("LCXM");
						})
			}else{
				$("#CFLB").empty();
				$("#KCFLX").val("");
			}
		}
		/*******处方类别*********/
		function selectLB(){
			var choose=$("#CFLB").val();
			$("#KCFLB").val(choose);
		}
		/******疾病诊断******/
		function choosejb(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "疾病诊断";
			 diag.URL = '<%=basePath%>kcf/jbzd_list.do';
			 diag.Width = 800;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.OKEvent = function(){
		         	var id = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
		         	var name=diag.innerFrame.contentWindow.document.getElementById('JBMC').value;
		         	if(id !=''){
			         	$("#JBBM").val(id);
			         	$("#JBMC").val(name);
		         	}
		         	diag.close();
		      };
			 diag.show();
		}
		/***********选则项目**************/
		function chooseXM(){
			var flag = $("#KCFLX").val();
			if(flag == 'YP'){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag = true;
				 diag.Title = "药品明细清单";
				 diag.URL = '<%=basePath%>kcf/queryAllYP.do';
				 diag.Width = 800;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.OKEvent = function(){
			         	var YPBM = diag.innerFrame.contentWindow.document.getElementById('YPBM').value;
			         	var YPMC=diag.innerFrame.contentWindow.document.getElementById('YPMC').value;
			         	var YPGG=diag.innerFrame.contentWindow.document.getElementById('YPGG').value;
			         	var YLSJ=diag.innerFrame.contentWindow.document.getElementById('YLSJ').value;
			         	if(YPBM !=''){
				         	$("#xiangmu").val(YPMC);
				         	$("#guige").val(YPGG);
				         	$("#danjia").val(YLSJ);
				         	$("#xmId").val(YPBM);
				         	$("#shuliang").val(1);
			         	}
			         	diag.close();
			      };
				 diag.show();
				 $("#pinlv").empty();
				 var _HTML  = '<option value="">请选择频率</option>';
					_HTML += '<option value="1">1次/天</option>';
					_HTML += '<option value="2">2次/天</option>';
					_HTML += '<option value="3">3次/天</option>';
				$("#pinlv").append(_HTML);
				$("#yongfa").empty();
				var _html = '<option value="">请选择</option>';
				_html += '<option value="1">口服</option>';
				_html += '<option value="2">外用</option>';
				$("#yongfa").append(_html);
				
				 
			}else if(flag=='LCXM' ){
				var ID = $("#KCFLB").val();
				top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag = true;
				 diag.Title = "临床项目清单";
				 diag.URL = '<%=basePath%>kcf/queryLCXM.do?PId='+ID;
				 diag.Width = 800;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.OKEvent = function(){
			         	var BM = diag.innerFrame.contentWindow.document.getElementById('BM').value;
			         	var MC=diag.innerFrame.contentWindow.document.getElementById('MC').value;
			         	var DW=diag.innerFrame.contentWindow.document.getElementById('DW').value;
			         	if(BM !=''){
				         	$("#xiangmu").val(MC);
				         	$("#guige").val(DW);
				         	$("#xmId").val(BM);
				         	
			         	}
			         	diag.close();
			      };
				 diag.show();
				 $("#pinlv").empty();
				 var _HTML  = '<option value="">请选择频率</option>';
					_HTML += '<option value="5">1次</option>';
					_HTML += '<option value="6">2次</option>';
					_HTML += '<option value="7">3次</option>';
				$("#pinlv").append(_HTML);
				$("#yongfa").empty();
				var _html = '<option value="">请选择</option>';
				_html += '<option value="3">检查</option>';
				_html += '<option value="4">检验</option>';
				$("#yongfa").append(_html);
			}
			
		}
		/********添加项目************/
		function addXM(){
			var xmid=$("#xmId").val();
			if(xmid != ''){
				var yongfaArr =["口服", "外用", "检查", "检测"];
				var pinlvArr =["1次/天", "2次/天", "3次/天", "1次", "2次", "3次", "4次", "5次"];
				var	xmmc=$("#xiangmu").val();
				var xmgg=$("#guige").val();
				var danjia = $("#danjia").val();
				var zuhao = $("#zuhao").val();
				var disu = $("#disu").val();
				var pinlv = $("#pinlv").val();
				var jiliang = $("#jiliang").val();
				var shuliang = $("#shuliang").val();
				var yongfa = $("#yongfa").val();
				var html = '<tr id="'+xmid+'" class="">';
				html += ' <td align="center">'+xmmc+'</td>';
				html += ' <td align="center">'+xmgg+'</td>';
				html += ' <td align="center">'+danjia+'</td>';
				html += ' <td align="center">'+zuhao+'</td>';
				html += ' <td align="center">'+disu+'</td>';
				html += ' <td align="center">'+pinlvArr[pinlv - 1]+'</td>';
				html += ' <td align="center">'+jiliang+'</td>';
				html += ' <td align="center">'+shuliang+'</td>';
				html += ' <td align="center">'+yongfaArr[yongfa - 1]+'</td>';
				html += ' <td align="center"> <a class="btn btn-xs btn-danger" title="删除" onclick="delTR(this);">删除</a></td><td style="display:none">'+xmid+'</td></tr>';
		//		$("#ptcf_tr").remove(); 
				$("#ptcf_tba").append(html);
				var flag = $("#KCFLX").val();
				if(flag == 'LCXM'){
					//查询临床项目对照表
					var url ='<%=basePath%>kcf/queryLCXMDZ.do';
					$.post(url,{"BM":xmid},
						function(res){
						var data = res.pd;
						var html = '';
						for(var i=0;i<data.length;i++){
							html += '<tr id="'+data[i].ID+'" class="'+xmid+'">';
							html += ' <td align="center">'+data[i].SFXMMC+'</td>';
							html += ' <td align="center">'+data[i].GG+'</td>';
							html += ' <td align="center">'+data[i].JFGZ+'</td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"></td>';
							html += ' <td align="center"> <a class="btn btn-xs btn-danger" title="删除" onclick="delTR(this);">删除</a></td><td style="display:none">'+xmid+'</td></tr>';
						}
					//	$("#sfmx_tr").remove(); 
						$("#sfmx_tba").append(html);
					});
					
				}else{
				//	$("#sfmx_tr").remove(); 
					$("#sfmx_tba").append(html);
				}
				clearXM();
				
			}
		}
		// 保存处方
		function into(){
			var flag = $("#KCFLX").val();
			var jsArray = [];
			var data="";
			$("#ptcf_tba").find("tr").each(function(){
					/****处方明细****/
				 var tdArr = $(this).children();
				 var mc = tdArr.eq(0).text();//名称
				 var gg = tdArr.eq(1).text();//规格
				 var dj = tdArr.eq(2).text();//单价
				 var sl = tdArr.eq(7).text();//数量
				 var xmid = tdArr.eq(10).text();//项目ID
				 var sfmxList = $("#sfmx_tba ."+xmid);
				   /*****收费明细******/
				 var sfmxArr = [];
				 for(var i=0;i<sfmxList.length;i++){
					 var tr_id = sfmxList[i].id;
					 var tdArry = $("#"+tr_id).children();
					 var sfmc = tdArry.eq(0).text();//名称
					 var sfgg = tdArry.eq(1).text();//规格
					 var sfdj = tdArry.eq(2).text();//单价
					 var sfsl = tdArry.eq(7).text();//数量
					 var sfxmid = tr_id;
					 sfmxArr.push({'mc':sfmc, 'gg':sfgg, 'dj':sfdj, 'sl':sfsl,'xmid':sfxmid });
				 }
				 jsArray.push({'mc':mc, 'gg':gg, 'dj':dj, 'sl':sl, 'xmid':xmid ,'sfmxArr':sfmxArr});
				 
			});
			data=JSON.stringify(jsArray);
			var ghbm = $("#GHBM").val(); //挂号编码
			var cflb = $("#CFLB").val(); //处方类型
			var jbbm = $("#JBBM").val(); //疾病编码
			var jbmc = $("#JBMC").val(); //疾病名称
			var cfsj = $("#cfsj").val(); //处方时间
			if(flag == 'YP'){
				//开药
				var url='<%=basePath%>kcf/saveYP.do';
				$.post(url,
						{
							"ghbm":ghbm,
							"cflx":cflb,
							"jbbm":jbbm,
							"jbmc":jbmc,
							"cfsj":cfsj,
							"data":data
						},
						function(resp){
							alert("保存成功！");
							});
			}else if(flag == 'LCXM'){
				//开检查
				var url='<%=basePath%>kcf/saveLCXM.do';
				$.post(url,
						{
							"ghbm":ghbm,
							"cflx":cflb,
							"jbbm":jbbm,
							"jbmc":jbmc,
							"cfsj":cfsj,
							"data":data
						},
						function(resp){alert("保存成功！")});
			}
			
			
		}
		
		/******清除项目*******/
		function clearXM(){
			$("#xiangmu").val("");
			$("#guige").val("");
			$("#danjia").val("");
			$("#zuhao").val("");
			$("#disu").val("");
			$("#pinlv").val("");
			$("#jiliang").val("");
			$("#shuliang").val("");
			$("#yongfa").val("");
		}
		/****删除普通普通处方和费用明细的内容******/
		function delTR(e){
			var trId=$(e).parent().parent().attr("id");
			$("#"+trId).remove();
		}
		/*****新开处方*******/
		function add(GHBM) {
			top.siMenu('z136','lm102','开处方','kcf/kcf_list.do?id='+GHBM);
		}
		/**删除处方**/
		function del(GHBM) {
			top.siMenu('z136','lm102','开处方','kcf/kcf_list.do?id='+GHBM);
		}
		function bl() {
			top.siMenu('z136','lm102','门诊病历','mzbl/list.do');
		}
		</script>
		
		
</body>
</html>