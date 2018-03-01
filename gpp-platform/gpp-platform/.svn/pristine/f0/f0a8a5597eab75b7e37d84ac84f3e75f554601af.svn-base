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
						<form action="knowledgeBase/saveEdit.do" name="userForm" id="userForm" method="post" enctype="multipart/form-data">
							
							<div id="zhongxin" style="padding-top: 13px;">
							<input type="hidden" name="id" id="id" value="${data.ID }"/>
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">请选择科室：</td>
									<td>
										<input  type="hidden" id="DEPART_CODE" value="${data.DEPART_CODE }"/>
										<select id="_depart" name="_depart" style="width: 350px">
										</select>
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">请选择疾病分类：</td>
									<td>
										<input  type="hidden" id="DISEASES_CLASS_CODE" value="${data.DISEASES_CLASS_CODE }"/>
										<select id="_diseases" name="_diseases" style="width: 350px">
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">疾病名称：</td>
									<td><input type="text" name="diseases_name" id="diseases_name" value="${data.DISEASES_NAME }"  style="width: 350px"/></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">是否推荐：</td>
									<td>
										<label><input name="is_recommend" type="radio" value="1" <c:out value="${data.IS_RECOMMEND==1?'checked':''}"/> />推荐</label>
										<label><input name="is_recommend" type="radio" value="0" <c:out value="${data.IS_RECOMMEND==0?'checked':''}"/> />不推荐</label>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">首字母：</td>
									<td><input type="text" name="FIRST" id="FIRST" value="${data.FIRST }" maxlength="1" style="width: 350px" onblur="YZSZM();"></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">内容：</td>
									<td><textarea type="text" name="remark" id="remark"  style="width: 350px">${data.REMARK }</textarea></td>
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
	//默认加载下来菜单
	//默认选中原值
	$(function(){
		var url="<%=basePath%>knowledgeBase/getSelectData.do";
		$.post(url,{},
			function(data){
			$("#_depart").empty();
			$("#_diseases").empty();
			var listDepart = data.depart;
			var htmlDepart = '';
			for(var i = 0; i<listDepart.length;i++){
				if($("#DEPART_CODE").val() ==listDepart[i].bianma ){
					htmlDepart += '<option  selected ="selected" value="'+listDepart[i].bianma+'##'+listDepart[i].name+'">'+listDepart[i].name+'</option>'
				}else{
				htmlDepart += '<option value="'+listDepart[i].bianma+'##'+listDepart[i].name+'">'+listDepart[i].name+'</option>'
				}
			}
			$("#_depart").append(htmlDepart);
			var listDiseases = data.diseases;
			var htmlDiseases = '';
			for(var i = 0; i<listDiseases.length;i++){
				if($("#DISEASES_CLASS_CODE").val() ==listDiseases[i].bianma ){
				htmlDiseases += '<option selected ="selected" value="'+listDiseases[i].bianma+'##'+listDiseases[i].name+'">'+listDiseases[i].name+'</option>'
				}else{
					htmlDiseases += '<option value="'+listDiseases[i].bianma+'##'+listDiseases[i].name+'">'+listDiseases[i].name+'</option>'
				}
			}
			$("#_diseases").append(htmlDiseases);
		});
	});
	//保存
	function save(){
		if($("#diseases_name").val()==""){
			$("#diseases_name").tips({
				side:3,
	            msg:'请输入疾病名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#agreement_name").focus();
			return false;
		} else {
			$("#diseases_name").val($.trim($("#diseases_name").val()));
		}
		
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//验证首字母
	var _FIRST = $("#FIRST").val();
	function YZSZM(){
		  var FIRST = $("#FIRST").val();
		  if(!FIRST.match(/^[A-Z]+$/)){
			$("#FIRST").tips({
				side:3,
	            msg:'请输入一个大写字母',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIRST").val(_FIRST);
		  }
	}
</script>
</html>