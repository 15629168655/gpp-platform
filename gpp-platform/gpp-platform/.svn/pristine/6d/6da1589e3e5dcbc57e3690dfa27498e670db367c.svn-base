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
<!-- 弹出新增输液登记 -->
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
						<form action="sydj/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="id" value="${pd.ID }"/>   						<!-- ID -->
							<input type="hidden" name="DRUG_ID" id="drug_id" value="${pd.DRUG_ID }"/>			<!-- 药品ID -->
							<input type="hidden" name="PATIENT_ID" id="patient_id" value="${pd.PATIENT_ID }"/>	<!-- 患者ID -->
							<input type="hidden" name="ZXR_ID" id="zxr_id" value="${pd.ZXR_ID }"/>	<!-- 执行人ID -->
							<input type="hidden" name="ZXR_CODE" id="ZXR_CODE" value="${pd.ZXR_CODE }"/>	
							<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/> <!-- 机构ID -->
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:95px;text-align: right;padding-top: 13px;">药品名称<span class="red">*</span>:</td>
									<td><input type="text" name="YPMC" id=ypmc value="${pd.YPMC }" readonly="readonly" placeholder="点击这里录入药品名称" title="名称" style="width:98%;" onclick="luRuYPMC();"/>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">患者姓名<span class="red">*</span>:</td>
									<td><input type="text" name="PATIENT_NAME" id="patient_name" value="${pd.PATIENT_NAME }" readonly="readonly" placeholder="点击这里录入患者姓名" title="患者姓名" style="width:98%;" onclick="luRuHZXM();"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">就诊流水号:</td>
									<td><input type="text" name="MZJZLSH" id="mzjzlsh" value="${pd.MZJZLSH }" readonly="readonly" placeholder="门诊就诊流水号" title="门诊就诊流水号" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">执行时间:</td>
									<td><input class="span10 date-picker" name="EXECUTION_TIME" id="execution_time"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.EXECUTION_TIME}" />' type="text" readonly="readonly" style="width:98%;" placeholder="执行时间" title="执行时间"/>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">结束时间:</td>
									<td><input class="span10 date-picker" name="END_TIME" id="end_time"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.END_TIME}" />' type="text" readonly="readonly" style="width:98%;" placeholder="结束时间" title="结束时间" onblur="JCRQ();"/>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">剂量(ml):</td>
									<td><input type="text" name="DOSE" id="dose" value="${pd.DOSE }" placeholder="剂量(单位ml)" maxlength="40" title="剂量(单位ml)" style="width:98%;"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">途径:</td>
									<td>
										<input type="text" name="CHANNEL" id="CHANNEL" value="静脉滴注"  style="width:98%;" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">滴速:</td>
									<td><input type="text" name="DROP_SPEED" id="drop_speed" value="${pd.DROP_SPEED }" placeholder="滴速" maxlength="20" title="滴速" style="width:98%;"/></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">执行人姓名:</td>
									<td><input type="text" name="ZXR_NAME" id="zxr_name" value="${pd.ZXR_NAME }" placeholder="点击这里录入执行人姓名" title="执行人姓名" readonly="readonly" style="width:98%;" onclick="luRuZXR();"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">备注说明:</td>
									<td><input type="text" name="REMARK" id="remark"  value="${pd.REMARK }" placeholder="备注说明"  title="备注说明" style="width:98%;" /></td>
								</tr>
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
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
	
	//检查日期
	function JCRQ(){
		if($("#GMT_REMIND").val()!= "" && $("#GMT_JOB").val() != ""){
			var t1 = $("#execution_time").val();
			var t2 = $("#end_time").val();
			
			date1 = Number(t1.substr(0,10).replace('-', '').replace('-', ''));
			date2 = Number(t2.substr(0,10).replace('-', '').replace('-', ''));
			time1 = Number(t1.substr(11,5).replace(':', ''));
			time2 = Number(t2.substr(11,5).replace(':', ''));
			
			if(date1-date2>0){
				$("#end_time").tips({
					side:3,
		            msg:'结束时间必须晚于执行时间',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#end_time").val("");
				return false;
			}
		}
	}

	/*
	//验证输入时间的正则表达式
	function isSJ(time){
		return(new RegExp(/^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01]) (0\d{1}|1\d{1}|2[0-3]):[0-5]\d{1}:([0-5]\d{1})$/).test(time));
	}
	
	//验证执行时间格式
	function yanZXSJ(){
		if(!isSJ($("#execution_time").val()) && $("#execution_time").val() !=""){
			$("#execution_time").tips({
				side:3,
	            msg:'请根据提示输入正确的时间格式',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#execution_time").val("");
			return false;
		}
	}
	
	//验证执行时间格式
	function yanJSSJ(){
		if(!isSJ($("#end_time").val()) && $("#end_time").val() !=""){
			$("#end_time").tips({
				side:3,
	            msg:'请根据提示输入正确的时间格式',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#end_time").val("");
			return false;
		}
	}**/
		
		
	//录入患者
	function luRuHZXM(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "就诊记录";
		 diag.URL = '<%=basePath%>sydj/goluRuHZXM.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('PERSONID').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('HZXM').value;
	         	var jzlsh=diag.innerFrame.contentWindow.document.getElementById('JZLSH').value;
	         	if(id !=''){
		         	$("#patient_id").val(id);
		         	$("#patient_name").val(name);
		         	$("#mzjzlsh").val(jzlsh);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	
	//录入药品
	function luRuYPMC(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "处方明细";
		 diag.URL = '<%=basePath%>sydj/goluRuYPMC.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('drug_id').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('ypmc').value;
	         	if(id !=''){
		         	$("#drug_id").val(id);
		         	$("#ypmc").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	
	//录入执行人
	function luRuZXR(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "医生列表";
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
           	var GEN_PRACTITIONER_ID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
           	if(GEN_PRACTITIONER_ID!=''){
           		$("#zxr_id").val(GEN_PRACTITIONER_ID);
               	$("#zxr_name").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
       //      	$("#GEN_PRACTITIONER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
      //        $("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
               	$("#ZXR_CODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
               	diag.close();
           	}
        };
		 diag.show();
		 }
	
	//保存
	function save(){
		if($("#ypmc").val()==""){
			$("#ypmc").tips({
				side:3,
	            msg:'药品名称不能为空',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ypmc").focus();
			return false;
		} else {
			$("#ypmc").val($.trim($("#ypmc").val()));
		}
		
		if($("#patient_name").val()==""){
			$("#patient_name").tips({
				side:3,
	            msg:'患者姓名不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#patient_name").focus();
			return false;
		}else{
			$("#patient_name").val($.trim($("#patient_name").val()));
		}	
		
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();

	}	
	
</script>
</html>