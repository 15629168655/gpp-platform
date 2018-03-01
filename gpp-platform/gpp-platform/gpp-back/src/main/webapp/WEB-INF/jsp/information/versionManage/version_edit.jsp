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
					<!-- 通知公告 新增修改页面 -->
					<form action="version/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>类型:</td>
								<td>
                                   <c:forEach items="${pd.EnumVersion}" var="item">
                                        <input  type="checkbox" id="TYPE" name="TYPE"  value="${item.key}" <c:if test="${pd.TYPE == item.key}"> checked="checked" </c:if> />
                                        ${item.value}   
                                    </c:forEach>
                                    <%-- <label><input id = "type1" name="TYPE" type="checkbox" value="1" <c:out value="${pd.TYPE==1?'checked':''}"/>>IOS</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input id = "type2" name="TYPE" type="checkbox" value="2" <c:out value="${pd.TYPE==2?'checked':''}"/>>ANDROID</label> --%>
								</td>  
							</tr>
                            <tr>
								<td style="width:125px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>下载地址:</td>
								<td><input type="text" name="DOWNLOAD_URL" id="DOWNLOAD_URL" value="${pd.DOWNLOAD_URL}"   maxlength="50" placeholder="请输入下载地址（http://）" title="下载地址" style="width:98%;"/></td>
							</tr>
							 <tr>
								<td style="width:125px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>版本号:</td>
								<td>
									<input type="text" name="VERSIONCODE" id="VERSIONCODE" value="${pd.VERSIONCODE}"   maxlength="50" placeholder="请输入版本号" title="版本号" style="width:98%;"/>
								</td>
							</tr>
							
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>上架时间：</td>
								<td><input class="span10 date-picker" type="text" name="GROUND_TIME" id="GROUND_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GROUND_TIME}" />'  style="width: 98%" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>文案说明:</td>
								<td><textarea name="OFFICIALCONTENT" id="OFFICIALCONTENT" maxlength="255" placeholder="请输入文案说明" title="文案说明" rows="6" cols="80">${pd.OFFICIALCONTENT}</textarea></td>
							</tr>
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>备份说明:</td>
								<td><textarea name="MEMO" id="MEMO" maxlength="255" placeholder="请输入备份说明" title="备份说明" rows="6" cols="80">${pd.MEMO}</textarea></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>是否强制更新:</td>
								<td>
                                    <label><input name="ISFORCE" type="radio" value="1" <c:out value="${pd.ISFORCE==1?'checked':''}"/> />是</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input name="ISFORCE" type="radio" value="0" <c:out value="${pd.ISFORCE==0?'checked':''}"/> />否</label>
								</td>  
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>创建时间：</td>
								<td><input class="span10 date-picker" type="text" name="CREATE_TIME" id="CREATE_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.CREATE_TIME}" />'  style="width: 98%" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>创建人：</td>
								<td colspan="3">
								<input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="创建人"  title="创建人" style="width:98%;" disabled="disabled"/>
								<input type="hidden" name="CREATEMAN" id="CREATEMAN" value="${pd.CREATEMAN}" maxlength="50" placeholder="创建人id"  title="创建人id" style="width:98%;"/>
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
			/* if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
				return false;
			} */
			if($("input[name='TYPE']").not("input:checked")){
				$("#TYPE").tips({
					side:3,
		            msg:'请选择类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
				return false;
			}
			if($("#DOWNLOAD_URL").val()==""){
				$("#DOWNLOAD_URL").tips({
					side:3,
		            msg:'请输入下载地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DOWNLOAD_URL").focus();
				return false;
			}
			if($("#VERSIONCODE").val()==""){
				$("#VERSIONCODE").tips({
					side:3,
		            msg:'请输入版本号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSIONCODE").focus();
				return false;
			}
			if($("#GROUND_TIME").val()==""){
				$("#GROUND_TIME").tips({
					side:3,
		            msg:'请输入上架时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUND_TIME").focus();
				return false;
			}
			if($("#OFFICIALCONTENT").val()==""){
				$("#OFFICIALCONTENT").tips({
					side:3,
		            msg:'请输入文案说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFFICIALCONTENT").focus();
				return false;
			}
			if($("#MEMO").val()==""){
				$("#MEMO").tips({
					side:3,
		            msg:'请输入备份说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMO").focus();
				return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD HH:mm:ss '
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
			
			$(document).ready(function(){
			    $('#Form').find('input[type=checkbox]').bind('click', function(){
			        $('#Form').find('input[type=checkbox]').not(this).attr("checked", false);
			    });
			});
		});
		
		</script>
</body>
</html>