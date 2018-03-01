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
					<form action="emrform/save.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="YWTYPE_ID" id="YWTYPE_ID" value="${pd.YWTYPE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">模板名称：</td>
									<td><input type="text" name="TEMPLATE_NAME" id="TEMPLATE_NAME" value="${pd.TEMPLATE_NAME}" maxlength="50" placeholder="模板名称"  title="模板名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">模板类型:</td>
								<td><select class="form-control" id="TEMPLATE_TYPE" name="TEMPLATE_TYPE" style="width:98%;">
                                        <c:forEach items="${pd.EnumErmForm}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.TEMPLATE_TYPE == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  </c:choose>
                                             </c:forEach>
                                    </select></td>
							</tr>
							<tr>
							<td style="width:100px;text-align: right;padding-top: 13px;">适应性别:</td>
								<td><select class="form-control" id="SEX" name="SEX" style="width:98%;">
                                        <c:forEach items="${pd.EnumTySex}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.SEX == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  </c:choose>
                                             </c:forEach>
                                    </select></td>
                            </tr>
                       	<tr>
							<td style="width:100px;text-align: right;padding-top: 13px;">是否必须:</td>
								<td><select class="form-control" id="MUST" name="MUST" style="width:98%;">
                                        <c:forEach items="${pd.EnumMust}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.MUST == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  </c:choose>
                                             </c:forEach>
                                    </select></td>
                            </tr>
                            <tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">操作人:</td>
								<td><input type="text" name="OPERATION_NAME" id="OPERATION_NAME" value="${pd.OPERATION_NAME}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">生成时间:</td>
								<td><input name="CREATED_TIME" id="CREATED_TIME" value="<%=nowtime%>" type="text" title="生成时间" style="width:98%;" readonly=false />
							</tr>
							<tr>
	                                <td style="width:100px;text-align: right;padding-top: 13px;">原始内容:</td>
									<td colspan="3">
									<textarea rows="5" class="form-control" id="YSNR" name="YSNR"  readonly="readonly" placeholder="" value=""></textarea>
									</td>
							</tr>
							<tr>
	                                <td style="width:100px;text-align: right;padding-top: 13px;">备注:</td>
									<td colspan="3">
									<textarea rows="3" class="form-control" id="BZ" name="BZ" value="${pd.BZ}" placeholder="这里输入备注"></textarea>
									</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">确定</a>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TEMPLATE_NAME").val()==""){
				$("#TEMPLATE_NAME").tips({
					side:3,
		            msg:'请输入模板名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_NAME").focus();
			return false;
			}
			if($("#TEMPLATE_TYPE").val()==""){
				$("#TEMPLATE_TYPE").tips({
					side:3,
		            msg:'请输入模板类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_TYPE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var str = sessionStorage.obj;
			$("#YSNR").val(str);
		});
		
		</script>
</body>
</html>