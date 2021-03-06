<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					<form action="agreementService/renew.do" name="Form" id="Form" method="post" enctype="multipart/form-data" >
						<div id="zhongxin" style="padding-top: 13px;">
						<input type="hidden" name="ID" id="ID" value="${pd.ID }"  />
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议名称:</td>
								<td><input type="text" name="AGREEMENT_NAME" id="AGREEMENT_NAME" value="${pd.AGREEMENT_NAME }" maxlength="255" placeholder="这里输入协议名称" title="协议名称" style="width:98%;" /></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议开始时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" value='<fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.GMT_START}"/>' style="width:98%;" name="GMT_START" id="GMT_START"   type="text" data-date-format="yyyy-mm-dd"   />
								    <input type="hidden" id="GMT_START_HIDDEN" value="${pd.GMT_START}">
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议结束时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker"  value='<fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.GMT_END}"/>' style="width:98%;" name="GMT_END" id="GMT_END"   type="text" data-date-format="yyyy-mm-dd"  />
								    <input type="hidden" id="GMT_END_HIDDEN" value="${pd.GMT_END}">
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约居民姓名:</td>
								
								<td>
									<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${pd.MEMBER_ID }"  /><!-- 居民ID -->
									<input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="${pd.MEMBER_NAME }"  readonly="readonly" style="width:98%;"/>
						<!--  		<a class="btn btn-mini btn-purple" onclick="jmxxDate();">居民列表</a>-->
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td><input type="text" name="ID_CARD" id="ID_CARD" value="${pd.ID_CARD }"  style="width:98%;" readonly="readonly"/></td>
								
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">医保卡号:</td>
								<td><input type="text" name="MI_CARD" id="MI_CARD" value="${pd.MI_CARD }"  style="width:98%;" readonly="readonly"/></td>
								
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="${pd.MEMBER_PHONE }"  style="width:98%;"/></td>
								
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">家庭住址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS }"  style="width:98%;"/></td>
								
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议文件:</td>
								<td><input type="file" name="FILE" id="FILE" value="" maxlength="255"  style="width:98%;"/>
									<input type="hidden" name="OLD_FILE_URL" id="OLD_FILE_URL" value="${pd.FILE_ID}"/>
								</td>
								
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">服务包:</td>
								<td>
									<select name="SERVICE_PACK" id="SERVICE_PACK" style="width:98%;">
							            
                                            <c:forEach items="${pd.PACKList}" var="item">
                                            <c:choose>
                                                 <c:when test="${item.ID == pd.SERVICE_PACK}">
                                                     <option value="${item.ID}" selected="selected">${item.MC}</option>
                                                 </c:when>
                                                 <c:otherwise>
                                                     <option value="${item.ID}">${item.MC}</option>
                                                 </c:otherwise>
                                            </c:choose>
                                            </c:forEach>
                                         
								     </select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">确定续约</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#AGREEMENT_NAME").val()==""){
				$("#AGREEMENT_NAME").tips({
					side:3,
		            msg:'请输入协议名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGREEMENT_NAME").focus();
			return false;
			}
			if($("#APPLICANT_CODE").val()==""){
				$("#APPLICANT_CODE").tips({
					side:3,
		            msg:'请输入协议编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#APPLICANT_CODE").focus();
			return false;
			}
			var stime = $("#GMT_START_HIDDEN").val();
			var etime = $("#GMT_END_HIDDEN").val();
			var start = $("#GMT_START").val();
			var end = $("#GMT_END").val();
			if(etime> start ){
				$("#GMT_START").tips({
					side:3,
		            msg:'起始时间应大于上次协议截至日期',
		            bg:'#AE81FF',
		            time:2
		        }); 
				return false;
			}
			if(start> end ){
				$("#GMT_END").tips({
					side:3,
		            msg:'截至时间应大于起始时间',
		            bg:'#AE81FF',
		            time:2
		        }); 
				return false;
			}
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		//验证时间
		function checkStart(stime,etime){
			
			var start = $("#GMT_START").val();
			if(etime> start ){
				$("#GMT_START").tips({
					side:3,
		            msg:'起始时间应大于上次协议截至日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_START").val(stime);
			}
		}
		function checkEnd(etime){
			var start = $("#GMT_START").val();
			var end = $("#GMT_END").val();
			if(start> end ){
				$("#GMT_END").tips({
					side:3,
		            msg:'截至时间应大于起始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_END").val(etime);
			}
		}
		</script>
</body>
</html>