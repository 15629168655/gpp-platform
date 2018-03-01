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
						<form action="mzzdwh/saveMzzd.do" name="userForm" id="userForm" method="post">
							<input type="hidden" name="ICDCODE" id="ICDCODE" value="${pd.ICDCODE }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">疾病名称<span class="red">*</span>:</td>
									<td><input type="text" name="MC" id="MC" value="${pd.MC }" placeholder="点击这里录入疾病名称" title="名称" style="width:98%;" onclick="luRu();"/>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">TBYF_SYS_GUID<span class="red">*</span>:</td>
									<td><input type="text" name="TBYF_SYS_GUID" id="TBYF_SYS_GUID" value="${pd.TBYF_SYS_GUID }" placeholder="TBYF_SYS_GUID" title="TBYF_SYS_GUID" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">ENTERPRISE_ID<span class="red">*</span>:</td>
									<td><input type="text" name="ENTERPRISE_ID" id="ENTERPRISE_ID" value="${pd.ENTERPRISE_ID }" placeholder="ENTERPRISE_ID" title="ENTERPRISE_ID" onblur="hasI('${pd.ENTERPRISE_ID }')" style="width:98%;" /></td>
								</tr>
								<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">传染病:</td>
									<td>
										<select class="form-control" id="CRB" name="CRB" style="width:98%;">
	                                        <c:forEach items="${pd.enumMzzdwhCRB}" var="item">
	                                             <option value="${item.key}" <c:if test="${pd.CRB == item.key}"> selected="selected" </c:if> >${item.value}</option>
	                                         </c:forEach>
	                                    </select>
									</td>
								</tr>
								<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">是否尘肺病:</td>
									<td>
										<select class="form-control" id="SFCFB" name="SFCFB" style="width:98%;">
	                                        <c:forEach items="${pd.enumMzzdwhCFB}" var="item">
	                                             <option value="${item.key}" <c:if test="${pd.SFCFB == item.key}"> selected="selected" </c:if> >${item.value}</option>
	                                         </c:forEach>
	                                    </select>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">慢性病:</td>
									<td><input type="text" name="MXB" id="MXB"  value="${pd.MXB }" placeholder="慢性病" maxlength="50" title="慢性病" style="width:98%;" /></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">农合单病种:</td>
									<td><input type="text" name="NHDBZ" id="NHDBZ"  value="${pd.NHDBZ }" placeholder="农合单病种" maxlength="38"  title="农合单病种" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">医疗定额:</td>
									<td><input type="text" name="YLDE" id="YLDE"  value="${pd.YLDE }" placeholder="医疗定额(格式为：999999【6位数】或999999.99【小数点前6位，后2位】)" title="医疗定额(格式为：999999【6位数】或999999.99【小数点前6位，后2位】)" onblur="yanYLDE()" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">患者自费:</td>
									<td><input type="text" name="HZZF" id="HZZF"  value="${pd.HZZF }" placeholder="患者自费(格式为：999999【6位数】或999999.99【小数点前6位，后2位】)" title="患者自费(格式为：999999【6位数】或999999.99【小数点前6位，后2位】)" onblur="yanHZZF()" style="width:98%;" /></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">类型:</td>
									<td><input type="text" name="LX" id="LX"  value="${pd.LX }" placeholder="类型" maxlength="20" title="类型" style="width:98%;" /></td>
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
	
	//录入
	function luRu(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民列表";
		 diag.URL = '<%=basePath%>mzzdwh/goAddJbzd.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
          	var JBBM = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
          	var JBMC = diag.innerFrame.contentWindow.document.getElementById('JBMC').value;
          	//	if(JBMC !=""){
        			//验证选中的疾病是否已存在
        			//var str = $("#mc").val();
        		//	top.jzts();
        			$.ajax({
        				type: "POST",
        				url: '<%=basePath%>mzzdwh/luRuJbzd.do',
        				data: {BM:JBBM},
        				dataType:'json',
        				cache: false,
        				success: function(data){
        					if(data.msg == 'no'){
        						$("#MC").tips({
        							side:3,
        				            msg:'您选中的信息已存在，请核实！',
        				            bg:'#AE81FF',
        				            time:3
        				        });
        						$("#MC").val("");
        						return false;
        					}
        					
        				}
        			});
        	//	}
          	if(JBBM !=''){
              	$("#ICDCODE").val(JBBM);
              	$("#MC").val(JBMC);
              	diag.close();
          	}
       };
		 diag.show();
	}
	
	//验证金额正则表达式
	function isJinE(ylde){
		return(new RegExp(/^([1-9][\d]{0,5}|0)(\.[\d]{1,2})?$/).test(ylde));
	}
	
	//验证医疗定额格式
	function yanYLDE(){
		if(!isJinE($("#YLDE").val()) && $("#YLDE").val() != ""){
			$("#YLDE").tips({
				side:3,
	            msg:'输入的金额格式错误或者金额大小超范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#YLDE").val("");
			return false;
		}
	}
	
	//验证医疗定额格式
	function yanHZZF(){
		if(!isJinE($("#HZZF").val()) && $("#HZZF").val() != ""){
			$("#HZZF").tips({
				side:3,
	            msg:'输入的金额格式错误或者金额大小超范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HZZF").val("");
			return false;
		}
	}
	//保存
	function save(){
		
		if($("#MC").val() ==""){
			$("#MC").tips({
				side:3,
	            msg:'疾病名称不能为空',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MC").focus();
			return false;
		}
		
		if($("#TBYF_SYS_GUID").val()==""){
			$("#TBYF_SYS_GUID").tips({
				side:3,
	            msg:'tbyf_sys_guid不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TBYF_SYS_GUID").focus();
			return false;
		}else{
			$("#TBYF_SYS_GUID").val($.trim($("#TBYF_SYS_GUID").val()));
		}	
		if($("#ENTERPRISE_ID").val()==""){
			$("#ENTERPRISE_ID").tips({
				side:3,
	            msg:'enterprise_id不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ENTERPRISE_ID").focus();
			return false;
		}else{
			$("#ENTERPRISE_ID").val($.trim($("#ENTERPRISE_ID").val()));
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}	
	
</script>
</html>