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
								<form action="patient/${msg }.do" name="patientForm" id="patientForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
									<input type="hidden" name="YWSCSJ" id="YWSCSJ" value="${pd.YWSCSJ }" title="生成时间" />
									<input type="hidden" name="XGBZ" id="XGBZ"  value="0"  title="修改标识" />
									<input type="hidden" name="YLJGDM" id="YLJGDM"  value="${pd.YLJGDM }" title="医疗机构代码" />
									   <tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">卡号<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="KH" id="KH" value="${pd.KH }" maxlength="32" placeholder="这里输入卡号" title="卡号"  style="width:190px;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">卡类型<span style="color:red; font-size:14px">*</span></td>
											<td>
											<select class="form-control"  name="KLX" id="KLX" style="width:98%;">
		                                         <option value="" selected >请选择</option>
		                                         <c:forEach items="${pd.enumPatientKlx}" var="klx">
                                                       <option value="${klx.key}" <c:if test="${pd.KLX == klx.key}"> selected="selected" </c:if> >${klx.value}</option>
                                                 </c:forEach>
		                                     </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">发卡地区<span style="color:red; font-size:14px">*</span></td>
											<td><input type="text" name="FKDQ" id="FKDQ" value="${pd.FKDQ }" maxlength="6" placeholder="社保卡发卡地区的编号" title="发卡地区编号" style="width:190px;"/></td>
										</tr>
										
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">健康卡号</td>
											<td><input type="text" name="JKKH" id="jkkh" value="${pd.JKKH }" maxlength="20" placeholder="这里输入健康卡号" title="健康卡号" style="width:98%;"/></td>
											
											<td style="width:150px;text-align: right;padding-top: 13px;">患者归属地</td>
											<td>
											<select name="HZGSD" id="HZGSD" style="width:98%;">
											         <option value="" selected >请选择</option>
										             <c:forEach items="${pd.enumPatientGsd}" var="hzgsd">
										                <option value="${hzgsd.key}" <c:if test="${pd.HZGSD == hzgsd.key}"> selected="selected" </c:if> >${hzgsd.value}</option>
		                                             </c:forEach>
											     </select>
											 </td>
											 <td style="width:150px;text-align: right;padding-top: 13px;">出生地编码</td>
											 <td><input type="text" name="CSD" id="csd" value="${pd.CSD }" maxlength="32" placeholder="这里输入出生地编码" title="出生地编码" style="width:98%;"/></td>
										</tr>
									
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">姓名<span style="color:red; font-size:14px">*</span></td>
											<td>
											<input type="text" name="XM" id="XM" value="${pd.XM}" maxlength="32"  style="width:60%;"/>
										    <a class="btn btn-mini btn-purple" onclick="jmxxDate();">居民列表</a></td>
										    
											<td style="width:150px;text-align: right;padding-top: 13px;">性别<span style="color:red; font-size:14px">*</span></td>
											<td>
											     <select name="XB" id="XB" style="width:98%;">
											         <option value="" selected >请选择</option>
											         <option value="0" <c:if test="${pd.XB == '0' }">selected</c:if> >未知性别</option>
										             <option value="1" <c:if test="${pd.XB == '1' }">selected</c:if> >男</option>
										             <option value="2" <c:if test="${pd.XB == '2' }">selected</c:if> >女</option>
										             <option value="9" <c:if test="${pd.XB == '9' }">selected</c:if> >未说明性别</option>
											     </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">出生日期</td>
											<td><input name="CSRQ"  id="CSRQ" value="${pd.CSRQ}" type="text"  maxlength="8" placeholder="这里输入出生日期（yyyymmdd）"  title="出生日期" style="width:98%;"/></td>
										</tr>
										<tr>
										    <td style="width:150px;text-align: right;padding-top: 13px;">婚姻状况</td>
											<td>
											     <select name="HYZK" id="hyzk" style="width:98%;">
											         <option value="" selected >请选择</option>
											               <c:forEach items="${pd.enumMarriage}" var="hyzk">
		                                                         <option value="${hyzk.key}" <c:if test="${pd.HYZK == hyzk.key}"> selected="selected" </c:if> >${hyzk.value}</option>
		                                                   </c:forEach>
											     </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">证件号码</td>
											<td><input type="text" name="ZJHM" id="ZJHM" value="${pd.ZJHM}" maxlength="32" placeholder="这里输入身份证号" title="身份证号" style="width:98%;"/></td>
								            <td style="width:150px;text-align: right;padding-top: 13px;">身份证件类别</td>
											<td id="zjlx">
									          <select class="form-control" id="ZJLX" name="ZJLX" style="width:98%;">
									               <option value="" selected >请选择</option>
                                                        <c:forEach items="${pd.dictCardType}" var="item">
                                                             <option value="${item.value.ADDITIONAL}" <c:if test="${pd.ZJLX == item.value.ADDITIONAL}"> selected="selected" </c:if> >${item.value.NAME}</option>
                                                        </c:forEach>
                                             </select>
											</td>
											</tr>
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">居住地址</td>
											<td><input type="text" name="JZDZ" id="JZDZ" value="${pd.JZDZ }" maxlength="50" placeholder="这里输入居住地址" title="居住地址" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">民族</td>
											<td id="mz">
									              <select class="form-control" id="mz" name="MZ" style="width:98%;">
									                  <option value="" selected >请选择</option>
                                                           <c:forEach items="${pd.dictNation}" var="nation">
                                                                <option value="${nation.value.ADDITIONAL}" <c:if test="${pd.MZ == nation.value.ADDITIONAL}"> selected="selected" </c:if> >${nation.value.NAME}</option>
                                                           </c:forEach>
                                                  </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">国籍</td>
											<td id="gj">
									              <select class="form-control" id="gj" name="GJ" style="width:98%;">
									                   <option value="" selected >请选择</option>
                                                            <c:forEach items="${pd.dictNationality}" var="nationality">
                                                                <option value="${nationality.value.ADDITIONAL}" <c:if test="${pd.GJ == nationality.value.ADDITIONAL}"> selected="selected" </c:if> >${nationality.value.NAME}</option>
                                                            </c:forEach>
                                                   </select>
											</td>
											</tr>
											
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">电话号码</td>
											<td><input type="text" name="DHHM" id="dhhm" value="${pd.DHHM }" maxlength="24" placeholder="这里输入电话号码" title="电话号码" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">手机号码</td>
											<td><input type="text" name="SJHM" id="SJHM" value="${pd.SJHM }" maxlength="20" placeholder="这里输入手机号码" title="手机号码" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">医院内部档案号</td>
											<td><input type="text" name="PERSONID" id="personid" value="${pd.PERSONID }" maxlength="64" placeholder="这里输入医院内部档案号" title="医院内部档案号" style="width:98%;"/></td>
											</tr>
											
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">工作单位名称</td>
											<td><input type="text" name="GZDWMC" id="gzdwmc" value="${pd.GZDWMC }" maxlength="50" placeholder="这里输入工作单位名称" title="工作单位名称" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">工作单位地址</td>
											<td><input  type="text" name="GZDWDZ" id="gzdwdz" value="${pd.GZDWDZ }" maxlength="50" placeholder="这里输入工作单位地址" title="工作单位地址" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">工作单位邮编</td>
											<td><input type="text" name="GZDWYB" id="gzdwyb" value="${pd.GZDWYB }" maxlength="6" placeholder="这里输入工作单位邮编" title="工作单位邮编"  style="width:98%;"/></td>
											</tr>
											
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">户口地址</td>
											<td><input type="text" name="HKDZ" id="hkdz" value="${pd.HKDZ }" maxlength="50" placeholder="这里输入户口地址" title="户口地址" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">户口地址邮编</td>
											<td><input type="text" name="HKDZYB" id="hkdzyb" value="${pd.HKDZYB }" maxlength="6" placeholder="这里输入户口地址邮编" title="户口地址邮编" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">密级</td>
											<td>
											     <select name="MJ" id="mj" style="width:98%;">
											         <option value="0" <c:if test="${pd.MJ == '0' }">selected</c:if> >无特控</option>
										             <option value="1" <c:if test="${pd.MJ == '1' }">selected</c:if> >患者申明特控</option>
											     </select>
											</td>
											</tr>
											
											<tr>
											<td style="width:140px;text-align: right;padding-top: 13px;">联系人姓名</td>
											<td><input type="text" name="LXRXM" id="lxrxm" value="${pd.LXRXM }" maxlength="32" placeholder="这里输入联系人姓名" title="联系人姓名" style="width:98%;"/></td>
											<td style="width:180px;text-align: right;padding-top: 13px;">联系人与患者的关系</td>
											<td style="width:200px;">
											     <select name="LXRGX" id="lxrgx" style="width:98%;">
											         <option value="" selected >请选择</option>
										             <c:forEach items="${pd.enumPatientLxrgx}" var="lxrgx">
										              <option value="${lxrgx.key}" <c:if test="${pd.LXRGX == lxrgx.key}"> selected="selected" </c:if> >${lxrgx.value}</option>
		                                             </c:forEach>
											     </select>
											</td>
											<td style="width:150px;text-align: right;padding-top: 13px;">联系人电话</td>
											<td><input type="text" name="LXRDH" id="lxrdh" value="${pd.LXRDH }" maxlength="24" placeholder="这里输入联系人电话" title="联系人电话" style="width:98%;"/></td>
											</tr>
											
											<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">联系人地址</td>
											<td><input type="text" name="LXRDZ" id="lxrdz" value="${pd.LXRDZ }" maxlength="50" placeholder="这里输入联系人地址" title="联系人地址" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">联系人邮编</td>
											<td><input  type="text" name="LXRYB" id="lxryb" value="${pd.LXRYB }" maxlength="6" placeholder="这里输入联系人邮编" title="联系人邮编" style="width:98%;"/></td>
											<td style="width:150px;text-align: right;padding-top: 13px;">修改标识<span style="color:red; font-size:14px">*</span></td>
											<td>
											   <select name="XGBZ" id="XGBZ" title="修改标识" style="width:98%;" disabled>
										       <option value="0" <c:if test="${pd.XGBZ == '0' }">selected</c:if> >正常</option>
										       <option value="1" <c:if test="${pd.XGBZ == '1' }">selected</c:if> >作废</option>
										       </select>
										    </td>
											</tr>
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
    });
	//保存
	function save(){
		if($("#KH").val()==""){
			$("#KH").tips({
				side:3,
	            msg:'请输入卡号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#KH").focus();
			return false;
		}
		if($("#KLX").val()==""){
			$("#KLX").tips({
				side:3,
	            msg:'请选择卡类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#KLX").focus();
			return false;
		}
		
		if($("#FKDQ").val()==""){
			$("#FKDQ").tips({
				side:3,
	            msg:'请输入社保卡发卡地区',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FKDQ").focus();
			return false;
		}
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
			$("#patientForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
	}
	
	<%-- 通过居民身份证查询居民基本信息 --%>
	<%-- function IdcardSearch(){
		var zjhm = $("#ZJHM").val();  	 //身份证
		var zjlx = $("#ZJLX").val(); 
		var xm = $("#XM").val();  
	    var kh = $("#KH").val();
		var sjhm = $("#SJHM").val();
		var klx = $("#KLX").val();
		var jzdz = $("#JZDZ").val();
		var xb = $("#XB").val();
        $.ajax({
            type: "POST",
            url: '<%=basePath%>patient/idcardSearch.do',
            data: {
            	ZJHM:zjhm,
            	ZJLX:zjlx,
                   XM:xm,
                   KH:kh,
                SJHM:sjhm,
                 KLX:klx,
                 JZDZ:jzdz,
                 XB:xb
            },
            success: function (data) {
                   if("success" != data.result){
                      $("#ZJHM").val(data.ZJHM);
		              $("#ZJLX").val(data.ZJLX);
		              $("#XM").val(data.XM);
		             $("#KH").val(data.KH);
		              $("#SJHM").val(data.SJHM);
		             $("#KLX").val(data.KLX);
		             $("#JZDZ").val(data.JZDZ);
		             $("#XB").val(data.XB);
	           }
            }
        })
    } --%>
	
	
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
	
	//居民列表
	function jmxxDate(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民列表";
		 diag.URL = '<%=basePath%>agreementApply/getJMXX.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
            	var MEMBER_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
            	if(MEMBER_ID!=''){
                	$("#XM").val(diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value);
                	$("#KH").val(diag.innerFrame.contentWindow.document.getElementById('MI_CARD').value);
                	$("#KLX").val('1');
                	$("#ZJHM").val(diag.innerFrame.contentWindow.document.getElementById('ID_NUMBER').value);
                	$("#ZJLX").val('01');
                	$("#SJHM").val(diag.innerFrame.contentWindow.document.getElementById('TELEPHONE').value);
                	$("#XB").val(diag.innerFrame.contentWindow.document.getElementById('SEX').value);
                	diag.close();
            	}
         };
		 diag.show();
	}
</script>
</html>