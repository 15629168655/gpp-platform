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
								<form action="hospitalization/${msg }.do" name="hospitalizationForm" id="hospitalizationForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE }" title="机构编码" />
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
									  <tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">姓名<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="XM" id="XM" value="${pd.XM }" maxlength="20" placeholder="这里输入姓名" title="姓名" style="width:98%"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">性别<span style="color:red; font-size:14px">*</span></td>
											<td>
											     <select name="XB" id="XB" style="width:98%">
											         <option value="" selected="true" >请选择性别</option>
											         <option value="0" <c:if test="${pd.XB == '0' }">selected</c:if> >未知性别</option>
										             <option value="1" <c:if test="${pd.XB == '1' }">selected</c:if> >男</option>
										             <option value="2" <c:if test="${pd.XB == '2' }">selected</c:if> >女</option>
										             <option value="9" <c:if test="${pd.XB == '9' }">selected</c:if> >未说明性别</option>
											     </select>
											</td>
											
									   </tr>
									   
									   <tr>
									        <td style="width:150px;text-align: right;padding-top: 13px;">年龄<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="NL" id="NL" value="${pd.NL }" maxlength="20" placeholder="这里输入年龄" title="年龄" style="width:98%"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">医保IC卡号</td>
											<td><input type="text" name="ZJHM" id="ZJHM" value="${pd.ZJHM }" maxlength="32" placeholder="这里输入医保IC卡号" title="医保IC卡号" style="width:98%"/></td>
									        
									   </tr>
									   <tr>
									        <td style="width:150px;text-align: right;padding-top: 13px;">职业</td>
											<td><input type="text" name="ZY" id="ZY" value="${pd.ZY }" maxlength="32" placeholder="这里输入职业" title="职业"  style="width:98%"/></td>
									        <td style="width:150px;text-align: right;padding-top: 13px;">工作单位及地址</td>
											<td><input type="text" name="DZ" id="DZ" value="${pd.DZ }" maxlength="50" placeholder="这里输入工作单位及地址" title="工作单位及地址"  style="width:98%"/></td>
									   </tr>
									   <tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">门诊就诊流水</td>
											<td><input type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH }" maxlength="32" placeholder="这里输入门诊就诊流水" title="门诊就诊流水" style="width:98%"/></td>
										    <td style="width:150px;text-align: right;padding-top: 13px;">住院号</td>
											<td><input type="text" name="ZYH" id="ZYH" value="${pd.ZYH }" maxlength="32" placeholder="这里输入住院号" title="住院号" style="width:98%"/></td>
										</tr>
										<tr>
									        <td style="width:150px;text-align: right;padding-top: 13px;">准予住院日期</td>
											<td><input class="span10 date-picker" name="ZYZYRQ" id="ZYZYRQ" value="${pd.ZYZYRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="准予住院日期"  title="准予住院日期" style="width:98%"/></td>
										    <td style="width:150px;text-align: right;padding-top: 13px;">住院日期</td>
											<td><input class="span10 date-picker" name="ZYRQ" id="ZYRQ" value="${pd.ZYRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="住院日期"  title="住院日期" style="width:98%"/></td>
									   </tr>
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">科室名称<span style="color:red; font-size:14px">*</span></td>
										    <td id="ks">
										        <input type="hidden" id="ksbm" name="KSBM" value="${pd.KSBM }"/>
												<input type="text" id="ksmc" name="KSMC" readonly="readonly" style="width: 65%" value="${pd.KSMC }"/>
												<a class="btn btn-mini btn-purple" onclick="chooseDepart();">科室菜单</a>
									        </td>
									         <td style="width:150px;text-align: right;padding-top: 13px;">门诊诊断名称</td>
										    <td id="mzzd">
										       <input type="text" name="MZZDMC" id="MZZDMC" value="${pd.MZZDMC}" readonly="readonly" style="width:65%;"/>
										        <a class="btn btn-mini btn-purple" onclick="chooseDiagnosis();">门诊诊断菜单</a>
										        <input type="hidden" name="JZZDBM" id="JZZDBM" value="${pd.JZZDBM }" />
										    </td>
										    </tr>
										    <tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">医生姓名<span style="color:red; font-size:14px">*</span></td>
										    <td id="ys">
										        <input type="hidden" name="ZZYSGH" id="ZZYSGH" value="${pd.ZZYSGH }" />
									            <input type="text" name="ZZYSXM" id="ZZYSXM" value="${pd.ZZYSXM}" readonly="readonly" style="width:65%;"/>
										        <a class="btn btn-mini btn-purple" onclick="docDate();">医生列表</a>
									        </td>
									        
									        <td style="width:150px;text-align: right;padding-top: 13px;">经办人</td>
											<td><input type="text" name="JBR" id="JBR" value="${pd.JBR }" maxlength="20" placeholder="这里输入经办人" title="经办人" style="width:98%"/></td> 
										</tr>
										<tr>   
										    
										    <td style="width:150px;text-align: right;padding-top: 13px;">预交住院费金额</td>
											<td><input type="text" name="YJZYF" id="YJZYF" value="${pd.YJZYF }" maxlength="32" placeholder="这里输入预交住院费金额" title="预交住院费金额" style="width:98%"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">费用类别</td>
											<td>
											     <select class="form-control"  name="FYLB" id="fylb" style="width:98%">
											         <option value="" selected="true" >请选择费用类别</option>
											         <c:forEach items="${pd.enumHospitalizationFylb}" var="fylb">
		                                             <option value="${fylb.key}" <c:if test="${pd.FYLB == fylb.key}"> selected="selected" </c:if> >${fylb.value}</option>
		                                        </c:forEach>
											     </select>
											</td>
										</tr>
									     <tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">病情</td>
											<td>
											<select class="form-control"  id="BQ" name="BQ" style="width:98%">
											    <option value="" selected="true" >请选择病情</option>
		                                        <c:forEach items="${pd.enumHospitalizationBq}" var="bq">
		                                             <option value="${bq.key}" <c:if test="${pd.BQ == bq.key}"> selected="selected" </c:if> >${bq.value}</option>
		                                        </c:forEach>
		                                    </select>
		                                    </td>
											<td style="width:150px;text-align: right;padding-top: 13px;">体位</td>
											<td>
											     <select class="form-control"  name="TW" id="tw" style="width:98%">
											         <option value="" selected="true">请选择体位</option>
											         <c:forEach items="${pd.enumHospitalizationTw}" var="tw">
		                                                  <option value="${tw.key}" <c:if test="${pd.TW == tw.key}"> selected="selected" </c:if> >${tw.value}</option>
		                                             </c:forEach>
											    </select>
											</td>
										 </tr>
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">运送方法</td>
											<td>
											     <select class="form-control"  name="YSFS" id="ysfs" style="width:98%">
											         <option value="" selected="true" >请选择运送方法</option>
											         <c:forEach items="${pd.enumHospitalizationYsfs}" var="ysfs">
		                                                 <option value="${ysfs.key}" <c:if test="${pd.YSFS == ysfs.key}"> selected="selected" </c:if> >${ysfs.value}</option>
		                                             </c:forEach>
		                                          </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">隔离</td>
											<td>
											     <select class="form-control"  name="GL" id="gl" style="width:98%">
											         <option value="" selected="true" >请选择隔离</option>
											         <c:forEach items="${pd.enumHospitalizationGl}" var="gl">
		                                                <option value="${gl.key}" <c:if test="${pd.GL == gl.key}"> selected="selected" </c:if> >${gl.value}</option>
		                                             </c:forEach>		
											     </select>
											</td>
											</tr>
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">卫生处理</td>
											<td>
											     <select class="form-control"  name="WSCL" id="wscl" style="width:98%">
											         <option value="" selected="true" >请选择卫生处理</option>
											         <c:forEach items="${pd.enumHospitalizationWscl}" var="wscl">
		                                                 <option value="${wscl.key}" <c:if test="${pd.WSCL == gl.key}"> selected="selected" </c:if> >${wscl.value}</option>
		                                             </c:forEach>		
											     </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">特殊处理事由</td>
											<td>
											     <select class="form-control"  name="TSCLSY" id="tsclsy" style="width:98%">
											         <option value="" selected="true" >请选择特殊处理事由</option>
											        <c:forEach items="${pd.enumHospitalizationTsclsy}" var="tsclsy">
		                                                <option value="${tsclsy.key}" <c:if test="${pd.TSCLSY == tsclsy.key}"> selected="selected" </c:if> >${tsclsy.value}</option>
		                                             </c:forEach>
											     </select>
											</td>
											</tr>
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">领导处理意见</td>
											<td><input type="text" name="LDCLYJ" id="LDCLYJ" value="${pd.LDCLYJ }" maxlength="50" placeholder="这里输入领导处理意见" title="领导处理意见" style="width:98%"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">状态</td>
											<td>
											     <select name="ZT" id="zt" style="width:98%">
											         <option value="0" <c:if test="${pd.ZT == '0' }">selected</c:if> >正常</option>
										             <option value="1" <c:if test="${pd.ZT == '1' }">selected</c:if> >作废</option>
										             <%-- <option value="9" <c:if test="${pd.ZT == '9' }">selected</c:if> >删除</option> --%>
											     </select>
											</td>
											</tr>
											<input type="hidden"  name="SCSJ" id="SCSJ"  value="${pd.SCSJ }" title="生成时间" />
									        <input type="hidden"  name="XGSJ" id="XGSJ"  value="${pd.XGSJ }"  title="修改时间" />
										    <tr>
											<td class="center" colspan="6">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
											 <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
												
											</td>
										    </tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    }
	
	/* $(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		} 
	}*/
	);
	
	/* function closeWindow(){
		 var browserName=navigator.appName;
		 if (browserName=="Netscape") {
		  window.open('','_parent',''); window.close();
		 } else if (browserName=="Microsoft Internet Explorer") {
		  window.opener = "whocares"; window.close(); 
		 }
		} */
	
	//保存
	function save(){
		
		if($("#XM").val()==""){
			$("#XM").tips({
				side:3,
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#XM").focus();
			return false;
		}
		if($("#XB").val()==""){
			$("#XB").tips({
				side:3,
	            msg:'请输入性别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#XB").focus();
			return false;
		}
		if($("#NL").val()==""){
			$("#NL").tips({
				side:3,
	            msg:'请输入年龄',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NL").focus();
			return false;
		}
		
		if($("#KSMC").val()==""){
			$("#KSMC").tips({
				side:3,
	            msg:'输入科室名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#KSMC").focus();
			return false;
		}
		
		if($("#ZZYSXM").val()==""){
			$("#ZZYSXM").tips({
				side:3,
	            msg:'请输入医生姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ZZYSXM").focus();
			return false;
		}
		
			$("#hospitalizationForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
	}
	
	<%-- 通过居民身份证查询居民基本信息 --%>
	function IdcardSearch(){
		var zjhm = $("#ZJHM").val();  	 //身份证
		var zjlx = $("#ZJLX").val(); 
		var xm = $("#XM").val();  
		// var kh = $("#KH").val();
		var sjhm = $("#SJHM").val();
		// var klx = $("#KLX").val();
        $.ajax({
            type: "POST",
            url: '<%=basePath%>patient/idcardSearch.do',
            data: {
            	ZJHM:zjhm,
            	ZJLX:zjlx,
                   XM:xm,
                  // KH:kh,
                SJHM:sjhm
               // KLX:klx
            },
            success: function (data) {
                   if("success" != data.result){
                      $("#ZJHM").val(data.ZJHM);
		              $("#ZJLX").val(data.ZJLX);
		              $("#XM").val(data.XM);
		             // $("#KH").val(data.KH);
		              $("#SJHM").val(data.SJHM);
		             // $("#KLX").val(data.KLX);
	           }
            }
        });
    }
	
	//科室菜单
	function chooseDepart(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "科室菜单";
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
		  
            	var ZZYSGH = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
            	if(ZZYSGH!=''){
            		$("#ZZYSGH").val(ZZYSGH);
                	$("#ZZYSXM").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
                	$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
                	diag.close();
            	}
         };
		 diag.show();
	}
	
	//门诊诊断菜单
	function chooseDiagnosis(){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="门诊诊断";
			 diag.URL = '<%=basePath%>hospitalization/getDiagnosis.do';
			 diag.Width = 900;
			 diag.Height = 575;
			 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
			 diag.OKEvent = function(){
					  
		            	var BM = diag.innerFrame.contentWindow.document.getElementById('BM').value;
		            	if(BM!=''){
		            		$("#JZZDBM").val(BM);
		                	$("#MZZDMC").val(diag.innerFrame.contentWindow.document.getElementById('MC').value);
		                	diag.close();
		            	}
		         };
			 diag.show();
	}
	
	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	
	
</script>
</html>