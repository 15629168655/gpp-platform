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
				<div class="page-header">
					<h1>手术编码管理</h1>
				</div>
				<div class="row">
					<div class="col-xs-12">				
					<form action="operationscode/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal">
						<input type="hidden" name="OPERATIONSCODE_ID" id="OPERATIONSCODE_ID" value="${pd.OPERATIONSCODE_ID}"/>
						<input type="hidden" name="add_success" id="add_success" value="${pd.success}"/>
						<div class="form-group">
                            <div class="col-xs-12 col-sm-4">
                                <label class="col-sm-4 control-label no-padding-right" for="SSBM">手术编码:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="col-sm-12" name="SSBM" id="SSBM" value="${pd.SSBM}" maxlength="22" placeholder="手术编码" title="手术编码" style="width:100%;">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4">
                                <label class="col-sm-4 control-label no-padding-right" for="SSMC">手术名称:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="col-sm-12" name="SSMC" id="SSMC" value="${pd.SSMC}" maxlength="64" placeholder="手术名称" title="手术名称" style="width:100%;">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4">
                                <label class="col-sm-4 control-label no-padding-right" for="PYZJM">拼音助记码:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="col-sm-12" name="PYZJM" id="PYZJM" value="${pd.PYZJM}" maxlength="64" placeholder="拼音助记码" title="拼音助记码" style="width:100%;">
                                </div>
                            </div>
                         </div>
                         <div class="form-group">
                         	<div class="col-xs-12 col-sm-4">
                                <label class="col-sm-4 control-label no-padding-right" for="SX">属性:</label>
								<div class="col-sm-8">
									<select class="form-control" id="SX" name="SX" style="width:100%;">
                                    	<c:forEach items="${pd.enumSx}" var="item">
                                            <c:choose>
                                                <c:when test="${pd.SX == item.value}">
                                                    <option value="${item.value}" selected="selected">${item.value}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.value}">${item.value}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
									</select>
								</div>
						   </div>
                         </div>
                         <div class="form-group">
                         	<div class="clearfix form-actions" style="width:90%; margin:0 auto;">
                            	<div class="col-md-offset-3 col-md-9" style='text-align:center;'>
                                <button class="btn btn-info" type="button" onclick="save();">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                                                   保存
                                </button>
                                </div>
                            </div>
                        </div>
						
						<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
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
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
	<script type="text/javascript">
		
	$(top.hangge()); //关闭加载状态
		
		$(document).ready(function(){
			if($("#OPERATIONSCODE_ID").val()!=""){
				$("#SSBM").attr("readonly","readonly");
				$("#SSBM").css("color","gray");
			}
		});
		
		//保存
		function save(){
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if ($("#SSBM").val() == ""|| $("#SSBM").val()=="此手术编码已存在!") {
				_msg = '请输入手术编码';
				selector = $("#SSBM");
			}else if ($("#SSMC").val() == "") {
				selector = $("#SSMC");
				_msg = '请输入手术名称';
			}else if ($("#SX").val() == "") {
				selector = $("#SX");
				_msg = '请输入属性';
			}
			if(_msg != ''){
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});
			}
			else if($("#OPERATIONSCODE_ID").val()==""){
				hasC();
			}	
			else{
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		}
		
		//判断手术编码是否存在
		function hasC(){
			var SSBM = $("#SSBM").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>operationscode/hasC.do',
		    	data: {SSBM:SSBM},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					 }else{
						$("#SSBM").css("background-color","#D16E6C");
						setTimeout("$('#SSBM').val('此手术编码已存在!')",500);
					 }
				}
			});
		}
	</script>
</body>
</html>