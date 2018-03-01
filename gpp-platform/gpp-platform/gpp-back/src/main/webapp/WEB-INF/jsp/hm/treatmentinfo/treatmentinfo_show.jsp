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
					
					<form action="treatmentinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TREATMENTINFO_ID" id="TREATMENTINFO_ID" value="${pd.TREATMENTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">医院编码:</td>
								<td>
									<input type="text" name="ORG_CODE" class="col-sm-11 form-control" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="50" readonly="readonly" title="医院编码" style="width:98%;"/>
                                </td>

								<td style="width:120px;text-align: right;padding-top: 13px;">医院名称:</td>
                                <td>
									<input type="text" name="ORG_NAME" class="col-sm-11 form-control" id="ORG_NAME" value="${pd.ORG_NAME}" maxlength="50" readonly="readonly"  title="医院名称" style="width:98%;"/>
                                </td>
                            </tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生ID:</td>
								<td><input type="text" class="col-sm-11 form-control" name="PROVIDER_ID" id="PROVIDER_ID" value="${pd.PROVIDER_ID}" maxlength="50" title="就诊医生ID" style="width:98%;" readonly="readonly"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生姓名:</td>
								<td><input type="text" class="col-sm-11 form-control" name="PROVIDER_NAME" id="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" maxlength="50" title="就诊医生姓名" style="width:98%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生身份证:</td>
								<td><input type="text" class="col-sm-11 form-control" name="IDCARD" id="IDCARD" value="${pd.IDCARD}" maxlength="50" title="就诊医生身份证" style="width:98%;" readonly="readonly"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生手机号:</td>
								<td><input type="text" class="col-sm-11 form-control" name="TELECOM" id="TELECOM" value="${pd.TELECOM}" maxlength="100" title="就诊医生手机号" style="width:98%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者姓名:</td>
								<td><input type="text" class="col-sm-11 form-control" name="NAME" id="NAME" value="${pd.NAME}" maxlength="20" title="患者姓名" style="width:98%;" readonly="readonly"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<c:forEach items="${pd.enumSex}" var="entry">
										<c:if test="${entry.key == pd.SEX}">
											<input type="text" class="col-sm-11 form-control" name="SEX" id="SEX" value="${entry.value}" maxlength="20" title="性别" style="width:98%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">出生日期:</td>
								<td><input class="col-sm-11 form-control" name="BIRTHDAY" id="BIRTHDAY" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.BIRTHDAY}" />' type="text" data-date-format="yyyy-mm-dd" placeholder="出生日期" title="出生日期" style="width:98%;" readonly="readonly"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">家庭住址:</td>
								<td><input class="col-sm-11 form-control" type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="80" title="家庭住址" style="width:98%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者就诊卡卡号:</td>
								<td><input class="col-sm-11 form-control" type="text" name="VISITCARDNO" id="VISITCARDNO" value="${pd.VISITCARDNO}" maxlength="50" title="患者就诊卡卡号" style="width:98%;" readonly="readonly"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">患者健康卡卡号:</td>
								<td><input class="col-sm-11 form-control" type="text" name="HEADTHCARDNO" id="HEADTHCARDNO" value="${pd.HEADTHCARDNO}" maxlength="50" title="患者健康卡卡号" style="width:98%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">参保类型:</td>
								<td>
									<c:forEach items="${pd.dictInsureType}" var="entry">
										<c:if test="${entry.value.ADDITIONAL == pd.INSURETYPE}">
											<input type="text" class="col-sm-11 form-control" name="INSURETYPE" id="INSURETYPE" value="${entry.value.NAME}" maxlength="20" title="参保类型" style="width:98%;" readonly="readonly"/>
										</c:if>
									</c:forEach>
								</td>

								<td style="width:120px;text-align: right;padding-top: 13px;">参保卡号:</td>
								<td><input class="col-sm-11 form-control" type="text" name="INSURENO" id="INSURENO" value="${pd.INSURENO}" maxlength="50" title="参保卡号" style="width:98%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者联系电话:</td>
								<td><input class="col-sm-11 form-control" type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="20" title="患者联系电话" style="width:98%;" readonly="readonly"/></td>

                                <td style="width:120px;text-align: right;padding-top: 13px;">就诊时间:</td>
                                <td>
									<input class="col-sm-11 form-control" name="TREATMENT_TIME" id="TREATMENT_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.TREATMENT_TIME}" />' type="text" data-date-format="yyyy-mm-dd" title="就诊时间" style="width: 98%" readonly="readonly"/>
								</td>
							</tr>

							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">疾病编码:</td>
								<td>
									<input type="text" name="DISEASE_CODE" class="col-sm-11 form-control" id="DISEASE_CODE" value="${pd.DISEASE_CODE}" maxlength="50" readonly="readonly" title="疾病编码" style="width:98%;">
								</td>

                                <td style="width:120px;text-align: right;padding-top: 13px;">疾病名称:</td>
                                <td>
									<input type="text" name="DISEASE_NAME" class="col-sm-11 form-control" id="DISEASE_NAME" value="${pd.DISEASE_NAME}" maxlength="50" readonly="readonly" title="疾病名称" style="width:98%;"/>
								</td>
                            </tr>

                            <tr>
                                <td style="width:120px;text-align: right;vertical-align: middle">病情摘要:</td>
                                <td colspan="3" style="text-align: left">
									<textarea class="col-sm-11 form-control" name="ILLDESC" id="ILLDESC" title="病情摘要" style="width:99%;" readonly="readonly" dir="ltr">
										${pd.ILLDESC}
									</textarea>
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
		</script>
</body>
</html>