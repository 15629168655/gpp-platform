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
						<form action="mzbl/.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">名称：</td>
									<td><input type="text" name="MC" id="MC" value="${pd.BLMC }" maxlength="50"  style="width: 98%"></td>
									<td style="width:85px;text-align: right;padding-top: 13px;">类型:</td>
									<td>
										<select name="LX" id="LX" style="width:98%;">
								             <c:forEach items="${pd.EnumMzblmbLX}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.LX == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                 
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  
                                                  </c:choose>
                                             </c:forEach>
									     </select>
									 </td>
									 <td style="width:150px;text-align: right;padding-top: 13px;">简码：</td>
									<td><input type="text" name="JM" id="JM" value="${pd.JM }" maxlength="50"  style="width: 98%"></td>
								</tr>	
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">主诉</td>
									<td><textarea type="text" name="ZS" id="ZS" value="" rows="4" cols="50">${pd.ZS }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">现病史</td>
									<td><textarea type="text" name="XBS" id="XBS" value="" rows="4" cols="50">${pd.XBS }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">既往史</td>
									<td><textarea type="text" name="JWS" id="JWS" value="" rows="4" cols="50">${pd.JWS }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">体检</td>
									<td><textarea type="text" name="TS" id="TS" value="" rows="4" cols="50">${pd.TS }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">辅助检查结果</td>
									<td><textarea type="text" name="FZJCJG" id="FZJCJG" value="" rows="4" cols="50">${pd.FZJCJG }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">初步判断</td>
									<td><textarea type="text" name="CBPD" id="CBPD" value="" rows="4" cols="50">${pd.CBPD }</textarea></td>
								</tr>
								<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">治疗意见</td>
									<td><textarea type="text" name="ZLYJ" id="ZLYJ" value="" rows="4" cols="50">${pd.ZLYJ }</textarea></td>
									<td style="width:50px;text-align: right;padding-top: 13px;">备注</td>
									<td><textarea type="text" name="BZ" id="BZ" value="" rows="4" cols="50">${pd.BZ }</textarea></td>
								</tr>
								<tr>
									<td class="center" colspan="12">
										<a class="btn btn-mini btn-primary" onclick="save('${pd.ID }','${pd1.id }','${pd1.personid }');">套用</a>
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
	
	//套用
	function save(ID,id,personid){// 大写的ID(此时ID变为BLMBID传给页面，区分其他ID)是用来显示右侧的病历模板内容，小写的id是传值给填写病历页面用来查询挂号表    personid是用来查询就诊表   
		top.siMenu('z136','lm102','门诊病历','mzbl/goMzblInfo.do?BLMBID='+ID+'&id='+id+'&personid='+personid);
	}
</script>
</html>