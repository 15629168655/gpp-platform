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
<!-- 弹出服务包新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}
		.commitopacity{position:absolute; width:100%; height:700px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:100%; margin:0px auto; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:255px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:253px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:195px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
	</style>
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
						<form action="treateCaseModel/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="TREATE_MODEL_ID" id="TREATE_MODEL_ID" value="${pd.TREATE_MODEL_ID }"/>
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" name="RESIDENT_ID" id="RESIDENT_ID"  value="${pd.RESIDENT_ID }" />
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr> 
									<td style="width:180px;text-align: right;padding-top: 13px;">方案模板名称<span class="red">*</span>:</td>
									<td><input type="text" name="MODEL_NAME" id="MODEL_NAME" value="${pd.MODEL_NAME }" placeholder="这里输入名称" maxlength="40" title="这里输入名称" style="width:100%;" /></td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">适用人群<span class="red">*</span>:</td>
									<td>
										<select class="form-control"  name="SUIT_PEOPLE" id="SUIT_PEOPLE" style="width:100%">
									         <option value="" selected="selected">---请选择适用人群---</option>
									         <c:forEach items="${DISEASENAME}" var="tw">
                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.SUIT_PEOPLE}">selected="selected" </c:if> >${tw.value}患者</option>
                                             </c:forEach>
								    	</select>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">病种名称<span class="red">*</span>:</td>
									<td>
										<select class="form-control"  name="DISEASE_NAME" id="DISEASE_NAME" style="width:100%" >
									         <option value="" selected="selected">---请选择病种名称---</option>
									         <c:forEach items="${DISEASENAME}" var="tw">
	                                                 <option value="${tw.key}" <c:if test="${tw.key == pd.DISEASE_NAME}"> selected="selected" </c:if> >${tw.value}</option>
	                                            </c:forEach>
								    	</select>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">治疗次数<span class="red">*</span>:</td>
									<td>
										<input type="number"  name="TREATE_COUNT" id="TREATE_COUNT"  value="${pd.TREATE_COUNT }" placeholder="治疗次数"  title="医生"  style="width:100%;"/>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">间隔的时间<span class="red">*</span>:</td>
									<td>
										<table>
											<tr>
												<td style="width: 500px">
													<input  name="INTERVAL_TIME" id="INTERVAL_TIME"  value="${pd.INTERVAL_TIME }" type="number"  style="width:100%;" placeholder="方案时间" title="方案时间"/>
												</td>
												<td style="width: 100px">
													<select class="form-control"  name="INTERVAL_COMPANY" id="INTERVAL_COMPANY" style="width:100%">
												         <option value="" selected="selected">------</option>
												         <c:forEach items="${INTERVALCOMPANY}" var="tw">
			                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.INTERVAL_COMPANY}"> selected="selected" </c:if> >${tw.value}</option>
			                                             </c:forEach>
												    </select>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">模板类型:<span class="red">*</span>:</td>
									<td>
										<select class="form-control"  name="TYPE" id="TYPE" style="width:100%" >
									         <option value="" selected="selected">---模板类型---</option>
									         <c:forEach items="${TYPE}" var="tw">
                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.TYPE}"> selected="selected" </c:if> >${tw.value}</option>
                                             </c:forEach>
									    </select>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">创建人姓名:<span class="red">*</span>:</td>
									<td>
										<input onclick="choseDoctor()" type="text" readonly="readonly" name="PROVIDER_NAME" id="PROVIDER_NAME"  value="${pd.PROVIDER_NAME }" placeholder="点击选择"  title="医生"  style="width:100%;" />
										<input onclick="choseDoctor()" type="hidden" readonly="readonly" name="PROVIDER_ID" id="PROVIDER_ID"  value="${pd.PROVIDER_ID }" placeholder="点击选择"  title="医生"  style="width:100%;" />
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">创建人机构:<span class="red">*</span>:</td>
									<td>
										<input type="text" readonly="readonly" name="ORG_NAME" id="ORG_NAME"  value="${pd.ORG_NAME }" placeholder="创建人机构"  title="机构"  style="width:100%;"/>
										<input type="hidden" readonly="readonly" name="ORG_CODE" id="ORG_CODE"  value="${pd.ORG_CODE }" placeholder="创建人医生"  title="医生"  style="width:100%;"/>
									</td>
								</tr>
								<tr>
									<td style="width:180px;text-align: right;padding-top: 13px;">模板内容:</td>
									<td style="padding-top: 3px;" id="CONTENT" >
										 <script id="editor" name="MODEL_CONTENT" type="text/plain" style="width:600px;height:159px;">${pd.MODEL_CONTENT }</script>
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
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/fhsms.js"></script>
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
	UE.getEditor('content');
	UE.getEditor('suggestion');
	$(function() {
		//日期框
		$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
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
	function choseDoctor() {
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
           		$("#PROVIDER_ID").val(GEN_PRACTITIONER_ID);
               	$("#PROVIDER_NAME").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
               	diag.close();
           	}
        };
		 diag.show();
	}
	function save(){
		if($("#MODEL_NAME").val()==""){
			$("#MODEL_NAME").tips({
				side:3,
	            msg:'请输入模板名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MODEL_NAME").focus();
			return false;
		} else {
			$("#MODEL_NAME").val($.trim($("#MODEL_NAME").val()));
		}
		
		if($("#PROVIDER_NAME").val()==""){
			$("#PROVIDER_NAME").tips({
				side:3,
	            msg:'请选择医生',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PROVIDER_NAME").focus();
			return false;
		}else{
			$("#PROVIDER_NAME").val($.trim($("#PROVIDER_NAME").val()));
		}	
		if($("#SUIT_PEOPLE").val()==""){
			$("#SUIT_PEOPLE").tips({
				side:3,
	            msg:'请选择适用的人群',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#SUIT_PEOPLE").focus();
			return false;
		}else{
			$("#SUIT_PEOPLE").val($.trim($("#SUIT_PEOPLE").val()));
		}
		if($("#DISEASE_NAME").val()==""){
			$("#DISEASE_NAME").tips({
				side:3,
	            msg:'请选择病种名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#DISEASE_NAME").focus();
			return false;
		}else{
			$("#DISEASE_NAME").val($.trim($("#DISEASE_NAME").val()));
		}
		if($("#TREATE_COUNT").val()==""){
			$("#TREATE_COUNT").tips({
				side:3,
	            msg:'请输入治疗次数',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TREATE_COUNT").focus();
			return false;
		}else{
			$("#TREATE_COUNT").val($.trim($("#TREATE_COUNT").val()));
		}
		
		if($("#INTERVAL_TIME").val()==""){
			$("#INTERVAL_TIME").tips({
				side:3,
	            msg:'请输入间隔时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INTERVAL_TIME").focus();
			return false;
		}else{
			$("#INTERVAL_TIME").val($.trim($("#INTERVAL_TIME").val()));
		}
		if($("#INTERVAL_COMPANY").val()==""){
			$("#INTERVAL_COMPANY").tips({
				side:3,
	            msg:'请输入间隔单位',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INTERVAL_COMPANY").focus();
			return false;
		}else{
			$("#INTERVAL_COMPANY").val($.trim($("#INTERVAL_COMPANY").val()));
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请选择类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TYPE").focus();
			return false;
		}else{
			$("#TYPE").val($.trim($("#TYPE").val()));
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	

</script>
</html>