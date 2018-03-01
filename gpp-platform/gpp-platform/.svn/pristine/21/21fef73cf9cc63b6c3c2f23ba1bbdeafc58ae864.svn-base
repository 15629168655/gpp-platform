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
						<form action="indexScreeningQues/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
	                              	
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_NAME">名称:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="QUESTIONNAIRE_NAME" id="QUESTIONNAIRE_NAME" value="${pd.QUESTIONNAIRE_NAME }" placeholder="请输入名称" title="名称" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_COMBINATION_NAME">类型(慢病类型):</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<select class="form-control" id="CHRONIC_DISEASE_TYPE" name="CHRONIC_DISEASE_TYPE" style="width:98%;">
									               		<option value="" selected >--请选择--</option>
                                                        <c:forEach items="${CHROICDISEASETYPE}" var="item">
                                                             <option value="${item.value.ADDITIONAL}" <c:if test="${pd.CHRONIC_DISEASE_TYPE == item.value.ADDITIONAL}"> selected="selected" </c:if> >${item.value.NAME}</option>
                                                        </c:forEach>
                                           		  </select>
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_ORDER">显示排序:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="number" name="QUESTIONNAIRE_ORDER" id="QUESTIONNAIRE_ORDER" value="${pd.QUESTIONNAIRE_ORDER }" placeholder="请输入显示排序" title="显示排序" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="COMPANY">单位:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="hidden" id="COMPANY_ID" name="COMPANY_ID" value="${pd.COMPANY_ID }"/>
                                            	<input type="text" name="COMPANY" id="COMPANY"  value="${pd.COMPANY }" placeholder="请输入单位"  title="单位"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="DEPARTMENT">科室:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="hidden"  name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID }" placeholder="请输入科室" title="科室" style="width:98%;" />
                                            	<input type="text"  name="DEPARTMENT" id="DEPARTMENT" value="${pd.DEPARTMENT }" placeholder="请输入科室" title="科室" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                    <label class="col-sm-4 control-label no-padding-right" for="FIT_SEX">适合的性别:</label>
                                     <div class="col-sm-8">
                                         <span  class="col-sm-12 from-control-span">
                                          <select class="form-control"  name="FIT_SEX" id="FIT_SEX" style="width:98%">
										         <option value="" selected="selected">--请选择--</option>
										         <c:forEach items="${FITSEX}" var="tw">
		                                               <option value="${tw.key}" <c:if test="${tw.key == pd.FIT_SEX}"> selected="selected" </c:if> >${tw.value}</option>
		                                          </c:forEach>
										    </select>
                                         </span>
                                     </div>
                                     </div>
                           	</div>
                           		<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="QUESTIONNAIRE_CODE">编码:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                          			<input type="text" name="QUESTIONNAIRE_CODE" id="QUESTIONNAIRE_CODE" value="${pd.QUESTIONNAIRE_CODE }" placeholder="请输入编码" title="编码" style="width:98%;" />
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
		if($("#QUESTIONNAIRE_CODE").val()==""){
			$("#QUESTIONNAIRE_CODE").tips({
				side:3,
	            msg:'请输入问卷编码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUESTIONNAIRE_CODE").focus();
			return false;
		} else {
			$("#QUESTIONNAIRE_CODE").val($.trim($("#QUESTIONNAIRE_CODE").val()));
		}
		
		if($("#QUESTIONNAIRE_CODE").val()==""){
			$("#QUESTIONNAIRE_CODE").tips({
				side:3,
	            msg:'请输入问卷名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_CODE").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_CODE").val($.trim($("#QUESTIONNAIRE_CODE").val()));
		}	
		if($("#DEPARTMENT").val()==""){
			$("#DEPARTMENT").tips({
				side:3,
	            msg:'请选择科室',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#DEPARTMENT").focus();
			return false;
		}else{
			$("#DEPARTMENT").val($.trim($("#DEPARTMENT").val()));
		}
		if($("#FIT_SEX").val()==""){
			$("#FIT_SEX").tips({
				side:3,
	            msg:'请选择是否限制性别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIT_SEX").focus();
			return false;
		}else{
			$("#FIT_SEX").val($.trim($("#FIT_SEX").val()));
		}
		if($("#CHRONIC_DISEASE_TYPE").val()==""){
			$("#CHRONIC_DISEASE_TYPE").tips({
				side:3,
	            msg:'请选择类型(慢病)',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#CHRONIC_DISEASE_TYPE").focus();
			return false;
		}else{
			$("#CHRONIC_DISEASE_TYPE").val($.trim($("#CHRONIC_DISEASE_TYPE").val()));
		}
		
		if($("#COMPANY").val()==""){
			$("#COMPANY").tips({
				side:3,
	            msg:'请输入单位',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#COMPANY").focus();
			return false;
		}else{
			$("#COMPANY").val($.trim($("#COMPANY").val()));
		}
		if($("#QUESTIONNAIRE_ORDER").val()==""){
			$("#QUESTIONNAIRE_ORDER").tips({
				side:3,
	            msg:'请输入拼音编码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUESTIONNAIRE_ORDER").focus();
			return false;
		}else{
			$("#QUESTIONNAIRE_ORDER").val($.trim($("#QUESTIONNAIRE_ORDER").val()));
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
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
		 diag.SaveEvent = function() {//保存事件
			 var id = diag.innerFrame.contentWindow.document.getElementById('COMPANY_ID').value;
		     var name = diag.innerFrame.contentWindow.document.getElementById('COMPANY_NAME').value; 
		     $("#COMPANY_ID").val(id);
		     $("#COMPANY").val(name);
		     diag.close();
		 }
		diag.show();
	}
	//科室菜单
	function chooseDepart(){
		 var ORG_CODE= $("#COMPANY_ID").val();
		 if(ORG_CODE) {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "科室菜单";
			 diag.URL = '<%=basePath%>indexCommonChose/getDepartData.do?ORG_CODE='+ORG_CODE;
			 diag.Width = 320;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
	         	diag.close();
			 };
			
			 diag.SaveEvent = function() {//保存事件
				 var id = diag.innerFrame.contentWindow.document.getElementById('ID').value;
			     var name = diag.innerFrame.contentWindow.document.getElementById('NAME').value; 
			     $("#DEPARTMENT_ID").val(id);
			     $("#DEPARTMENT").val(name);
			 }
			 diag.show(); 
		 }
		 else {
			 alert("请先选择单位");
				$("#COMPANY").tips({
					side:3,
		            msg:'请输入单位',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#COMPANY").focus();
		 }	 

		 
	}
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	
});
</script>
</html>