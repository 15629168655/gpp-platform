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
<!-- 指标信息的编辑与添加 -->
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
						<form action="indexmanager/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
	                              <div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_NAME">指标名称:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="INDEX_NAME" id="INDEX_NAME" value="${pd.INDEX_NAME }" placeholder="请输入指标名称" title="指标名称" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_CODE">指标编码:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="INDEX_CODE" id="INDEX_CODE"  value="${pd.INDEX_CODE }" placeholder="输入指标编码"  title="指标编码" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="PY_CODE">拼音编码:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="PY_CODE" id="PY_CODE" value="${pd.PY_CODE }" placeholder="请输入拼音编码" title="拼音编码" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_ORDER">排序号:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="number" name="INDEX_ORDER" id="MI_CARD"  value="${pd.INDEX_ORDER }" placeholder="请输入排序号"  title="排序号"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="DEPARTMENT">科室:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="DEPARTMENT" id="DEPARTMENT" value="${pd.DEPARTMENT }" placeholder="请输入检验科室" title="检验科室" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="TEST_DEPARTMENT">检验科室:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="TEST_DEPARTMENT" id="TEST_DEPARTMENT"  value="${pd.TEST_DEPARTMENT}" placeholder="请输入检验科室"  title="检验科室"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	   	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="NORMAL_RESULT">正常结果:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="NORMAL_RESULT" id="NORMAL_RESULT" value="${pd.NORMAL_RESULT }" placeholder="请输入正常结果" title="正常结果" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_COMPANY">单位:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="text" name="INDEX_COMPANY" id="INDEX_COMPANY"  value="${pd.INDEX_COMPANY }" placeholder="请输入单位"  title="单位"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="SCREENING_INDEX">筛查类型:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<select class="form-control" id="SCREENING_INDEX" name="SCREENING_INDEX" style="width:98%;">
									               <option value="" selected >--请选择--</option>
                                                        <c:forEach items="${SCREENTYPE}" var="item">
                                                             <option value="${item.value.ADDITIONAL}" <c:if test="${pd.SCREENING_INDEX == item.value.ADDITIONAL}"> selected="selected" </c:if> >${item.value.NAME}</option>
                                                        </c:forEach>
                                           		  </select>
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
                                        <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">结果类型:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<select class="form-control"  name="RESULT_TYPE" id="RESULT_TYPE" style="width:98%">
											         <option value="" selected="selected">--请选择--</option>
											         <c:forEach items="${RESULTTYPE}" var="tw">
		                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.RESULT_TYPE}"> selected="selected" </c:if> >${tw.value}</option>
		                                             </c:forEach>
											    </select>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="RESULT_MODEL">模板选择:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<select class="form-control"  name="RESULT_MODEL" id="RESULT_MODEL" style="width:98%">
											         <option value="" selected="selected">--请选择--</option>
											         <c:forEach items="${MODELSELECT}" var="tw">
		                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.RESULT_MODEL}"> selected="selected" </c:if> >${tw.value}</option>
		                                             </c:forEach>
											    </select>
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           		<div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="concle()">取消</a>
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
	<!-- 颜色控件 -->
	
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	//保存信息
	function save(){
		if($("#INDEX_NAME").val()==""){
			$("#INDEX_NAME").tips({
				side:3,
	            msg:'请输入指标名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INDEX_NAME").focus();
			return false;
		} else {
			$("#INDEX_NAME").val($.trim($("#INDEX_NAME").val()));
		}
		
		if($("#INDEX_CODE").val()==""){
			$("#INDEX_CODE").tips({
				side:3,
	            msg:'请输入指标编码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INDEX_CODE").focus();
			return false;
		}else{
			$("#INDEX_CODE").val($.trim($("#INDEX_CODE").val()));
		}
		
		if($("#PY_CODE").val()==""){
			$("#INDEX_CODE").tips({
				side:3,
	            msg:'请输入指标拼音',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PY_CODE").focus();
			return false;
		}else{
			$("#PY_CODE").val($.trim($("#PY_CODE").val()));
		}
		if($("#INDEX_ORDER").val()==""){
			$("#INDEX_ORDER").tips({
				side:3,
	            msg:'请输入指标排序',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INDEX_ORDER").focus();
			return false;
		}else{
			$("#INDEX_ORDER").val($.trim($("#INDEX_ORDER").val()));
		}
		
		if($("#DEPARTMENT").val()==""){
			$("#DEPARTMENT").tips({
				side:3,
	            msg:'请输入科室',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#DEPARTMENT").focus();
			return false;
		}else{
			$("#DEPARTMENT").val($.trim($("#DEPARTMENT").val()));
		}
		
		if($("#TEST_DEPARTMENT").val()==""){
			$("#TEST_DEPARTMENT").tips({
				side:3,
	            msg:'请输入测试科室',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TEST_DEPARTMENT").focus();
			return false;
		}else{
			$("#TEST_DEPARTMENT").val($.trim($("#TEST_DEPARTMENT").val()));
		}
		
		if($("#NORMAL_RESULT").val()==""){
			$("#NORMAL_RESULT").tips({
				side:3,
	            msg:'请输入正常结果',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NORMAL_RESULT").focus();
			return false;
		}else{
			$("#NORMAL_RESULT").val($.trim($("#NORMAL_RESULT").val()));
		}

		if($("#INDEX_COMPANY").val()==""){
			$("#INDEX_COMPANY").tips({
				side:3,
	            msg:'请输入单位',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INDEX_COMPANY").focus();
			return false;
		}else{
			$("#INDEX_COMPANY").val($.trim($("#INDEX_COMPANY").val()));
		}
		
		if($("#SCREENING_INDEX").val()==""){
			$("#SCREENING_INDEX").tips({
				side:3,
	            msg:'请输入筛选类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#SCREENING_INDEX").focus();
			return false;
		}else{
			$("#SCREENING_INDEX").val($.trim($("#SCREENING_INDEX").val()));
		}
		
		if($("#FITSEX").val()==""){
			$("#FITSEX").tips({
				side:3,
	            msg:'请输入适用的性别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FITSEX").focus();
			return false;
		}else{
			$("#FITSEX").val($.trim($("#FITSEX").val()));
		}
		
		if($("#RESULT_MODEL").val()==""){
			$("#RESULT_MODEL").tips({
				side:3,
	            msg:'请输入模板类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#RESULT_MODEL").focus();
			return false;
		}else{
			$("#RESULT_MODEL").val($.trim($("#RESULT_MODEL").val()));
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}
	
	function concle() {
		top.jzts();
		window.location.href="<%=basePath%>indexmanager/list.do";
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