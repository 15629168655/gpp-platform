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
						<input type="hidden" name="INCLUDED_TIME" id="INCLUDED_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.INCLUDED_TIME}" />'/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">医院编码:</td>
								<td>
                                    <div class="input-group col-xs-12" style="width:98%;">
                                        <input type="text" name="ORG_CODE" class="col-sm-11 form-control" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="50" readonly="readonly" placeholder="请选择医院编码" title="医院编码" style="background-color: #ffffff !important;cursor: pointer"/>
                                        <span class="input-group-addon" id="orgcode" style="cursor:pointer;">
                                        <i class="fa fa-flag"></i>
                                        </span>
                                    </div>
                                </td>

								<td style="width:120px;text-align: right;padding-top: 13px;">医院名称:</td>
                                <td>
                                    <div class="input-group col-xs-12" style="width:98%;">
                                        <input type="text" name="ORG_NAME" class="col-sm-11 form-control" id="ORG_NAME" value="${pd.ORG_NAME}" maxlength="50" readonly="readonly" placeholder="请选择医院名称" title="医院名称" style="background-color: #ffffff !important;cursor: pointer"/>
                                        <span class="input-group-addon" id="orgname" style="cursor:pointer;">
                                        <i class="fa fa-flag"></i>
                                        </span>
                                    </div>
                                </td>
                            </tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生ID:</td>
								<td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="PROVIDER_ID" class="col-sm-11 form-control" id="PROVIDER_ID" value="${pd.PROVIDER_ID}" maxlength="50" readonly="readonly" placeholder="请选择就诊医生ID" title="就诊医生ID" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="PROVIDER_ID_icon" style="cursor:pointer;">
                                        <i class="glyphicon glyphicon-user "></i>
                                        </span>
									</div>
								</td>

								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生姓名:</td>
								<td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="PROVIDER_NAME" class="col-sm-11 form-control" id="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" maxlength="50" readonly="readonly" placeholder="请选择就诊医生姓名" title="就诊医生姓名" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="PROVIDER_NAME_icon" style="cursor:pointer;">
                                        <i class="glyphicon glyphicon-user "></i>
                                        </span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生身份证:</td>
								<td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="IDCARD" class="col-sm-11 form-control" id="IDCARD" value="${pd.IDCARD}" maxlength="50" readonly="readonly" placeholder="请选择就诊医生身份证" title="就诊医生身份证" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="IDCARD_icon" style="cursor:pointer;">
                                        <i class="glyphicon glyphicon-user "></i>
                                        </span>
									</div>
								</td>

								<td style="width:120px;text-align: right;padding-top: 13px;">就诊医生手机号:</td>
								<td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="TELECOM" class="col-sm-11 form-control" id="TELECOM" value="${pd.TELECOM}" maxlength="50" readonly="readonly" placeholder="请选择就诊医生手机号" title="就诊医生手机号" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="TELECOM_icon" style="cursor:pointer;">
                                        <i class="glyphicon glyphicon-user "></i>
                                        </span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="20" placeholder="这里输入患者姓名" title="患者姓名" style="width:98%;"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<select class="form-control" id="SEX" name="SEX" style="width: 98%">
										<c:forEach items="${pd.enumSex}" var="item">
											<c:choose>
												<c:when test="${pd.SEX == item.key}">
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
								<td style="width:120px;text-align: right;padding-top: 13px;">出生日期:</td>
								<td>
									<div class="input-group col-xs-12"  style="width:98%;">
										<input class="col-sm-11 form-control date-picker" name="BIRTHDAY" id="BIRTHDAY" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.BIRTHDAY}" />' type="text" data-date-format="yyyy-mm-dd" placeholder="出生日期" title="出生日期" style="width: 100%"/>
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
									</div>
								</td>

								<td style="width:120px;text-align: right;padding-top: 13px;">家庭住址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="80" placeholder="这里输入家庭住址" title="家庭住址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者就诊卡卡号:</td>
								<td><input type="text" name="VISITCARDNO" id="VISITCARDNO" value="${pd.VISITCARDNO}" maxlength="50" placeholder="这里输入患者就诊卡卡号" title="患者就诊卡卡号" style="width:98%;"/></td>

								<td style="width:120px;text-align: right;padding-top: 13px;">患者健康卡卡号:</td>
								<td><input type="text" name="HEADTHCARDNO" id="HEADTHCARDNO" value="${pd.HEADTHCARDNO}" maxlength="50" placeholder="这里输入患者健康卡卡号" title="患者健康卡卡号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">参保类型:</td>
								<td>
									<select class="form-control" id="INSURETYPE" name="INSURETYPE" style="width: 98%">
                                          <option value="" <c:if test="${pd.INSURETYPE == '' }">selected</c:if> ></option>
                                              <c:forEach items="${pd.dictInsureType}" var="cblx">
                                                    <option value="${cblx.value.ADDITIONAL}" <c:if test="${pd.INSURETYPE == cblx.value.ADDITIONAL}"> selected="selected" </c:if> >${cblx.value.NAME}</option>
                                              </c:forEach> 
                                     </select>
								</td>

								<td style="width:120px;text-align: right;padding-top: 13px;">参保卡号:</td>
								<td><input type="text" name="INSURENO" id="INSURENO" value="${pd.INSURENO}" maxlength="50" placeholder="这里输入参保卡号" title="参保卡号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">患者联系电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="20" placeholder="这里输入患者联系电话" title="患者联系电话" style="width:98%;"/></td>

                                <td style="width:120px;text-align: right;padding-top: 13px;">就诊时间:</td>
                                <td>
									<div class="input-group col-xs-12"  style="width:98%;">
										<input class="col-sm-11 form-control date-picker" name="TREATMENT_TIME" id="TREATMENT_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.TREATMENT_TIME}" />' type="text" data-date-format="yyyy-mm-dd" placeholder="就诊时间" title="就诊时间" style="width: 100%"/>
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
									</div>
								</td>
							</tr>

							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">疾病编码:</td>
								<td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="DISEASE_CODE" class="col-sm-11 form-control" id="DISEASE_CODE" value="${pd.DISEASE_CODE}" maxlength="50" readonly="readonly" placeholder="请选择疾病编码" title="疾病编码" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="discode" style="cursor:pointer;">
                                        <i class="fa fa-leaf"></i>
                                        </span>
									</div>
								</td>

                                <td style="width:120px;text-align: right;padding-top: 13px;">疾病名称:</td>
                                <td>
									<div class="input-group col-xs-12" style="width:98%;">
										<input type="text" name="DISEASE_NAME" class="col-sm-11 form-control" id="DISEASE_NAME" value="${pd.DISEASE_NAME}" maxlength="50" readonly="readonly" placeholder="请选择疾病名称" title="疾病名称" style="background-color: #ffffff !important;cursor: pointer"/>
										<span class="input-group-addon" id="disname" style="cursor:pointer;">
                                        <i class="fa fa-leaf"></i>
                                        </span>
									</div>
								</td>
                            </tr>

                            <tr>
                                <td style="width:120px;text-align: right;vertical-align: middle">病情摘要:</td>
                                <td colspan="3">
									<textarea class="form-control limited" name="ILLDESC" rows="2" id="ILLDESC" maxlength="200" placeholder="这里输入病情摘要" title="病情摘要" style="width:99%;">
										${pd.ILLDESC}
									</textarea>
								</td>
                            </tr>

							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
    <script type="text/javascript" src="static/ace/js/bootbox.js"></script>
		<script type="text/javascript">
		$(top.hangge());

        //医院编码和医院名称输入框监听
		document.getElementById("ORG_CODE").onclick = chooseOrg;
		document.getElementById("ORG_NAME").onclick = chooseOrg;
		document.getElementById("orgcode").onclick = chooseOrg;
		document.getElementById("orgname").onclick = chooseOrg;

        //医生信息输入框监听
        document.getElementById("PROVIDER_ID").onclick = chooseDoc;
        document.getElementById("PROVIDER_NAME").onclick = chooseDoc;
        document.getElementById("IDCARD").onclick = chooseDoc;
        document.getElementById("TELECOM").onclick = chooseDoc;
        document.getElementById("PROVIDER_ID_icon").onclick = chooseDoc;
        document.getElementById("PROVIDER_NAME_icon").onclick = chooseDoc;
        document.getElementById("IDCARD_icon").onclick = chooseDoc;
        document.getElementById("TELECOM_icon").onclick = chooseDoc;

		//疾病编码和疾病名称输入框监听
		document.getElementById("DISEASE_CODE").onclick = chooseDis;
		document.getElementById("DISEASE_NAME").onclick = chooseDis;
		document.getElementById("discode").onclick = chooseDis;
		document.getElementById("disname").onclick = chooseDis;

        function chooseOrg(){
            top.jzts();
            var Title = "请选择医院";
            var diag = new top.Dialog();
            diag.Drag = true;
            diag.Title = Title;
            diag.URL = '<%=basePath%>/treatmentinfo/chooseOrg.do';
            diag.Width = 330;
            diag.Height = 450;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.show();
        }

        //选择医生
        function chooseDoc() {
            var ORG_CODE = $('#ORG_CODE').val();
            if (jQuery.isEmptyObject(ORG_CODE)) {
                bootbox.alert("请先选择医院", function() {

                });
                return;
            }
            else {
                top.jzts();
                var diag = new top.Dialog();
                diag.Drag = true;
                diag.Title = "选择医生";
                diag.URL = '<%=basePath%>treatmentinfo/chooseDoc.do?ORG_CODE=' + ORG_CODE;
                diag.Width = 900;
                diag.Height = 575;
                diag.CancelEvent = function () { //关闭事件
                    if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {

                    }
                    diag.close();
                };
                diag.show();
            }
        }

		//选择疾病编码
		function chooseDis(ORG_CODE){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="选择疾病";
			diag.URL = '<%=basePath%>treatmentinfo/chooseDis.do';
			diag.Width = 900;
			diag.Height = 575;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){

				}
				diag.close();
			};
			diag.show();
		}

        //保存
		function save() {
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if ($("#ORG_CODE").val() == "") {
				_msg = '请选择医院';
				selector = $("#ORG_CODE");
			}else if ($("#PROVIDER_ID").val() == "") {
				selector = $("#PROVIDER_ID");
				_msg = '请选择医生';
			}else if ($("#DISEASE_CODE").val() == "") {
				selector = $("#DISEASE_CODE");
				_msg = '请选择疾病';
			}else if ($("#NAME").val() == "") {
				selector = $("#NAME");
				_msg = '请输入患者姓名';
			}else if ($("#BIRTHDAY").val() != "" && new Date(Date.parse($("#BIRTHDAY").val() .replace(/-/g,"/"))) > new Date()) {
                selector = $("#BIRTHDAY");
                _msg = '患者出生日期不能大于今天';
            }else if ($("#PHONE").val() != "" && !(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#PHONE").val()))) {
                selector = $("#PHONE");
                _msg = '请输入正确的联系电话';
            }


			if(_msg != ''){
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});}
			else {
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>