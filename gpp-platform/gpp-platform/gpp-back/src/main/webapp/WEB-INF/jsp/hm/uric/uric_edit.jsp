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
<!-- 血压新增页面 -->
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
						<form action="uric/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
			                     <div class="widget-header">
			                           <h5 class="widget-title">尿酸记录</h5>
			                               <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                      </span>
	                             </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="USER_AGENT_ID">居民ID</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<input readonly="readonly" type="text" name="USER_AGENT_ID" id="USER_AGENT_ID" value="${pd.USER_AGENT_ID }" placeholder="居民ID" title="居民ID" style="width:98%;"  />
                                                   </span>
                                               </div>
                                           </div>
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="URIC_ACID">尿酸值:</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<input type="number" step="0.0001" name="URIC_ACID" id="URIC_ACID"  value="${pd.URIC_ACID }" placeholder="请输入尿酸值"  title="尿酸值"  style="width:98%;" />
                                                   </span>
                                               </div>
                                           </div>
                                  	</div>
                                  	<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="TEST_TIME">测试时间:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input readonly="readonly" class="span10 date-picker" type="text" name="TEST_TIME" id="TEST_TIME" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${pd.TEST_TIME }"/>" placeholder="测试时间" title="测试时间"  style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CREAT_TIME ">生成时间:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input readonly="readonly" type="text" name="CREAT_TIME" id="CREAT_TIME" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${pd.CREAT_TIME }"/>" placeholder="生成时间" title="生成时间" onblur="yanQ();" style="width:98%;" />
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
	//验证身份证正则表达式
	function isSfzh(sfzh){
		return(new RegExp(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/).test(sfzh));
	}
	
	//验证邮箱正则表达式
	function isEmail(email){
		return(new RegExp(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email));
	}
	
	//验证手机号正则表达式
	function isTel(telephone){
		return(new RegExp(/^(13[0-9]{9})|(14[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/).test(telephone));
	}
	
	//验证QQ号正则表达式
	function isQQ(qqaccount){
		return(new RegExp(/^\d{5,10}$/).test(qqaccount));
	}
	
	//验证邮编正则表达式
	function isPostcode(postcode){
		return(new RegExp(/^\d{6}$/).test(postcode));
	}
	
	//验证身高,体重
	function isHEIGHT(height){
		return(new RegExp(/^[0-9]{2,3}$/).test(height));
	}
	
	//验证邮箱格式
	function yanE(){
		if(!isEmail($("#EMAIL").val()) && $("#EMAIL").val() != ""){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").val("");
			return false;
		}
	}
	
	//验证电话号码号格式
	function yanT(){
		if(!isTel($("#TELEPHONE").val()) && $("#TELEPHONE").val() != ""){
			$("#TELEPHONE").tips({
				side:3,
	            msg:'手机号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TELEPHONE").val("");
			return false;
		}
	}
	
	//验证QQ格式
	function yanQ(){
		if(!isQQ($("#QQACCOUNT").val()) && $("#QQACCOUNT").val() !=""){
			$("#QQACCOUNT").tips({
				side:3,
	            msg:'QQ号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QQACCOUNT").val("");
			return false;
		}
	}
	
	//验证邮编格式
	function yanP(){
		if(!isPostcode($("#POSTCODE").val()) && $("#POSTCODE").val() !=""){
			$("#POSTCODE").tips({
				side:3,
	            msg:'邮政编码格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#POSTCODE").val("");
			return false;
		}
	}
	
	//验证身高
	function yanHEIGHT(){
		if(!isHEIGHT($("#HEIGHT").val()) && $("#HEIGHT").val() !=""){
			$("#HEIGHT").tips({
				side:3,
	            msg:'身高值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEIGHT").val("");
			return false;
		}
	}
	
	//验证体重
	function yanWEIGHT(){
		if(!isHEIGHT($("#WEIGHT").val()) && $("#WEIGHT").val() !=""){
			$("#WEIGHT").tips({
				side:3,
	            msg:'体重值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#WEIGHT").val("");
			return false;
		}
	}
	
	//保存
	function save(){
		if($("#URIC_ACID").val()==""){
			$("#URIC_ACID").tips({
				side:3,
	            msg:'请输入尿酸值',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#URIC_ACID").focus();
			return false;
		} else {
			$("#URIC_ACID").val($.trim($("#URIC_ACID").val()));
		}
		
		if($("#TEST_TIME").val()==""){
			$("#TEST_TIME").tips({
				side:3,
	            msg:'请输入测试时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TEST_TIME").focus();
			return false;
		}else{
			$("#TEST_TIME").val($.trim($("#TEST_TIME").val()));
		}	
		
		
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//判断医保卡号是否存在
	function hasM(){
		var MI_CARD = $("#MI_CARD").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasM.do',
	    	data: {MI_CARD:MI_CARD,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#MI_CARD").tips({
							side:3,
				            msg:'医保卡号'+MI_CARD+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#MI_CARD').val('');
				 }
			}
		});
	}
	
	//判断身份证号是否存在
	function hasI(){
		var ID_NUMBER = $("#ID_NUMBER").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasI.do',
	    	data: {ID_NUMBER:ID_NUMBER,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#ID_NUMBER").tips({
							side:3,
				            msg:'身份证'+ID_NUMBER+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#ID_NUMBER').val('');
				 }
			}
		});
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