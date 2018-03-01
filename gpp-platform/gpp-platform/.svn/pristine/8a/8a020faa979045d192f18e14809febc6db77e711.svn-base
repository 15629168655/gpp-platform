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
<!-- 弹出居民信息新增页面 -->
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
						<form action="lcxm/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" name="PID" id="PID" value="${pd.PID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">项目分类<span class="red">*</span>:</td>
									<td><input type="text" name="XMFL" id="XMFL" value="${pd.XMFL }" placeholder="这里输入项目分类" title="项目分类" style="width:98%;"  maxlength="10"/></td>
								</tr>
								<tr>
									 <td style="width:79px;text-align: right;padding-top: 13px;">编码:</td>
									 <td><input type="text" name="BM" id="BM" value="${pd.BM }" placeholder="这里输入编码" title="编码" style="width:98%;" onblur="hasBM()" maxlength="10"/></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">名称:</td>
									<td><input type="text" name="MC" id="MC" value="${pd.MC }" placeholder="这里输入名称" title="名称" style="width:98%;" maxlength="255"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">单位<span class="red">*</span>:</td>
									<td><input type="text" name="DW" id="DW" value="${pd.DW }" placeholder="这里输入单位" title="单位" style="width:98%;" maxlength="255"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">拼音码<span class="red">*</span>:</td>
									<td><input type="text" name="PYM" id="PYM" value="${pd.PYM }" maxlength="18" placeholder="这里输入拼音码" title="拼音码"  style="width:98%;" maxlength="255"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">科室<span class="red">*</span>:</td>
									<td >
									    <input type="hidden" id="KS" name="KS" value="${pd.KS }" style="width:98%;" />
									    <input type="text" id="ksmc" name="KS" readonly="readonly" style="width:88% ;" value="${pd.KSMC }" title="科室"/>
										<a class="btn btn-mini btn-purple" onclick="chooseDepart();">科室菜单</a>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">医嘱属性:</td>
									<td><input type="text" name="YZSX" id="YZSX"  value="${pd.YZSX }" placeholder="请输入医嘱属性"  title="医嘱属性" style="width:98%;" maxlength="10"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">计价标志:</td>
									<td><input type="text" name="JJBZ" id="JJBZ" value="${pd.JJBZ }" placeholder="请输入计价标志" title="计价标志" style="width:98%;" maxlength="10"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">停用:</td>
									<td>
										<select name="SFTY" id="SFTY" style="width:98%;">
								             <c:forEach items="${pd.EnumLcxmQY}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.SFTY == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                 
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  
                                                  </c:choose>
                                             </c:forEach>
									     </select>
									 </td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">打印:</td>
									<td><input type="text" name="DY" id="DY" value="${pd.DY }" placeholder="打印" title="打印" style="width:98%;" maxlength="10"/></td>
									
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">类型:</td>
									<td><input type="text" name="LX" id="LX" value="${pd.LX }" placeholder="类型" title="类型" style="width:98%;" maxlength="10"/></td>
									
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">选择部位:</td>
									<td><input type="text" name="XZBW" id="XZBW" value="${pd.XZBW }" placeholder="选择部位" title="选择部位" style="width:98%;" maxlength="10"/></td>
								</tr>
								<tr>
									<td class="center" colspan="12">
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	//保存
	function save(){
		if($("#XMFL").val()==""){
			$("#XMFL").tips({
				side:3,
	            msg:'请输入项目分类',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#XMFL").focus();
			return false;
		} else {
			$("#XMFL").val($.trim($("#XMFL").val()));
		}
		
		if($("#BM").val()==""){
			$("#BM").tips({
				side:3,
	            msg:'请输入编码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BM").focus();
			return false;
		} else {
			$("#BM").val($.trim($("#BM").val()));
		}
		
		if($("#MC").val()==""){
			$("#MC").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MC").focus();
			return false;
		} else {
			$("#MC").val($.trim($("#MC").val()));
		}
		
		if($("#DW").val()==""){
			$("#DW").tips({
				side:3,
	            msg:'请输入单位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DW").focus();
			return false;
		} else {
			$("#DW").val($.trim($("#DW").val()));
		}
		
		if($("#KS").val()==""){
			$("#KS").tips({
				side:3,
	            msg:'请输入科室',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#KS").focus();
			return false;
		} else {
			$("#KS").val($.trim($("#KS").val()));
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	}	
	//判断输入的编码是否存在
	function hasBM(){
		var BM = $("#BM").val();
		var ID = $("#ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>lcxm/hasBM.do',
	    	data: {BM:BM,ID:ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#BM").tips({
							side:3,
				            msg:'编码'+BM+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#BM').val('');
				 }
			}
		});
	}
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		//科室菜单
		function chooseDepart(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "科室菜单";
			 diag.URL = '<%=basePath%>autoRegister/getDepartData.do';
			 diag.Width = 320;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				 
				diag.close();
			 };
			 diag.show();
		}
</script>
</html>