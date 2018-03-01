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
					<!-- 团队成员页面 -->
					<form action="team/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="TEAM_ID" id="TEAM_ID" value="${pd.TEAM_ID}"/>
						<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
									<td style="width:150px;text-align: center;padding-top: 13px;">团队成员姓名：</td>
									<td>
										<input type="hidden" name="GEN_PRACTITIONER_ID" id="GEN_PRACTITIONER_ID" value="${pd.TEAM_MEMBER_ID}" />
										<input type="text" name="GEN_PRACTITIONER_NAME" id="GEN_PRACTITIONER_NAME" value="${pd.TEAM_MEMBER_NAME}" readonly="readonly" style="width: 280px"/>
										<a class="btn btn-mini btn-purple" onclick="choosePerson();">团队成员</a>
									</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">团队成员电话:</td>
								<td><input type="number" name="GEN_PRACTITIONER_PHONE" id="GEN_PRACTITIONER_PHONE" value="${pd.TEAM_MEMBER_PHONE}" maxlength="255" placeholder="这里输入成员电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">角色:</td>
								<td>
									<select class="form-control" id="ROLE_NAME" name="ROLE_NAME" >
										<c:forEach items="${pd.EnumRoleName}" var="item">
									      <option value="${item.key}" <c:if test="${pd.ROLE_NAME == item.key}"> selected="selected" </c:if> >${item.value}</option>
									       </c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">退出</a>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存编辑成员信息
		function save(){
			var name = '${msg}';
			var url ="team/"+name+".do";
			$.ajax({ 
                type: "POST",
                url:url,
                data:$('#Form').serialize(),// 你的formid
                async: false, 
                success: function(data) { 
                	if(data.status=='1'){
            			$("#zhongxin").hide();
            			$("#zhongxin2").show();
                		document.getElementById('zhongxin').style.display = 'none';
            			top.Dialog.close();
                	}else if(data.status=='01'){
                		//提交失败， 存在相同的成员
                		$("#GEN_PRACTITIONER_NAME").tips({
							side:3,
				            msg:'此团队成员已存在于本团队中',
				            bg:'#AE81FF',
				            time:3
				        });
                		 $("#GEN_PRACTITIONER_NAME").focus();
                	}else if(data.status=='02'){
                		//提交失败， 存在相同的成员
                		$("#GEN_PRACTITIONER_NAME").tips({
							side:3,
				            msg:'此团队成员已存在于其他团队中',
				            bg:'#AE81FF',
				            time:3
				        });
                		 $("#GEN_PRACTITIONER_NAME").focus();
                	}else if(data.status=='03'){
                		//提交失败， 存在相同的成员
                		$("#GEN_PRACTITIONER_NAME").tips({
							side:3,
				            msg:'此团队成员在本团队和其他团队中都已存在',
				            bg:'#AE81FF',
				            time:3
				        });
                		 $("#GEN_PRACTITIONER_NAME").focus();
                	}
                }
            });
			//$("#Form").submit();
			//$("#zhongxin").hide();
			//$("#zhongxin2").show();
		}
		
		
		//选择团队成员信息
		function choosePerson(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "团队成员信息";
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
	                	$("#GEN_PRACTITIONER_NAME").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
	                	$("#GEN_PRACTITIONER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
	                	$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
	                	diag.close();
	            	}
	         };
		 diag.show();
	}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		
		</script>
</body>
</html>