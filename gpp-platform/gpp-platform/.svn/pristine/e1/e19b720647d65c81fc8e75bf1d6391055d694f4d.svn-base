<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

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
					<!-- 收费项目 新增修改页面 -->
					<form action="payservice/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="CZY" id="CZY" value="${pd.CZY}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>编码:</td>
								<td><input type="text" name="BM" id="BM" value="${pd.BM}"   maxlength="255" placeholder="这里输入编码" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>分类编码:</td>
								<td><input type="text" name="FLBM" id="FLBM" value="${pd.FLBM}"  readonly="readonly" maxlength="255" placeholder="这里输入分类编码" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>名称:</td>
								<td><input type="text" name="MC" id="MC" value="${pd.MC}"   maxlength="255" placeholder="这里输入名称" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">通用名:</td>
								<td><input type="text" name="TYM" id="TYM" value="${pd.TYM}"   maxlength="255" placeholder="这里输入通用名" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">简码:</td>
								<td><input type="text" name="JM" id="JM" value="${pd.JM}"   maxlength="255" placeholder="这里输入简码" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">五笔码:</td>
								<td><input type="text" name="WBM" id="WBM" value="${pd.WBM}"   maxlength="255" placeholder="这里输入五笔码" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">剂型:</td>
								<td><input type="text" name="JX" id="JX" value="${pd.JX}"   maxlength="255" placeholder="这里输入剂型" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">行业货号:</td>
								<td><input type="text" name="HYHH" id="HYHH" value="${pd.HYHH}"   maxlength="255" placeholder="这里输入行业货号" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">规格:</td>
								<td><input type="text" name="GG" id="GG" value="${pd.GG}"   maxlength="255" placeholder="这里输入规格" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">类型:</td>
								<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}"   maxlength="255" placeholder="这里输入类型" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">药房单位:</td>
								<td><input type="text" name="YFDW" id="YFDW" value="${pd.YFDW}"   maxlength="255" placeholder="这里输入药房单位" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">药库单位:</td>
								<td><input type="text" name="YKDW" id="YKDW" value="${pd.YKDW}"   maxlength="255" placeholder="这里输入药库单位" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">换算系数:</td>
								<td><input type="text" name="HSXS" id="HSXS" value="${pd.HSXS}"   maxlength="255" placeholder="这里输入换算系数" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">会员价:</td>
								<td><input type="text" name="HYJ" id="HYJ" value="${pd.HYJ}"   maxlength="255" placeholder="这里输入会员价" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">零售价:</td>
								<td><input type="text" name="LSJ" id="LSJ" value="${pd.LSJ}"   maxlength="255" placeholder="这里输入零售价" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">内部价:</td>
								<td><input type="text" name="NBJ" id="NBJ" value="${pd.NBJ}"   maxlength="255" placeholder="这里输入内部价" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">成本价:</td>
								<td><input type="text" name="CBJ" id="CBJ" value="${pd.CBJ}"   maxlength="255" placeholder="这里输入成本价" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">批发价:</td>
								<td><input type="text" name="PFJ" id="PFJ" value="${pd.PFJ}"   maxlength="255" placeholder="这里输入批发价" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">调拨价:</td>
								<td><input type="text" name="TBJ" id="TBJ" value="${pd.TBJ}"   maxlength="255" placeholder="这里输入调拨价" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">销售价:</td>
								<td><input type="text" name="XSJ" id="XSJ" value="${pd.XSJ}"   maxlength="255" placeholder="这里输入销售价" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">住院价:</td>
								<td><input type="text" name="ZYJ" id="ZYJ" value="${pd.ZYJ}"   maxlength="255" placeholder="这里输入住院价" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">使用期:</td>
								<td><input type="text" name="SYQ" id="SYQ" value="${pd.SYQ}"   maxlength="255" placeholder="这里输入使用期" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">最小用量:</td>
								<td><input type="text" name="ZXYL" id="ZXYL" value="${pd.ZXYL}"   maxlength="255" placeholder="这里输入最小用量" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">用量单位:</td>
								<td><input type="text" name="YLDW" id="YLDW" value="${pd.YLDW}"   maxlength="255" placeholder="这里输入用量单位" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">医保编码:</td>
								<td><input type="text" name="YBBM" id="YBBM" value="${pd.YBBM}"   maxlength="255" placeholder="这里输入医保编码" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">农合编码:</td>
								<td><input type="text" name="NHBM" id="NHBM" value="${pd.NHBM}"   maxlength="255" placeholder="这里输入农合编码" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">城保编码:</td>
								<td><input type="text" name="CBBM" id="CBBM" value="${pd.CBBM}"   maxlength="255" placeholder="这里输入城保编码" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">医保名称:</td>
								<td><input type="text" name="YBMC" id="YBMC" value="${pd.YBMC}"   maxlength="255" placeholder="这里输入医保名称" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">农合名称:</td>
								<td><input type="text" name="NHMC" id="NHMC" value="${pd.NHMC}"   maxlength="255" placeholder="这里输入农合名称" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">城保名称:</td>
								<td><input type="text" name="CBMC" id="CBMC" value="${pd.CBMC}"   maxlength="255" placeholder="这里输入城保名称" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">用量换算系数:</td>
								<td><input type="text" name="YLHSXS" id="YLHSXS" value="${pd.YLHSXS}"   maxlength="255" placeholder="这里输入用量换算系数" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">住院打印类别:</td>
								<td><input type="text" name="ZYDYLB" id="ZYDYLB" value="${pd.ZYDYLB}"   maxlength="255" placeholder="这里输入住院打印类别" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">门诊打印类别:</td>
								<td><input type="text" name="MZDYLB" id="MZDYLB" value="${pd.MZDYLB}"   maxlength="255" placeholder="这里输入门诊打印类别" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">执行类别:</td>
								<td><input type="text" name="ZXLB" id="ZXLB" value="${pd.ZXLB}"   maxlength="255" placeholder="这里输入执行类别" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">财务类别:</td>
								<td><input type="text" name="CWLB" id="CWLB" value="${pd.CWLB}"   maxlength="255" placeholder="这里输入财务类别" title="id" style="width:98%;"/></td>
								<td style="width:130px;text-align: center;padding-top: 13px;">医保类别:</td>
								<td><input type="text" name="YBLB" id="YBLB" value="${pd.YBLB}"   maxlength="255" placeholder="这里输入医保类别" title="id" style="width:98%;"/></td>
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
			if($("#BM").val()==""){
				$("#BM").tips({
					side:3,
		            msg:'请填写编码',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#BM").focus();
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
		
		</script>
</body>
</html>