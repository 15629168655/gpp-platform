<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
%>

<!DOCTYPE html>
<!-- 指标组合范围编辑与添加 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
 <link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
 <link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
						<form action="indexResidentQuse/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="RESIDENT_ID">居民姓名:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            <c:if test="${pd.IS_FINISH != 1 }">
                                            	<input readonly="readonly" type="text" name="RESIDENT_NAME" id="RESIDENT_NAME" value="${pd.RESIDENT_NAME }" placeholder="点击选择居民" title="居民姓名" style="width:98%;" onclick="chosePerson()"/>
                                            	<input readonly="readonly" type="hidden" name="RESIDENT_ID" id="RESIDENT_ID" value="${pd.RESIDENT_ID }" placeholder="请输入居民ID" title="居民ID" style="width:98%;" onclick="chosePerson()"/>
                                          	</c:if>
                                          	<c:if test="${pd.IS_FINISH == 1 }">
                                            	<input readonly="readonly" type="text" name="RESIDENT_NAME" id="RESIDENT_NAME" value="${pd.RESIDENT_NAME }" placeholder="点击选择居民" title="居民姓名" style="width:98%;" />
                                            	<input readonly="readonly" type="hidden" name="RESIDENT_ID" id="RESIDENT_ID" value="${pd.RESIDENT_ID }" placeholder="请输入居民ID" title="居民ID" style="width:98%;" />
                                          	</c:if>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="SCREENING_QUESTIONNAIRE_ID">筛查问卷ID:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<c:if test="${pd.IS_FINISH != 1 }">
                                            		<input readonly="readonly" type="text" name="SCREENING_QUESTIONNAIRE_NAME" id="SCREENING_QUESTIONNAIRE_NAME" value="${pd.SCREENING_QUESTIONNAIRE_NAME }" placeholder="请输入筛查问卷名称" title="筛查问卷名称" style="width:98%;" onclick="choseScreeing()"/>	
                                            		<input readonly="readonly" type="hidden" name="SCREENING_QUESTIONNAIRE_ID" id="SCREENING_QUESTIONNAIRE_ID" value="${pd.SCREENING_QUESTIONNAIRE_ID }" placeholder="请输入筛查问卷ID" title="筛查问卷ID" style="width:98%;" onclick="choseScreeing()"/>	
                                            	</c:if>
                                            	<c:if test="${pd.IS_FINISH == 1 }">
                                            		<input readonly="readonly" type="text" name="SCREENING_QUESTIONNAIRE_NAME" id="SCREENING_QUESTIONNAIRE_NAME" value="${pd.SCREENING_QUESTIONNAIRE_NAME }" placeholder="请输入筛查问卷名称" title="筛查问卷名称" style="width:98%;"/>	
                                            		<input readonly="readonly" type="hidden" name="SCREENING_QUESTIONNAIRE_ID" id="SCREENING_QUESTIONNAIRE_ID" value="${pd.SCREENING_QUESTIONNAIRE_ID }" placeholder="请输入筛查问卷ID" title="筛查问卷ID" style="width:98%;" />	
                                            	</c:if>
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="SCREENING_TIME">筛查时间:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input readonly="readonly" class="span10 date-picker" type="text" name="SCREENING_TIME" id="SCREENING_TIME" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.SCREENING_TIME }"/>"  placeholder="请输入显示排序筛查时间" title="筛查时间:" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="COMPANY">单位:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="hidden" id="COMPANY_ID" name="COMPANY_ID" value="${pd.COMPANY_ID }"/>
                                            	<input type="text" readonly="readonly" name="QUESTIONNAIRE_COMPANY" id="COMPANY"  value="${pd.QUESTIONNAIRE_COMPANY }" placeholder="请输入单位"  title="单位"  style="width:98%;"/>
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_DEPARTMENT">科室:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="text" readonly="readonly" name="QUESTIONNAIRE_DEPARTMENT" id="ksmc" value="${pd.QUESTIONNAIRE_DEPARTMENT }" placeholder="请输入科室" title="科室" style="width:98%;" onclick="chooseDepart()" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                    <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_PEOPLE">问卷人:</label>
                                     <div class="col-sm-8">
                                         <span  class="col-sm-12 from-control-span">
                                         	<input type="text" readonly="readonly" name="QUESTIONNAIRE_PEOPLE" id="QUESTIONNAIRE_PEOPLE" value="${pd.QUESTIONNAIRE_PEOPLE }" placeholder="请输入问卷人" title="问卷人" style="width:98%;" onclick="docDate()" />
                                         </span>
                                     </div>
                                     </div>
                           	</div>
                           		<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_RESULT">结果:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<textarea rows="5" cols="29"   id = "QUESTIONNAIRE_RESULT" name = "QUESTIONNAIRE_RESULT">${pd.QUESTIONNAIRE_RESULT }</textarea>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_SUGGESTION">建议:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<textarea rows="5" cols="29"  id = "QUESTIONNAIRE_SUGGESTION" name = "QUESTIONNAIRE_SUGGESTION" >${pd.QUESTIONNAIRE_SUGGESTION }</textarea>
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           		<div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
						   <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</div>
						</div>
						</div>
					</form>
				</div>
						
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
				<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			    </a>
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
		<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
    <!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDialog.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());

	//保存
	function save(){
		if($("#RESIDENT_ID").val()==""){
			$("#RESIDENT_ID").tips({
				side:3,
	            msg:'请输入居民ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESIDENT_ID").focus();
			return false;
		} else {
			$("#RESIDENT_ID").val($.trim($("#RESIDENT_ID").val()));
		}
		
		if($("#SCREENING_QUESTIONNAIRE_ID").val()==""){
			$("#SCREENING_QUESTIONNAIRE_ID").tips({
				side:3,
	            msg:'请选择筛选问卷ID',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#SCREENING_QUESTIONNAIRE_ID").focus();
			return false;
		}else{
			$("#SCREENING_QUESTIONNAIRE_ID").val($.trim($("#SCREENING_QUESTIONNAIRE_ID").val()));
		}	
		if($("#QUESTIONNAIRE_DEPARTMENT").val()==""){
			$("#QUESTIONNAIRE_DEPARTMENT").tips({
				side:3,
	            msg:'请选择科室',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_DEPARTMENT").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_DEPARTMENT").val($.trim($("#QUESTIONNAIRE_DEPARTMENT").val()));
		}
		if($("#SCREENING_TIME").val()==""){
			$("#SCREENING_TIME").tips({
				side:3,
	            msg:'请选择筛选时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#SCREENING_TIME").focus();
			return false;
		}else{
			$("#SCREENING_TIME").val($.trim($("#SCREENING_TIME").val()));
		}
		if($("#QUESTIONNAIRE_RESULT").val()==""){
			$("#QUESTIONNAIRE_RESULT").tips({
				side:3,
	            msg:'请输入结果',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_RESULT").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_RESULT").val($.trim($("#QUESTIONNAIRE_RESULT").val()));
		}
		
		if($("#QUESTIONNAIRE_COMPANY").val()==""){
			$("#QUESTIONNAIRE_COMPANY").tips({
				side:3,
	            msg:'请选择单位',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_COMPANY").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_COMPANY").val($.trim($("#QUESTIONNAIRE_COMPANY").val()));
		}
		if($("#QUESTIONNAIRE_SUGGESTION").val()==""){
			$("#QUESTIONNAIRE_SUGGESTION").tips({
				side:3,
	            msg:'请输入建议',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_SUGGESTION").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_SUGGESTION").val($.trim($("#QUESTIONNAIRE_SUGGESTION").val()));
		}
		if($("#QUESTIONNAIRE_PEOPLE").val()==""){
			$("#QUESTIONNAIRE_PEOPLE").tips({
				side:3,
	            msg:'请选择问卷人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_PEOPLE").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_PEOPLE").val($.trim($("#QUESTIONNAIRE_PEOPLE").val()));
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}
	//居民列表
	function chosePerson(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民列表";
		 diag.URL = '<%=basePath%>indexCommonChose/getJMXX.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
            	var MEMBER_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
            	var name = diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value;
            	if(MEMBER_ID!=''){
                	$("#RESIDENT_ID").val(MEMBER_ID);
                	$("#RESIDENT_NAME").val(name);
                	diag.close();
            	}
         };
		 diag.show();
	}
	//choseScreeing
	function choseScreeing(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "筛选问卷列表";
		 diag.URL = '<%=basePath%>indexCommonChose/getScreening.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
            	var MEMBER_ID = diag.innerFrame.contentWindow.document.getElementById('ID').value;
            	var name = diag.innerFrame.contentWindow.document.getElementById('NAME').value;
            	if(MEMBER_ID!=''){
                	$("#SCREENING_QUESTIONNAIRE_ID").val(MEMBER_ID);
                	$("#SCREENING_QUESTIONNAIRE_NAME").val(name);
                	diag.close();
            	}
         };
		 diag.show();
	}
	//机构菜单
	function chooseCompany(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "机构菜单";
		 diag.URL = '<%=basePath%>indexCommonChose/getCompanyData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
         	diag.close();
		 };
		 diag.show();
	}
	//科室菜单
	function chooseDepart(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "科室菜菜单";
		 diag.URL = '<%=basePath%>autoRegister/getDepartData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
         	diag.close();
		 };
		 diag.show();
	}
	//医生列表
	function docDate(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "医生列表";
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
            	var GEN_PRACTITIONER_ID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
            	if(GEN_PRACTITIONER_ID!=''){
            		$("#GEN_PRACTITIONER_ID").val(GEN_PRACTITIONER_ID);
            		$("#GEN_PRACTITIONER_ID").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value);
            		$("#GEN_PRACTITIONER_CODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
                	$("#QUESTIONNAIRE_PEOPLE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
                	$("#GEN_PRACTITIONER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
                	$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
                	diag.close();
            	}
         };
		 diag.show();
	}
	
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD'
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	
});
</script>
</html>	
	
	
	
	