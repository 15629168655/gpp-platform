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
								<form action="injection/${msg }.do" name="injectionForm" id="injectionForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE }" title="机构编码" />
								<input type="hidden" name="LRR" id="LRR" value="${pd.LRR }" title="录入人" />
								<input type="hidden" name="LRRID" id="LRRID" value="${pd.LRRID }"  title="录入人ID" />
										
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
									    <tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">门诊就诊流水号<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="MZJZLSH" id="MZJZLSH" value="${pd.MZJZLSH }" maxlength="32" placeholder="这里输入门诊就诊流水号" title="门诊就诊流水号" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">患者姓名<span style="color:red; font-size:14px">*</span></td>
											<td>
											<input type="hidden" name="HZID" id="HZID" value="${pd.HZID }" />
											<input type="text" name="HZXM" id="HZXM" value="${pd.HZXM}" readonly="readonly"  style="width:75%;"/>
										    <a class="btn btn-mini btn-purple" onclick="luRuHZXM();">患者菜单</a></td>
										</tr>
										
										<tr>
										    <td style="width:120px;text-align: right;padding-top: 13px;">药品名称<span style="color:red; font-size:14px">*</span></td>
											<td>
											<input type="hidden" name="YPID" id="YPID" value="${pd.YPID }" />
											<input type="text" name="YPMC" id="YPMC" value="${pd.YPMC}" readonly="readonly" style="width:75%;"/>
										    <a class="btn btn-mini btn-purple" onclick="luRuYPMC();">药品菜单</a></td>
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">剂量（ml）</td>
											<td><input type="text" name="JL" id="JL" value="${pd.JL }" maxlength="32" placeholder="这里输入剂量" title="剂量" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">用法</td>
											<td><input type="text" name="YF" id="YF" value="${pd.YF }" maxlength="32" placeholder="这里输入用法" title="用法" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">执行时间<span style="color:red; font-size:14px">*</span></td>
											<td><input class="span10 date-picker" name="ZXSJ" id="ZXSJ"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.ZXSJ}" />' type="text" readonly="readonly" style="width:98%;" placeholder="执行时间" title="执行时间"/></td>
										</tr>
										<tr>
										<td style="width:120px;text-align: right;padding-top: 13px;">执行人工号<span style="color:red; font-size:14px">*</span></td>
										 <td><input name="ZXRCODE" id="ZXRCODE"  value="${pd.ZXRCODE }" type="text"   title="执行人工号" style="width:98%;" readonly="readonly" style="width:98%;"/></td>
									    </tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">执行人姓名<span style="color:red; font-size:14px">*</span></td>
											<td>
											<input type="hidden" name="ZXRID" id="ZXRID" value="${pd.ZXRID }" />
											<input type="text" name="ZXRXM" id="ZXRXM" value="${pd.ZXRXM}" readonly="readonly" style="width:70%;"/>
										    <a class="btn btn-mini btn-purple" onclick="docDate();">医务人员菜单</a></td>
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">备注说明</td>
											<td><input type="text" name="BZSM" id="BZSM" value="${pd.BZSM }" maxlength="50" placeholder="这里输入备注说明" title="备注说明" style="width:98%;"/></td>
										</tr>
										
										<%-- <tr>
										<td style="width:120px;text-align: right;padding-top: 13px;">生成时间</td>
										 <td><input name="SCSJ" id="SCSJ"  value="${pd.SCSJ }" type="text"   title="生成时间" style="width:98%;" readonly="readonly" style="width:98%;"/></td>
									    </tr> --%>
										<input type="hidden" name="XGSJ" id="XGSJ"  value="${pd.XGSJ }" title="修改时间" />
										<input type="hidden" name="ZT" id="ZT"  value="0" type="text"   title="状态" />
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
	
    });
    
	//保存
	function save(){
		if($("#MZJZLSH").val()==""){
			$("#MZJZLSH").tips({
				side:3,
	            msg:'请输入门诊就诊流水号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#MZJZLSH").focus();
			return false;
		}
		if($("#HZXM").val()==""){
			$("#HZXM").tips({
				side:3,
	            msg:'请输入患者姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HZXM").focus();
			return false;
		}
		if($("#YPMC").val()==""){
			$("#YPMC").tips({
				side:3,
	            msg:'请输入药品名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#YPMC").focus();
			return false;
		}
		if($("#ZXSJ").val()==""){
			$("#ZXSJ").tips({
				side:3,
	            msg:'请输入执行时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ZXSJ").focus();
			return false;
		}
		if($("#ZXRXM").val()==""){
			$("#ZXRXM").tips({
				side:3,
	            msg:'请输入执行人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ZXRXM").focus();
			return false;
		}
			$("#injectionForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
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
	
	//从门诊就诊记录表中选择患者及就诊流水号
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
		         	$("#HZID").val(id);
		         	$("#HZXM").val(name);
		         	$("#MZJZLSH").val(jzlsh);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	
	//从门诊处方明细表中选择药品  
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
		         	$("#YPID").val(id);
		         	$("#YPMC").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
		 }
	
	//医生列表
	function docDate(){
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
		  
            	var ZXRID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
            	if(ZXRID!=''){
            		$("#ZXRID").val(ZXRID);
                	$("#ZXRXM").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
                	$("#ZXRCODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
                	$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
                	diag.close();
            	}
         };
		 diag.show();
	}
</script>
</html>