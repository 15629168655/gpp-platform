<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

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
						<form action="autoRegister/saveObject.do" name="userForm" id="userForm" method="post">
							
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">请选择科室：</td>
									<td>
										<input type="hidden" id="ksbm" name="KSBM"/>
										<input type="text" id="ksmc" name="KSMC" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="chooseDepart();">科室菜单</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">患者姓名：</td>
									<td>
									<input type="hidden" name="personID" id="personID" value="" />
										<input type="text" name="XM" id="xm" value="" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="choosePerson();">患者菜单</a>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">患者归属地：</td>
									<td>
										<select id="hzgsd" name="HZGSD" style="width: 350px">
											<option value="1">本县区</option>
											<option value="2">本市其他县区</option>
											<option value="3">本省其他地市</option>
											<option value="4">外省</option>
											<option value="5">港澳台</option>
											<option value="6">外籍</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">收/退费编号：</td>
									<td><input type="text" name="STFBH" id="stfbh" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">就诊流水号：</td>
									<td><input type="text" name="JZLSH" id="jzlsh" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">预约流水号：</td>
									<td><input type="text" name="YYLSH" id="yylsh" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">挂号类别：</td>
									<td>
										<select id="ghlb" name="GHLB" style="width: 350px">
											<option value="100">普通门诊</option>
											<option value="101">专科门诊</option>
											<option value="102">专家门诊</option>
											<option value="103">特需门诊</option>
											<option value="104">专病门诊</option>
											<option value="200">急诊</option>
											<option value="600">体检</option>
											<option value="999">其他</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">挂号方式：</td>
									<td>
										<select id="ghfs" name="GHFS" style="width: 350px">
											<option value="1">自助机</option>
											<option value="2">窗口</option>
											<option value="3">网上预约</option>
											<option value="4">电话预约</option>
											<option value="5">（复）诊间预约</option>
											<option value="6">社区（转诊）预约</option>
											<option value="7">VIP预约</option>
											<option value="9">移动APP预约</option>
											<option value="99">其他</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">预约途径：</td>
									<td>
										<select id="yytjdm" name="YYTJDM" style="width: 350px">
											<option value="1">现场预约</option>
											<option value="2">电话预约</option>
											<option value="3">短信预约</option>
											<option value="4">网上预约</option>
											<option value="9">其他预约方式</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">自费诊疗费(含挂号费)：</td>
									<td><input type="text" name="ZFZLF" id="zfzlf" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">诊疗费：</td>
									<td><input type="text" name="ZLF" id="zlf" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">其它费：</td>
									<td><input type="text" name="QTF" id="qtf" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">卡类型：</td>
									<td>
										<select id="klx" name="KLX" style="width: 350px">
											<option value="0">社保卡</option>
											<option value="1">医保卡</option>
											<option value="2">居民健康卡</option>
											<option value="3">院内卡</option>
											<option value="5">新农合卡</option>
											<option value="9">其他卡</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">卡号：</td>
									<td><input type="text" name="KH" id="kh" value=""  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">医疗费用来源：</td>
									<td>
										<select id="ylfylylb" name="YLFYLYLB" style="width: 350px">
											<option value="01">城镇职工基本医疗保险</option>
											<option value="02">城镇居民基本医疗保险</option>
											<option value="03">新型农村合作医疗</option>
											<option value="04">贫困救助</option>
											<option value="05">商业医疗保险</option>
											<option value="06">全公费</option>
											<option value="07">全自费</option>
											<option value="08">其他社会保险</option>
											<option value="99">其他</option>
										</select>
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">计入挂号人次标识：</td>
									<td>
										<label><input name="GHRCBS" type="radio" value="1"  checked="checked"/>是</label>
										<label><input name="GHRCBS" type="radio" value="2" />否</label>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">特需标志：</td>
									<td>
										<label><input name="TXBZ" type="radio" value="0" checked="checked"/>非特需</label>
										<label><input name="TXBZ" type="radio" value="1" />特需</label>
									</td>
								</tr>
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">确定挂号</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#ksmc").val()==""){
				$("#ksmc").tips({
					side:3,
		            msg:'请选择科室',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ksmc").focus();
				return false;
			} else {
				$("#ksmc").val($.trim($("#ksmc").val()));
			}
		if($("#xm").val()==""){
			$("#xm").tips({
				side:3,
	            msg:'请选择患者',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#xm").focus();
			return false;
		} else {
			$("#xm").val($.trim($("#xm").val()));
		}
		var reg = /^\d+(\.\d+)?$/; //正则 验证输入为数字，包含小数
		if($("#zfzlf").val()==""){
			$("#zfzlf").tips({
				side:3,
	            msg:'请输入自费诊疗费(含挂号费)',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#zfzlf").focus();
			return false;
		}else if (reg.test($("#zfzlf").val())!=true){
			$("#zfzlf").tips({
				side:3,
	            msg:'请输入合法数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#zfzlf").focus();
			return false;
		} 
		if($("#zlf").val()==""){
			$("#zlf").tips({
				side:3,
	            msg:'请输入诊疗费',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#zlf").focus();
			return false;
		}else if (reg.test($("#zlf").val())!=true){
			$("#zlf").tips({
				side:3,
	            msg:'请输入合法数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#zlf").focus();
			return false;
		} 
		if($("#qtf").val()==""){
			$("#qtf").tips({
				side:3,
	            msg:'请输入其它费',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#qtf").focus();
			return false;
		}else if (reg.test($("#qtf").val())!=true){
			$("#qtf").tips({
				side:3,
	            msg:'请输入合法数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#qtf").focus();
			return false;
		} 
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//科室菜单
	function chooseDepart(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "科室菜单";
		 diag.URL = '<%=basePath%>autoRegister/getDepartData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	}
	function choosePerson(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "患者信息";
		 diag.URL = '<%=basePath%>	autoRegister/getPersonData.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('pid').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('xm').value;
	         	if(id !=''){
		         	$("#personID").val(id);
		         	$("#xm").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
</script>
</html>