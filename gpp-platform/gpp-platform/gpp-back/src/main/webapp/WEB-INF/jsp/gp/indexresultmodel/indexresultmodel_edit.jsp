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
						<form action="indexResultModel/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" readonly="readonly" name="INDEX_ID" id="INDEX_ID" value="${pd.INDEX_ID }" placeholder="请输入ID" title="指标ID" style="width:98%;" />
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
                           	<div class="form-group">
                                     <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="MODEL_SCORE">模板评分:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input max="10" min="0" type="number" name="MODEL_SCORE" id="MODEL_SCORE"  value="${pd.MODEL_SCORE }" placeholder="请输入模板评分"  title="模板评分" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="MODEL_ORDER">排序号:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                         		<input type="number" min="0" name="MODEL_ORDER" id="MODEL_ORDER"  value="${pd.MODEL_ORDER }" placeholder="请输入排序号"  title="排序号"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="DISEASE_ID">疾病名称:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="hidden" readonly="readonly" name="DISEASE_ID" id="DISEASE_ID" value="${pd.DISEASE_ID }" onclick="choosejb();" placeholder="请输入疾病ID" title="疾病ID" style="width:98%;" />
                                            	<input type="text" readonly="readonly" name="DISEASE_NAME" id="DISEASE_NAME" value="${pd.DISEASE_NAME }" onclick="choo()();" placeholder="请输入疾病" title="疾病" style="width:98%;"  />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="MESSAGE_CONTENT">提示内容:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="MESSAGE_CONTENT" id="MESSAGE_CONTENT"  value="${pd.MESSAGE_CONTENT}" placeholder="请输入提示内容"  title="提示内容"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="IS_POSITIVE">是否呈阳性:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<select class="form-control" id="IS_POSITIVE" name="IS_POSITIVE" style="width:98%;" onchange="cl()">
									              <option value="" selected="selected">--请选择--</option>
											         <c:forEach items="${ISPOSITIVE}" var="tw">
		                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.IS_POSITIVE}"> selected="selected" </c:if> >${tw.value}</option>
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
                                        <label class="col-sm-4 control-label no-padding-right" for="MODEL_CONTENT">模板内容:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<textarea rows="5" cols="29"   id = "MODEL_CONTENT" name = "MODEL_CONTENT">${pd.MODEL_CONTENT }</textarea>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="DIAGNOSIS_DISCRIBE">诊断描述:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                           		<textarea rows="5" cols="29"  id = "DIAGNOSIS_DISCRIBE" name = "DIAGNOSIS_DISCRIBE" >${pd.DIAGNOSIS_DISCRIBE }</textarea>
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
		if($("#MODEL_CONTENT").val()==""){
			$("#MODEL_CONTENT").tips({
				side:3,
	            msg:'请输入模板内容',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MODEL_CONTENT").focus();
			return false;
		} else {
			$("#MODEL_CONTENT").val($.trim($("#MODEL_CONTENT").val()));
		}
		if($("#MODEL_ORDER").val()==""){
			$("#MODEL_ORDER").tips({
				side:3,
	            msg:'请输入模板排序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MODEL_ORDER").focus();
			return false;
		} else {
			$("#MODEL_ORDER").val($.trim($("#MODEL_ORDER").val()));
		}
		if($("#IS_POSITIVE").val()==""){
			$("#IS_POSITIVE").tips({
				side:3,
	            msg:'请选择是否呈阳性',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#IS_POSITIVE").focus();
			return false;
		}else{
			$("#IS_POSITIVE").val($.trim($("#IS_POSITIVE").val()));
		}	
		if($("#FIT_SEX").val()==""){
			$("#FIT_SEX").tips({
				side:3,
	            msg:'请选择适用的类别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIT_SEX").focus();
			return false;
		}else{
			$("#FIT_SEX").val($.trim($("#FIT_SEX").val()));
		}
		if($("#MESSAGE_CONTENT").val()==""){
			$("#MESSAGE_CONTENT").tips({
				side:3,
	            msg:'请输入提示内容',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MESSAGE_CONTENT").focus();
			return false;
		} else {
			$("#MESSAGE_CONTENT").val($.trim($("#MESSAGE_CONTENT").val()));
		}
		
		if($("#DIAGNOSIS_DISCRIBE").val()==""){
			$("#DIAGNOSIS_DISCRIBE").tips({
				side:3,
	            msg:'请输入诊断描述',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#DIAGNOSIS_DISCRIBE").focus();
			return false;
		}else{
			$("#DIAGNOSIS_DISCRIBE").val($.trim($("#DIAGNOSIS_DISCRIBE").val()));
		}	
		if($("#RESULT_MODEL_STATE").val()==""){
			$("#RESULT_MODEL_STATE").tips({
				side:3,
	            msg:'请输入模板状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESULT_MODEL_STATE").focus();
			return false;
		} else {
			$("#RESULT_MODEL_STATE").val($.trim($("#RESULT_MODEL_STATE").val()));
		}
		
		if($("#MODEL_SCORE").val()==""){
			$("#MODEL_SCORE").tips({
				side:3,
	            msg:'请输入模板名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#MODEL_SCORE").focus();
			return false;
		}else{
			$("#MODEL_SCORE").val($.trim($("#MODEL_SCORE").val()));
		}	
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//选择是否呈阳性控制疾病选项
	function cl() {
		$("#DISEASE_ID").val("");//清空疾病编码
		$("#DISEASE_NAME").val("");//清空疾病名称
		//判断选择是否呈阳性
		if($("#IS_POSITIVE").val() == 1) {
			$("#DISEASE_NAME").removeAttr("onclick");
			$("#DISEASE_NAME").attr("onclick","choosejb();");
		}
		else {
			$("#DISEASE_NAME").removeAttr("onclick");
			$("#DISEASE_NAME").attr("onclick","mes();");
		}
	}
	//不能选择疾病提示
	function mes() {
		$("#DISEASE_NAME").tips({
			side:3,
            msg:'呈阳性可选择',
            bg:'#AE81FF',
            time:3
        });
		$("#DISEASE_NAME").focus();
	}
	//暂时不能选择疾病的提示
	function choo() {
		$("#IS_POSITIVE").tips({
			side:3,
            msg:'请选择是否呈阳性,呈阳性选择',
            bg:'#AE81FF',
            time:3
        });
		$("#IS_POSITIVE").focus();
	}
	function choosejb(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "疾病列表";
		 diag.URL = '<%=basePath%>kcf/jbzd_list.do';
		 diag.Width = 800;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
				var id = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
				var name = diag.innerFrame.contentWindow.document.getElementById('JBMC').value;
				if(id !=''){
					$("#DISEASE_ID").val(id);
					$("#DISEASE_NAME").val(name);
				}
				diag.close();
		  };
		 diag.show();
	}	
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		if($("#IS_POSITIVE").val() == 1) {
			$("#DISEASE_NAME").removeAttr("onclick");
			$("#DISEASE_NAME").attr("onclick","choosejb();");
		}
	
});
</script>
</html>