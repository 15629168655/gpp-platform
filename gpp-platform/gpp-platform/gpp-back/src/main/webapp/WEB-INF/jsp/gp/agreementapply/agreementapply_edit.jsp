<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					<form action="agreementApply/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="REGION_CODE" id="REGION_CODE" value="${pd.REGION_CODE}"/>
						<input type="hidden" name="AGREEMENT_ID" id="AGREEMENT_ID" value="${pd.AGREEMENT_ID}"/>
						<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/>
						<input type="hidden" name="AUDITOR_ID" id="AUDITOR_ID" value="${pd.AUDITOR_ID}"/>
						<input type="hidden" name="GEN_PRACTITIONER_CODE" id="GEN_PRACTITIONER_CODE" value="${pd.GEN_PRACTITIONER_CODE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请人姓名:</td>
								<td>
									<input type="hidden" name="APPLICANT_ID" id="APPLICANT_ID" value="${pd.APPLICANT_ID}" /><!-- 居民ID -->
									<input type="text" name="APPLICANT_NAME" id="APPLICANT_NAME" value="${pd.APPLICANT_NAME}" readonly="readonly" style="width:80%;"/>
									<a class="btn btn-mini btn-purple" onclick="jmxxDate();">居民列表</a>
								</td>
							</tr>
							<tr>	
								<td style="width:150px;text-align: right;padding-top: 13px;">申请人电话:</td>
								<td><input type="text" name="APPLICANT_PHONE" id="APPLICANT_PHONE" value="${pd.APPLICANT_PHONE}" readonly="readonly" maxlength="255" placeholder="这里输入联系方式" title="联系方式" style="width:80%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">申请时间:</td>
									<td>
									<input class="span10 date-picker" name="GMT_CREATED" id="GMT_CREATED"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_CREATED}" />' type="text" readonly="readonly" style="width:80%;" placeholder="申请时间" title="申请时间"/>
									</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">申请状态:</td>
								<td>
									<select class="form-control" id="STATUS" name="STATUS" disabled="disabled" style="width:80%;">
                                        <c:forEach items="${pd.EnumAgreementApply}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.STATUS == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>
							</tr>
							<tr>	
								<td style="width:150px;text-align: right;padding-top: 13px;">预约方式:</td>
								<td>
									<select class="form-control" id="SIGNED_TYPE" name="SIGNED_TYPE" style="width:80%;">
                                        <c:forEach items="${pd.EnumAgreementType}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.SIGNED_TYPE == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">预约时间</td>
								<td><input type="text"  class="span10 date-picker" name="GMT_APPOINTMENT" id="GMT_APPOINTMENT" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_APPOINTMENT}" />' readonly="readonly" maxlength="255" placeholder="预约时间" title="预约时间" style="width:80%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约医生:</td>
								<td>
								<input type="hidden" name="GEN_PRACTITIONER_ID" id="GEN_PRACTITIONER_ID" value="${pd.GEN_PRACTITIONER_ID}"/>  
								<input type="text" name="GEN_PRACTITIONER_NAME" id="GEN_PRACTITIONER_NAME" value="${pd.GEN_PRACTITIONER_NAME}" style="width:80%;"/>
									<a class="btn btn-mini btn-purple" onclick="docDate();">医生列表</a>
								</td>
							</tr>
							<tr>	
								<td style="width:150px;text-align: right;padding-top: 13px;">签约医生电话:</td>
								<td><input  type="text" name="GEN_PRACTITIONER_PHONE" id="GEN_PRACTITIONER_PHONE" value="${pd.GEN_PRACTITIONER_PHONE}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:80%;"/></td>
							</tr>
							
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">审批人姓名:</td>
								<td><input type="text" name="AUDITOR_NAME" id="AUDITOR_NAME" value="${pd.AUDITOR_NAME}"  readonly="readonly" maxlength="255" placeholder="这里输入审批人姓名" title="审批人姓名" style="width:80%;"/></td>
							</tr>
							<tr>	
								<td style="width:150px;text-align: right;padding-top: 13px;">审批时间</td>
								<td><input type="text" name="GMT_AUDIT" id="GMT_AUDIT" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_AUDIT}" />' readonly="readonly" maxlength="255" placeholder="这里审批时间" title="审批时间" style="width:80%;"/></td>
							</tr>
							
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;" >审批人意见:</td>
								<td colspan="3"><textarea rows="4" cols="97%" readonly="readonly" name="AUDITOR_COMMENT" id="AUDITOR_COMMENT">${pd.AUDITOR_COMMENT}</textarea></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#APPLICANT_ID").val()==""){
			$("#APPLICANT_ID").tips({
				side:3,
	            msg:'请选择申请人ID',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#APPLICANT_ID").focus();
			return false;
			}
			if($("#APPLICANT_NAME").val()==""){
			$("#APPLICANT_NAME").tips({
				side:3,
	            msg:'请选择申请人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#APPLICANT_NAME").focus();
			return false;
			}
			
			if($("#GMT_CREATED").val()==""){
				$("#GMT_CREATED").tips({
					side:3,
		            msg:'申请时间不能为空',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#GMT_CREATED").focus();
				return false;
			}
			if($("#GMT_APPOINTMENT").val()==""){
				$("#GMT_APPOINTMENT").tips({
					side:3,
		            msg:'预约时间不能为空',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#GMT_APPOINTMENT").focus();
				return false;
			}
			if($("#GEN_PRACTITIONER_ID").val()==""){
				$("#GEN_PRACTITIONER_ID").tips({
					side:3,
		            msg:'签约医生id',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#GEN_PRACTITIONER_ID").focus();
				return false;
			}
			if($("#GEN_PRACTITIONER_NAME").val()==""){
				$("#GEN_PRACTITIONER_NAME").tips({
					side:3,
		            msg:'请选择签约医生',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#GEN_PRACTITIONER_NAME").focus();
				return false;
			}
			if($("#GMT_CREATED").val()==""){
				$("#GMT_CREATED").tips({
					side:3,
		            msg:'请选择签约时间',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#GMT_CREATED").focus();
				return false;
			}
				
				alert('保存成功！');
				$("#Form").submit();
				return false;
			}
			
		
		$(function() {
				//日期框
				$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD HH:mm:ss '
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
			
		});
		
		//居民列表
		function jmxxDate(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "居民列表";
			 diag.URL = '<%=basePath%>agreementApply/getJMXX.do';
			 diag.Width = 1000;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.OKEvent = function(){
			  
	            	var APPLICANT_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
	            	if(APPLICANT_ID!=''){
	            		$("#APPLICANT_ID").val(APPLICANT_ID);
	            		$("#APPLICANT_ID").val(diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value);
	                	$("#APPLICANT_NAME").val(diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value);
	                	$("#APPLICANT_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELEPHONE').value);
	                	diag.close();
	            	}
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
			  
	            	var GEN_PRACTITIONER_ID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
	            	if(GEN_PRACTITIONER_ID!=''){
	            		$("#GEN_PRACTITIONER_ID").val(GEN_PRACTITIONER_ID);
	            		$("#GEN_PRACTITIONER_ID").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value);
	            		$("#GEN_PRACTITIONER_CODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
	                	$("#GEN_PRACTITIONER_NAME").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
	                	$("#GEN_PRACTITIONER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
	                	$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
	                	diag.close();
	            	}
	         };
			 diag.show();
		}
		 
		</script>
</body>
</html>