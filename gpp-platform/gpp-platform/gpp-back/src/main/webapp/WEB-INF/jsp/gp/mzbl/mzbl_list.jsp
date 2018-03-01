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
						<form action="mzbl/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" name="HZID" id="HZID" value="${pd.PERSONID }"/><!-- 患者ID -->
							<input type="hidden" name="JGBM" id="JGBM" value="${pd.YLJGDM }"/><!-- 机构编码 -->
							<input type="hidden" name="JZSJ" id="JZSJ" value="${pd1.JZKSRQ }"/><!-- 就诊时间 -->
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">患者姓名：</td>
									<td><input type="text" name="HZXM" id="HZXM" value="${pd.XM }" maxlength="50"  style="width: 98%"></td>
									<td style="width:150px;text-align: right;padding-top: 13px;">门诊就诊流水号：</td>
									<td><input type="text" name="MZJZLSH" id="MZJZLSH" value="${pd.JZLSH }" maxlength="50"  style="width: 98%"></td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">病历名称：</td>
									<td><input type="text" name="BLMC" id="BLMC" value="${blmbPd.BLMC }" maxlength="50"  style="width: 98%"></td>
									<td style="width:85px;text-align: right;padding-top: 13px;">科室编码:</td>
									<td><input type="text" name="KSBM" id="KSBM" value="${pd.KSBM }" maxlength="50"  style="width: 98%"></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">主诉</td>
									<td><textarea type="text" name="ZS" id="ZS" value="" rows="2" cols="50">${blmbPd.ZS }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">现病史</td>
									<td><textarea type="text" name="XBS" id="XBS" value="" rows="2" cols="50">${blmbPd.XBS }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">既往史</td>
									<td><textarea type="text" name="JWS" id="JWS" value="" rows="3" cols="50">${blmbPd.JWS }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">体检</td>
									<td><textarea type="text" name="TS" id="TS" value="" rows="3" cols="50">${blmbPd.TS }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">辅助检查结果</td>
									<td><textarea type="text" name="FZJCJG" id="FZJCJG" value="" rows="3" cols="50">${blmbPd.FZJCJG }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">初步判断</td>
									<td><textarea type="text" name="CBPD" id="CBPD" value="" rows="3" cols="50">${blmbPd.CBPD }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">治疗意见</td>
									<td><textarea type="text" name="ZLYJ" id="ZLYJ" value="" rows="3" cols="50">${blmbPd.ZLYJ }</textarea></td>
								</tr>
								<tr>
									<td class="center" colspan="12">
										<a class="btn btn-mini btn-primary" onclick="save(0,'${pd.GHBM}','${msg }','${pd0.id}');">保存</a>
										<a class="btn btn-mini btn-primary" onclick="save(1,'${pd.GHBM}','${msg }','${pd0.id}');">提交</a>
										<a class="btn btn-mini btn-primary" onclick="goTymb('${pd0.id}','${pd0.personid }','${pd0.BLMBID }');">套用模板</a>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	//保存
	function save(msg,id,MSG,ID){//新增时用id ，修改时用ID
		if($("#BLMC").val()==""){
			$("#BLMC").tips({
				side:3,
	            msg:'请输入病历名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BLMC").focus();
			return false;
		} else {
			$("#MC").val($.trim($("#BLMC").val()));
		}
		
		if(msg == "1"){
			bootbox.confirm("确定要提交吗？", function(result){
				if(result){
					top.jzts();
					if(MSG == "save"){	
						$("#Form").attr("action","mzbl/save.do?s=1&id="+id);
					} else {
						$("#Form").attr("action","mzbl/edit.do?s=1&id="+ID);
					}
					$("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
			});
		}else if(msg=="0"){
			top.jzts();
			if(MSG == "save"){	
				$("#Form").attr("action","mzbl/save.do?s=0&id="+id);
			} else {
				$("#Form").attr("action","mzbl/edit.do?s=0&id="+ID);
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	}
	
	//门诊病历	
	function goTymb(id,personid,BLMBID){
		top.siMenu('z140','lm102','套用模板','mzbl/goTymb.do?id='+id+'&personid='+personid+'&BLMBID='+BLMBID);
	}
	
</script>
</html>