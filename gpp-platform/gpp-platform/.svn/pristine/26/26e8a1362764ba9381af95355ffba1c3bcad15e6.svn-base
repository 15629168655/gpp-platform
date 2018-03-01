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

<link rel="stylesheet" href="static/ace/css/bootstrap-datetimepicker.css" />

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
								<form action="skintest/${msg }.do" name="skintestForm" id="skintestForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE }" title="机构ID" />
								<input type="hidden" name="LRR" id="LRR" value="${pd.LRR }" title="录入人" />
								<input type="hidden" name="LRRID" id="LRRID" value="${pd.LRRID }"  title="录入人ID" />
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
									    <tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">门诊就诊流水号<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="MZJZLSH" id="MZJZLSH" value="${pd.MZJZLSH }" maxlength="32" placeholder="这里输入门诊就诊流水号" title="门诊就诊流水号" style="width:98%;"/></td>
										</tr>
										<tr>
										    <td style="width:100px;text-align: right;padding-top: 13px;">患者姓名<span style="color:red; font-size:14px">*</span></td>
									         <td>
									             <input type="hidden" name="HZID" id="HZID" value="${pd.HZID}" />
										         <input type="text" name="HZXM" id="HZXM" value="${pd.HZXM}"  readonly="readonly"  style="width:78%;"/>
										         <a class="btn btn-mini btn-purple" onclick="choosePerson();">患者菜单</a>
									         </td>
										</tr>
										<tr>
										    <td style="width:100px;text-align: right;padding-top: 13px;">皮试药品名称<span style="color:red; font-size:14px">*</span></td>
										    <td id="hz">
										     <input type="hidden" name="PSYP" id="PSYP" value="${pd.PSYP }"/>
									          <select class="chosen-select form-control" name="PSYPID" id="PSYPID" data-placeholder="皮试药品名称" style="vertical-align:top;"  title="皮试药品名称" style="width:98%;"  >
									          <option value=""></option>
									          <c:forEach items="${drugList}" var="drug">
										      <option value="${drug.ID }" <c:if test="${drug.YPMC == pd.PSYP }">selected</c:if>>${drug.YPMC }</option>
									          </c:forEach>
									          </select>
									         </td>
										</tr>
										<tr>
										    <td style="width:100px;text-align: right;padding-top: 13px;">皮试液名称<span style="color:red; font-size:14px">*</span></td>
										    <td id="hz">
										    <input type="hidden" name="PSYMC" id="PSYMC" value="${pd.PSYMC }"/>
									          <select class="chosen-select form-control" name="PSYBM" id="PSYBM" data-placeholder="皮试液名称" style="vertical-align:top;"  title="皮试药品名称" style="width:98%;"  >
									          <option value=""></option>
									          <c:forEach items="${drugList}" var="drug">
										      <option value="${drug.ID }" <c:if test="${drug.YPMC == pd.PSYMC }">selected</c:if>>${drug.YPMC }</option>
									          </c:forEach>
									          </select>
									         </td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">皮试类型<span style="color:red; font-size:14px">*</span></td>
											<td>
											<select class="form-control"  name="PSLX" id="PSLX" style="width:98%;">
		                                         <option value="" selected >请选择皮试类型</option>
		                                         <c:forEach items="${pd.enumSkintestType}" var="type">
                                                       <option value="${type.key}" <c:if test="${pd.PSLX == type.key}"> selected="selected" </c:if> >${type.value}</option>
                                                 </c:forEach>
		                                     </select>
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;" >过敏反应<span style="color:red; font-size:14px">*</span></td>
											<td>
											<select class="form-control"  name="GMFY" id="GMFY" style="width:98%;">
		                                         <option value="" selected >请选择过敏反应</option>
		                                         <c:forEach items="${pd.enumAllergicReaction}" var="gmfy">
                                                       <option value="${gmfy.key}" <c:if test="${pd.GMFY == gmfy.key}"> selected="selected" </c:if> >${gmfy.value}</option>
                                                 </c:forEach>
		                                     </select>
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">试验开始时间<span style="color:red; font-size:14px">*</span></td>
											<td><input class="span10 date-picker" name="KSSJ" id="KSSJ"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.KSSJ}" />' type="text" readonly="readonly" style="width:98%;" placeholder="试验开始时间" title="试验开始时间"/></
										  </tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">试验结束时间<span style="color:red; font-size:14px">*</span></td>
											<td><input class="span10 date-picker" name="JSSJ" id="JSSJ"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.JSSJ}" />' type="text" readonly="readonly" style="width:98%;" placeholder="试验结束时间" title="试验结束时间"/></
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
										<%-- <tr>
										<td style="width:100px;text-align: right;padding-top: 13px;">生成时间</td>
										 <td><input name="SCSJ" id="SCSJ"  value="${pd.SCSJ}" type="text"   title="生成时间" style="width:98%;" readonly /></td>
									    </tr>
									    <tr>
										<td style="width:100px;text-align: right;padding-top: 13px;">修改时间</td>
										 <td><input name="XGSJ" id="XGSJ"  value="${pd.XGSJ}" type="text"   title="生成时间" style="width:98%;" readonly /></td>
									    </tr> --%>
									    <input type="hidden" name="XGSJ" id="XGSJ"  value="${pd.XGSJ }" title="修改时间" />
									    <input type="hidden" name="ZT" id="ZT"  value="0"  title="状态" />
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
		
		  var psypSel=$("#PSYPID option:selected");
		  $("#PSYP").val(psypSel.text());
		  
		  var psySel=$("#PSYBM option:selected");
		  $("#PSYMC").val(psySel.text());
		  
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
		if($("#PSYPID").val()==""){
			$("#PSYPID").tips({
				side:3,
	            msg:'请输入皮试药品名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PSYPID").focus();
			return false;
		}
		if($("#PSYBM").val()==""){
			$("#PSYBM").tips({
				side:3,
	            msg:'请输入皮试液名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PSYBM").focus();
			return false;
		}
		if($("#PSLX").val()==""){
			$("#PSLX").tips({
				side:3,
	            msg:'请选择皮试类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PSLX").focus();
			return false;
		}
		if($("#GMFY").val()==""){
			$("#GMFY").tips({
				side:3,
	            msg:'请选择过敏反应',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#GMFY").focus();
			return false;
		}
		if($("#KSSJ").val()==""){
			$("#KSSJ").tips({
				side:3,
	            msg:'请输入试验开始时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#KSSJ").focus();
			return false;
		}
		if($("#JSSJ").val()==""){
			$("#JSSJ").tips({
				side:3,
	            msg:'请输入试验结束时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JSSJ").focus();
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
		
		//检查日期
		if($("#KSSJ").val()!= "" && $("#JSSJ").val() != ""){
			var t1 = $("#KSSJ").val();
			var t2 = $("#JSSJ").val();
			
			date1 = Number(t1.substr(0,10).replace('-', '').replace('-', ''));
			date2 = Number(t2.substr(0,10).replace('-', '').replace('-', ''));
			time1 = Number(t1.substr(11,5).replace(':', ''));
			time2 = Number(t2.substr(11,5).replace(':', ''));
			
			if(date1-date2>=0){
				if(date1-date2>0){
					$("#KSSJ").tips({
						side:3,
			            msg:'试验开始时间必须早于试验结束时间',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
				}
				if(date1-date2==0){
					if(time1-time2>0){
						$("#KSSJ").tips({
							side:3,
				            msg:'试验开始时间必须早于试验结束时间',
				            bg:'#AE81FF',
				            time:3
				        });
					return false;
					}
			    }
			}
		}
		
		  
			$("#skintestForm").submit();
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
	
	
	//录入患者
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
		         	$("#HZID").val(id);
		         	$("#HZXM").val(name);
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